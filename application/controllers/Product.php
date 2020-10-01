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
        date_default_timezone_set('Asia/Saigon');
    }

    public function index()
    {
        
    }
    
    /**
    * get all product
    * 
    * @param start, limit - optional
    * @param orderby - discount/totalorder
    * @echo response json all product
    */
    public function getProducts_get()
    {
        $orderBy = $this->get('orderby',true);
        $start = $this->get('start', true);
        $limit = $this->get('limit', true);
        $products = $this->Product_model->getProducts($orderBy, $start, $limit);
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
     * get product by category
     * 
     * @param - categoryID
     * 
     */
    public function categoryID_get($categoryID)
    {
        $productByCategory = $this->Product_model->getProductByCategory($categoryID);
        $this->response($productByCategory,200);
    }

    /**
     * get product by userID
     * 
     * @param - userID
     * 
     * @echo response json product by user id
     */
    public function userID_get($userID)
    {
        $productByUser = $this->Product_model->getProductByUser($userID);
        $this->response($productByUser,200);
    }

     /**
    * Insert product from Client
    * Method post
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
                    $totalLike = 0;
                    $totalView = 1;
                    $rate = 5 ;
                    $status = 0;
                    $createDate = $updateDate= date("Y-m-d h:i:sa");
                    
                    if ($name!='' && $price!='' && $categoryID!='' && $shortDescription !='' && $longDescription!='' && $quantity!='' && $avatar !='') {
                        if ($listImage) {
                            $listImage = json_encode($listImage);
                        }
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
                            'user_id' => $getPermission['user_id'],
                            'create_date' => $createDate,
                            'update_date' => $createDate 
                        );
                        if ($this->Product_model->insertProduct($product)) {
                            $message = array(
                                'status' => true,
                                'message' => 'Success'
                            );
                            $this->response($message,201);
                        } else{
                            $message = array(
                                'status' => false,
                                'message' => 'Error'
                            );
                            $this->response($message,403);
                        }
                    } else  {
                        $message = array(
                            'status' => false,
                            'message' => 'Vui lòng nhập đầy đủ thông tin!'
                        );
                        $this->response($message,406);
                    }
                } else {                                 // not access
                    $message = array(
                        'status' => false,
                        'message' => 'Authorization'
                    );
                    $this->response($message,406);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,406);
            }
    }
    
    /**
    * update like in product
    * method patch
    * 
    * @echo message: true/false
    */
    public function updateLikeProduct_patch()
    {
        $token = $this->auth->getUserByToken();
        if ($token) {
            if (isset($token['username'])) {
                $productID= $this->patch('productID');
                if ($productID!='') {
                    if ($this->Product_model->insertUserLikeOrView($token['id'], $productID, false)) {          // if param 3nd is false, insert like, else insert view
                        $this->Product_model->updateLikeOrViewProduct($productID,true,false);
                        $message = array(
                            'status' => true,
                            'message' => 'Update Successful!'
                        );
                        $this->response($message,200);
                    } else {
                        if ($this->Product_model->deleteUserLikeOrView($token['id'], $productID)) {
                            $this->Product_model->updateLikeOrViewProduct($productID, false);
                            $message = array(
                                'status' => true,
                                'message' => 'Update Successful!'
                            );
                            $this->response($message,200);
                        } else {
                            $message = array(
                                'status' => false,
                                'message' => 'Update ERROR'
                            );
                            $this->response($message,400);
                        }
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Update ERROR, not paramater!'
                    );
                    $this->response($message,401);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);    
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,401);
        }     
    }

    /**
    * update like in product
    * method patch
    * 
    * @echo message: true/false
    */
    public function updateViewProduct_patch()
    {
        $token = $this->auth->getUserByToken();
        if ($token) {
            if (isset($token['username'])) {
                $productID= $this->patch('productID');
                if ($productID!='') {
                    if ($this->Product_model->insertUserLikeOrView($token['id'], $productID, true)) {          // if param 3nd is false, insert like, else insert view
                        $this->Product_model->updateLikeOrViewProduct($productID,true,true);
                        $message = array(
                            'status' => true,
                            'message' => 'Update Successful!'
                        );
                        $this->response($message,200);
                    } else {
                        $message = array(
                            'status' => true,
                            'message' => 'Sản phẩm đã xem'
                        );
                        $this->response($message,200);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Update ERROR, not paramater!'
                    );
                    $this->response($message,401);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);    
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,401);
        }     
    }

    public function getProductsLiked_get()
    {
        $user = $this->auth->getUserByToken();
        if ($user) {
            if (isset($user['id'])) {
                $products = $this->Product_model->getProductsLikedOrViewed($user['id'], false);
                if($products) {
                    $this->response($products,200);
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Chưa có sản phẩm nào'
                    );
                    $this->response($message,200);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'UnAuthorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'UnAuthorization'
            );
            $this->response($message,401);
        }
    }
    
    public function getProductsViewed_get()
    {
        $user = $this->auth->getUserByToken();
        if ($user) {
            if (isset($user['id'])) {
                $products = $this->Product_model->getProductsLikedOrViewed($user['id'], true);
                if($products) {
                    $this->response($products,200);
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Chưa có sản phẩm nào'
                    );
                    $this->response($message,200);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'UnAuthorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'UnAuthorization'
            );
            $this->response($message,401);
        }
    }
    
    /**
    * update product
    * 
    * method put 
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
                    $this->response($message,401);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'id not found'
            );
            $this->response($message,404);
        }
    }

    /**
    * delete product by ID
    * method delete 
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
                    $this->response($message,401);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        }
       
    }

    /**
     * confirm product from editor send
     * method put
     * only admin can access
     * 
     * @echo message: true/false
     */
    public function confirmProduct_put()
    {
        $id= $this->put('id');
        if ($id!='') {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  {
                    $checkAuth =true;
                } 
                if($checkAuth == true) {                                // confirmed
                    $checkConfirm = $this->Product_model->confirmProduct($id);
                    if ($checkConfirm == 1) {
                        $message = array(
                            'status' => true,
                            'message' => 'Success'
                        );
                        $this->response($message,200);
                    } else if($checkConfirm == 0) {
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
                    $this->response($message,401);
                }
            } else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,401);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => 'id product not found'
            );
            $this->response($message,404);
        }
    }

    /**
     * Search product - method get
     *  
     * @param q - input text
     * @param category - category_id
     * @param shop - shop_id
     * @param price - price in range
     * @param lte   - price less than or equal
     * @param gte   - price greater than or equal to
     * @param orderby   - 
     * @param start     
     * @param limit     
     */
    public function search_get()
    {
        $query = $this->get('q',true);
        $categoryID = $this->get('category',true);
        $shopID = $this->get('shop',true);
        $priceLte = $this->get('lte',true);
        $priceGte = $this->get('gte', true);
        $orderBy = $this->get('orderby', true);
        $start = $this->get('start',true);
        $limit = $this->get('limit',true);
        $products = $this->Product_model->searchProduct($query,true, $categoryID, $shopID, $priceGte, $priceLte, $orderBy, $start, $limit);
        if ($products == 0) {
            $query = $this->convert_vi_to_en($query);
            $products = $this->Product_model->searchProduct($query, false, $categoryID, $shopID, $priceGte, $priceLte, $orderBy, $start, $limit);
        }
        $this->response($products,200); 
    }

    /**
     * Convert vietnamese to english
     * 
     * @param $string
     * @return string
     */
    public function convert_vi_to_en($str) {
        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", "a", $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", "e", $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", "i", $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", "o", $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", "u", $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", "y", $str);
        $str = preg_replace("/(đ)/", "d", $str);
        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", "A", $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", "E", $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", "I", $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", "O", $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", "U", $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", "Y", $str);
        $str = preg_replace("/(Đ)/", "D", $str);
        $str = preg_replace("/(')/", "", $str);
        //$str = str_replace(" ", "-", str_replace("&*#39;","",$str));
        return $str;
    }
}

/* End of file Controllername.php */