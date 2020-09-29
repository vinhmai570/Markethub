<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Order extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Order_model');
        $this->auth = new Auth();
    }

    public function index()
    {
        
    }
    
    public function insertOrder_post()
    {
        $token = $this->auth->getUserByToken();
        if ($token) {
            $userID = $token['id'];
            $totalPrice = $this->post('totalPrice');
            $totalProduct = $this->post('totalProduct'); // 
            $productOrder = $this->post('productOrder');
            $phone = $this->post('phone');
            $address = $this->post('address');
            $email = $this->post('email');
            $orderDate = date("Y-m-d h:i:sa");
            if ($userID!='' && $totalPrice!='' && $totalProduct!='' && $productOrder!='' && $phone!='' && $address !='') {
                $productID = $productOrder[0]['productID'];             
                $product = $this->Order_model->getProductByID($productID); // get product then get shop_id
                $shopID = $product->user_id;
                $order = array(
                    'user_id' => $userID,
                    'shop_id' => $shopID,
                    'total_price' => $totalPrice,
                    'order_address' => $address,
                    'order_phone' => $phone,
                    'status' => 0,
                    'order_date' => $orderDate
                );
                $orderID = $this->Order_model->insertOrder($order);
                if ($orderID) {
                    foreach ($productOrder as $key => $product) {
                        $orderItem = array(
                            'order_id' => $orderID,
                            'product_id' => $product['productID'],
                            'price' => $product['price'],
                            'quantity' => $product['quantity'],
                            'total_discount' => $product['total_discount']
                        );  
                        $this->Order_model->insertOrderItem($orderItem);
                    }
                    $productOrder = $this->Order_model->getProductByOrderID($orderID);
                    foreach ($productOrder as $key => $product) {
                        $this->Order_model->updateProductOrder($product['product_id'],$product['quantity']);
                    }
                    $message = array(
                        'status' => true,
                        'message' => "Đặt hàng thành công"
                    );
                    $this->response($message, 201);         
                }
            } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Order error'
                    );
                    $this->response($message, 404);
                }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
        }
        
    }

    public function orders_get()
    {   
        $status = $this->get('status');
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['permission']==='unknown') {
            $this->response($getPermission,401);
            return 0;
        }
        $userID = $getPermission['user_id'];
        if ($status == 'confirmed') {                       // get orders confirmed
            if ($getPermission['permission'] == 'editor')  {            
                $order = $this->Order_model->orderListConfirmed($userID,1);         
                $this->response($order,200);
            } else if($getPermission['permission'] == 'user')  {
                $order = $this->Order_model->orderListConfirmed($userID,0);
                $this->response($order,200);
            } else if($getPermission['permission'] == 'admin') {                    // admin
                $userID = $this->get('userid');
                $order = $this->Order_model->orderListConfirmed($userID,0, 'admin');
                $this->response($order,200);
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Authorization',
                    'permission' => $getPermission['permission']
                );
                $this->response($message,401);
            }
        } else {                         // get orders to confirmed
            if ($getPermission['permission'] == 'editor')  {
                $userID = $getPermission['user_id'];
                $order = $this->Order_model->orderListToConfirm($userID,1);
                $this->response($order,200);
            } else if($getPermission['permission'] == 'user')  {
                $order = $this->Order_model->orderListToConfirm($userID,0);
                $this->response($order,200);
            }  else if($getPermission['permission'] == 'admin') {
                $userID = $this->get('userid');
                $order = $this->Order_model->orderListToConfirm($userID,0,'admin');
                $this->response($order,200);
            }  else {
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        }

    }

    public function orderItems_get($orderID)
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['permission']==='unknown') {
            $this->response($getPermission,401);
            return 0;
        }
        $order = $this->Order_model->getOrderByOrderID($orderID);
        if ($order == null) {
            $message = array(
                'status' => false,
                'message' => 'Order ID Not Found'
            );
            $this->response($message,404);
            return 0;
        }
        $userID = $getPermission['user_id'];
        // get orders confirmed
        if ($getPermission['permission'] == 'editor')  {            
            if ($userID == $order->shop_id) {
                $orderItems = $this->Order_model->getOrderItems($orderID);
                $this->response($orderItems, 200);                
            }
        } else if($getPermission['permission'] == 'user')  {
            if ($userID == $order->user_id) {
                $orderItems = $this->Order_model->getOrderItems($orderID);
                $this->response($orderItems, 200);                
            }
        } else if($getPermission['permission'] == 'admin') {                    // admin
            $orderItems = $this->Order_model->getOrderItems($orderID);
            $this->response($orderItems, 200);
        } else {
            $message = array(
                'status' => false,
                'message' => 'Authorization',
                'permission' => $getPermission['permission']
            );
            $this->response($message,401);
        }
        
    }

    public function confirmOrder_put()
    {
        $orderID = $this->put('order_id');
        if ($orderID!='') {
            $getPermission = $this->auth->checkPermission();
            $checkAuth = false;
            if ($getPermission['permission'] == 'editor')  {
                $shopID = $this->Order_model->getOrderByOrderID($orderID)->shop_id;
                if ($shopID == $getPermission['user_id']) {         // product created by this user_id 
                    $checkAuth = true;
                }
            } 
            if($checkAuth == true) {                                // confirmed
                if ($this->Order_model->confirmOrder($orderID)) {
                    $message = array(
                        'status' => true,
                        'message' => 'Success'
                    );
                    $this->response($message,200);
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'error'
                    );
                    $this->response($message,400);
                }
            } else {                                 // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Please check param'
            );
            $this->response($message,404);
        }
    }

    public function delete_delete($orderID)
    {
        if ($orderID!='') {
            $getPermission = $this->auth->checkPermission();
            $order = $this->Order_model->getOrderByOrderID($orderID);
            if ($order == null) {
                $message = array(
                    'status' => false,
                    'message' => 'Order Not Found'
                );
                $this->response($message,404);
                return 0;
            }
            $checkAuth = false;
            if ($getPermission['permission'] == 'admin'){
                $checkAuth =true;
            } else if ($getPermission['permission'] == 'editor')  {
                $order = $this->Order_model->getOrderByOrderID($orderID);
                if ($order->shop_id == $getPermission['user_id']) {
                    $checkAuth = true;
                }
            } else if ($getPermission['permission'] == 'user') {
                if ($order->user_id == $getPermission['user_id']) {
                    $checkAuth = true;
                }
            }
            if($checkAuth == true) {                                // confirmed
                $productOrder = $this->Order_model->getProductByOrderID($orderID);
                if ($this->Order_model->deleteOrderItems($orderID)) {
                    if ($this->Order_model->deleteOrder($orderID)===1)  {
                        foreach ($productOrder as $key => $product) {
                            $this->Order_model->updateProductOrder($product['product_id'],$product['quantity'],true);
                        }
                        $message = array(
                            'status' => true,
                            'message' => 'Xóa thành công'
                        );
                        $this->response($message,200);
                    } else if($this->Order_model->deleteOrder($orderID)===404) {
                        $message = array(
                            'status' => false,
                            'message' => 'Sản phẩm đã xác nhận không thể xóa'
                        );
                        $this->response($message,400);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Error'
                        );
                        $this->response($message,400);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Error'
                    );
                    $this->response($message,400);
                }                    
            } else {                                 // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Please check param'
            );
            $this->response($message,404);
        }
    }
}

/* End of file Controllername.php */
