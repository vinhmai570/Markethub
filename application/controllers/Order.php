<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Order extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Order_model');
        $this->load->model('Cart_model');
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
            // $productOrder = $this->post('productOrder', true);
            $phone = $this->post('phone', true);
            $address = $this->post('address', true);
            $voucher = $this->post('voucher', true);
            $orderDate = date("Y-m-d h:i:sa");
            $cart = $this->Cart_model->getCartByUserID($userID);
            $totalOrder = count($cart);
            $i=0;
            if (!$phone||!$address){
                $message = array(
                    'status' => false,
                    'message' => 'Vui lòng nhập đủ thông tin'
                );
                $this->response($message, 200);
            }
            if(!$cart){
                $message = array(
                    'status' => false,
                    'message' => 'Chưa có sản phẩm nào trong giỏ hàng'
                );
                $this->response($message, 200);
            }
            foreach ($cart as $key => $cartItem) {
                $productOrder = $cartItem['product'];
                // var_dump($productOrder);
                $productOrder = json_decode($productOrder);
                $bill = $this->getBill_post($userID, $productOrder, $voucher, false);   // get bill return totalPrice + totalProduct
                $productID = $productOrder[0]->productID;  
                $product = $this->Order_model->getProductByID($productID); // get product then get shop_id
                $shopID = $product->user_id;
                $order = array(
                    'user_id' => $userID,
                    'shop_id' => $shopID,
                    'total_price' => $bill['price'],
                    'order_address' => $address,
                    'order_phone' => $phone,
                    'status' => 0,
                    'voucher'=> $voucher,
                    'order_date' => $orderDate
                );
                $orderID = $this->Order_model->insertOrder($order);
                if ($orderID) {
                    if ($voucher!=null && $voucher !='') {
                        $voucherInfo = $this->handleVoucher_post(false, $shopID, $voucher);
                    }
                    foreach ($productOrder as $key => $product) {
                        $productServer = $this->Order_model->getProductByID($product->productID); // get product then get shop_id
                        $price = $productServer->price-$productServer->price*$productServer->discount/100;
                        $orderItem = array(
                            'order_id' => $orderID,
                            'product_id' => $product->productID,
                            'price' => $price,
                            'quantity' => $product->quantity,
                            'total_discount' => isset($voucherInfo)?$voucherInfo->discount:0
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
                    $i++;
                    if($i==$totalOrder){
                        $this->Cart_model->deleteAllCartItems($userID);
                        $this->response($message, 201); 
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Order error'
                    );
                    $this->response($message, 404);
                }
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message, 200);
        }
    }

    /**
     * Get bill from product
     * 
     * @param @userID       default null, if null: get userID from token
     * @param $productOrder default null, if null: get productOrder from post request
     * @param $voucher      default null, if null: get voucher from post request 
     * @param $output       default true, if true: echo message, not return result
     */
    public function getBill_post($userID = null, $productOrder = null, $voucher = null, $output = true )
    {
        $token = $this->auth->getUserByToken();
        if ($token) {
            $userID = $userID?$userID:$token['id'];
            $productOrder = $productOrder?$productOrder:$this->post('productOrder', true);
            $voucher = $voucher?$voucher:$this->post('voucher', true);
            $voucherInfo = null;
            if ($userID!='' && $productOrder!='') {  
                // var_dump($productOrder);
                $productID = $productOrder[0]->productID;  
                $product = $this->Order_model->getProductByID($productID); // get product then get shop_id
                $shopID = $product->user_id;
            
                if ($voucher!=null && $voucher !='') {
                    $voucherInfo = $this->handleVoucher_post(false, $shopID, $voucher);
                }
                $totalPrice = 0;
                $totalProduct = 0;
                foreach ($productOrder as $key => $product) {                    
                    $productServer = $this->Order_model->getProductByID($product->productID); // get product then get shop_id
                    $nowPrice = ($productServer->price - $productServer->price*$productServer->discount/100);
                    if ($voucherInfo) {
                        $nowPrice = ($nowPrice - $nowPrice*$voucherInfo->discount/100);
                    }
                    $totalPrice = $totalPrice + $nowPrice*$product->quantity;
                    $totalProduct = $product->quantity;
                }   
                $message = array(
                    'status' => true,
                    'price'  => round($totalPrice,-2),
                    'totalProduct' => $totalProduct,
                    'voucherInfo' => $voucherInfo
                );
                if ($output) {
                    $this->response($message, 200);         
                } else {
                    return $message;
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Token not found'
                );
                if ($output) {
                    $this->response($message, 200);         
                } else {
                    return $message;
                }
            }
            
        }       
    }

    public function handleVoucher_post($print = true, $shopID = null, $voucher = null)
    {
        $voucher = $voucher?$voucher:$this->post('voucher');
        $shopID = $shopID?$shopID:$this->post('shopID');
        if($voucher!=''){
            $checkCodeVoucher = "select * from voucher where voucher_code = '$voucher'";
            $que = $this->db->query($checkCodeVoucher);
            $row = $que->num_rows();
            if($row < 1){
                $message = array(
                    'status' => false,
                    'message' => 'Voucher không tồn tại'
                );
                $this->response($message,200);
            } else {
                $VoucherRow = $que->row();
                $idVoucher = $VoucherRow->voucher_id;
                $checkExprireVoucher = "select * from voucher where $idVoucher = voucher_id and (DATEDIFF(CURDATE(), voucher.update_date) >= voucher.expiration or quantity <= 0)";
                $checkShopVoucher = "select * from voucher where $idVoucher = voucher_id and shop_id != $shopID";

                $que02 = $this->db->query($checkExprireVoucher);
                $row02 = $que02->num_rows();

                $que03 = $this->db->query($checkShopVoucher);
                $row03 = $que03->num_rows();

                if($row02 > 0){
                    $message = array(
                        'status' => false,
                        'message' => 'Voucher hết hạn'
                    );
                    $this->response($message,200);
                    return 0;
                } else {
                    if($row03 > 0){
                        $message = array(
                            'status' => false,
                            'message' => 'Voucher không hợp lệ',
                        );
                        $this->response($message,200);
                        return 0;
                    }
                }
                $infoVoucher = $que->row();
                $infoVoucher->status = true;
                if ($print === true) {
                    $this->response($infoVoucher,200);
                } else {
                    return $infoVoucher;
                }
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Voucher không hợp lệ',
            );
            $this->response($message,200);
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

    public function orderItems_get($orderID = 0)
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
                    $this->response($message,200);
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
                        $this->response($message,200);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Error'
                        );
                        $this->response($message,200);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Error'
                    );
                    $this->response($message,200);
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
