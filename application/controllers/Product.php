<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Product extends RestController {
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('Product_model');
        $this->auth = new Auth();
    }

    public function index()
    {
        
    }
    
    /**
    * get all product
    * 
    * @echo response json all product
    */
    public function getProducts_get()
    {
        $products = $this->Product_model->getProducts();
        if($products) {
            $this->response($products, 200);
        } 
    }

    /**
    * get product by ID
    * 
    * @param - product_id
    * @echo response json product
    */
    public function id_get($id)
    {
        $productByID = $this->Product_model->getProductByID($id);
        $this->response($productByID,200);
    }

     /**
    * Insert product from Client
    * 
    * @echo json message: success/error
    */
    public function insertProduct_post()
    {
        $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin' || $getPermission['permission'] == 'editor')  {
                    $checkAuth =true;
                }

                if($checkAuth == true) {                                // confirmed
                    $name = $this->post('productName', true);
                    $price = $this->post('price');
                    $categoryID = $this->post('category');
                    $shortDescription = $this->post('shortDescription', true);
                    $longDescription = $this->post('longDescription', true);
                    $discount = $this->post('discount');
                    $listImage = $this->post('listImage', true);
                    $avatar = $this->post('avatar', true);
                    $quantity= $this->post('quantity');
                    $userID= $this->post('userID');
                    $totalLike = 0;
                    $totalView = 1;
                    $rate = 5 ;
                    $status = 0;
                    $createDate = $updateDate= date("Y-m-d h:i:sa");
                    
                    if ($name!='' && $price!='' && $categoryID!='' && $shortDescription !='' && $longDescription!='' && $quantity!='' && $avatar !='' && $userID!='') {
                        $product = array(
                            'product_name'=> $name,
                            'price' => $price,
                            'category_id' => $categoryID,
                            'short_description' => $shortDescription,
                            'long_description' => $longDescription,
                            'discount' => $discount,
                            'list_image' => $listImage,
                            'avatar' => $avatar,
                            'quantity' => $quantity,
                            'total_like' => $totalLike,
                            'total_view' => $totalView,
                            'rate' => $rate,
                            'status' => $status,
                            'user_id' => $userID,
                            'create_date' => $createDate,
                            'update_date' => $createDate 
                        );
                        if ($this->Product_model->insertProduct($product)) {
                            $message = array(
                                'status' => true,
                                'message' => 'Success'
                            );
                            $this->response($message,200);
                        } else{
                            $message = array(
                                'status' => false,
                                'message' => 'Error'
                            );
                            $this->response($message,404);
                        }
                    } else  {
                        $message = array(
                            'status' => false,
                            'message' => 'Vui lòng nhập đầy đủ thông tin!'
                        );
                        $this->response($message,400);
                    }
                } else {                                 // not access
                    $message = array(
                        'status' => false,
                        'message' => 'Authorization'
                    );
                    $this->response($message,404);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,400);
            }
    }
    
    /**
    * update view in product
    * 
    * 
    * @echo message: true/false
    */
    public function updateViewProduct_put()
    {
        $productID= $this->put('productID');
        if ($productID!='') {
            if ($this->Product_model->updateViewProduct($productID)) {
                $message = array(
                    'status' => true,
                    'message' => 'Update Successful!'
                );
                $this->response($message,200);
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Update ERROR!'
                );
                $this->response($message,400);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Update ERROR, not paramater!'
            );
            $this->response($message,400);
        }
        
    }

    /**
    * update product
    * 
    * @echo message: true/false
    */
    public function updateProduct_put()
    {   

        $id= $this->put('id');
        if ($id!='') {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  {
                    $checkAuth =true;
                } else if ($getPermission['permission'] == 'editor') {
                    $productByID = $this->Product_model->getProductByID($id);
                    $userID = $productByID->user_id;
                    if ($userID == $getPermission['user_id']) {         // product created by this user_id 
                        $checkAuth = true;
                    }
                }

                if($checkAuth == true) {                                // confirmed
                    $name = $this->put('name', true);
                    $price = $this->put('price');
                    $category = $this->put('category');
                    $shortDescription = $this->put('shortDescription', true);
                    $longDescription = $this->put('longDescription', true);
                    $discount = $this->put('discount');
                    $listImage = $this->put('listImage', true);
                    $avatar = $this->put('avatar', true);
                    $quantity = $this->put('quantity');
                    $updateDate= date("Y-m-d h:i:sa");
                    
                    if ($name!='' && $price!='' && $category!='' && $shortDescription !='' && $longDescription!='' && $quantity!='') {
                        $product = array(
                            'product_name'=> $name,
                            'price' => $price,
                            'category_id' => $category,
                            'short_description' => $shortDescription,
                            'long_description' => $longDescription,
                            'discount' => $discount,
                            'list_image' => $listImage,
                            'avatar' => $avatar,
                            'quantity' => $quantity,
                            'update_date' => $updateDate 
                        );
                        if ($this->Product_model->updateProduct($product, $id)) {
                            $message = array(
                                'status' => true,
                                'message' => 'Success'
                            );
                            $this->response($message,200);
                        } else{
                            $message = array(
                                'status' => false,
                                'message' => 'Error'
                            );
                            $this->response($message,404);
                        }
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Vui lòng nhập đầy đủ thông tin!'
                        );
                        $this->response($message,400);
                    }
                } else {                                 // not access
                    $message = array(
                        'status' => false,
                        'message' => 'Authorization'
                    );
                    $this->response($message,404);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,400);
            }
        }
    }

    /**
    * delete product by ID
    * 
    * @echo message: true/false
    */
    public function delete_delete($id)
    {
        if ($id!='') {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  {
                    $checkAuth =true;
                } else if ($getPermission['permission'] == 'editor') {
                    $productByID = $this->Product_model->getProductByID($id);
                    $userID = $productByID->user_id;
                    if ($userID == $getPermission['user_id']) {         // product created by this user_id 
                        $checkAuth = true;
                    }
                }

                if($checkAuth == true) {                                // confirmed
                    $checkDelete = $this->Product_model->deleteProduct($id);
                    if ($checkDelete == 1) {
                        $message = array(
                            'status' => true,
                            'message' => 'Success'
                        );
                        $this->response($message,200);
                    } else if($checkDelete == 0) {
                        $message = array(
                            'status' => false,
                            'message' => 'Error'
                        );
                        $this->response($message,400);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Product Not found'
                        );
                        $this->response($message,404);
                    }
                } else {                                 // not access
                    $message = array(
                        'status' => false,
                        'message' => 'Authorization'
                    );
                    $this->response($message,404);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,400);
            }
        }
       
    }
   
}

/* End of file Controllername.php */