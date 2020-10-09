<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Cart extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Cart_model');
        $this->auth = new Auth();
        date_default_timezone_set('Asia/Saigon');
    }

    public function index()
    {
    }

    public function getCart_get()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['user_id']) {
            $userID = $getPermission['user_id'];
            $cart = $this->Cart_model->getCartItemByUserID($userID);
            $temp = array();
            foreach ($cart as $key => $cartItem) {
                $cartItem = json_decode($cartItem['product']);
                array_push($temp, $cartItem);
            }
            $cartItems=array();
            foreach ($temp as $key => $cartItem) {
                foreach ($cartItem as $key => $value) {
                    array_push($cartItems, $value);
                }
            }
            $this->response($cartItems, 200);
        } else {
            $message = array(
                'status' => false,
                'message' => 'Unauthorization'
            );
            $this->response($message, 401);
        }
    }

    public function addToCart_post()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['user_id']){
            $userID = $getPermission['user_id'];
            $productID = $this->post('productID');
            $shopID = $this->post('shopID');

            $cart = $this->Cart_model->getCartByUserID($userID);
            $createDate = date("Y-m-d h:i:sa");
            foreach ($cart as $key => $item) {
                $checkShop = false;
                if($item['shop_id'] == $shopID){
                    $products = json_decode($item['product']);
                    if(!is_array($products)) {
                        $message = array(
                            'status' => false,
                            'message' => "lỗi hệ thống, shopID: $shopID"
                        );
                        $this->response($message, 200);
                        return 0;
                    }
                    $checkProduct = false;
                    foreach ($products as $key => $product) {
                        if ($product->productID==$productID){
                            $product->quantity++;
                            $checkProduct = true;
                        }
                    }
                    if ($checkProduct==false){
                        $productItem= (object) array(
                            'productID' => $productID,
                            'quantity' => 1 
                        );
                        array_push($products,$productItem);
                    }
                    // var_dump($products);
                    $products = json_encode($products);
                    if ($this->Cart_model->addToCart($products, $item['cart_id'])) {
                        $message = array(
                            'status' => true,
                            'message' => 'Đã cập nhật giỏ hàng'
                        );
                        $this->response($message, 200);
                        return 0;
                    }
                    $checkShop = true;
                }
            }
            if ($checkShop==false) {
                $productItem= (object) array(
                    'productID' => $productID,
                    'quantity' => 1 
                );
                $products = array();
                array_push($products, $productItem);
                $products = json_encode($products);
                $data = array(
                    'user_id' => $userID,
                    'product' => $products,
                    'shop_id' => $shopID,
                    'create_at' => $createDate
                );
                if($this->Cart_model->insertCart($data)){
                    $message = array(
                        'status' => true,
                        'message' => 'Đã cập nhật giỏ hàng'
                    );
                    $this->response($message, 200);
                    return 0;
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'lỗi'
                    );
                    $this->response($message, 200);
                    return 0;
                }
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Unauthorization'
            );
            $this->response($message, 401);
        }
    }
    public function updateCartItem_patch()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['user_id']){
            $userID = $getPermission['user_id'];
            $productID = $this->post('productID');
            $shopID = $this->post('shopID');
            $quantity = $this->patch('quantity');
            $cart = $this->Cart_model->getCartItemByShopID($userID, $shopID);
            var_dump($cart);
            $products = $cart->product;
            $products = json_decode($products);

            foreach ($products as $key => $product) {
                if ($product->productID==$productID){
                    $product->quantity = $quantity;
                }
            }
            
            $products = json_encode($products);
            echo $products;

        } else {
            $message = array(
                'status' => false,
                'message' => 'UnAuthorization'
            );
            $this->response($message, 401);
        }
    }

    public function deleteCartItem()
    {
        # code...
    }

    

}

/* End of file Controllername.php */
