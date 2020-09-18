<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends CI_Controller {

    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        
    }
    
    // get all products
    public function getProducts()
    {
        $this->load->model('Product_model');
        $products = $this->Product_model->getProducts();
        echo json_encode($products);
    }

     /**
    * Insert product from Client
    * 
    * @echo json message
    */
    public function insertProduct()
    {
        $dataInput=json_decode(file_get_contents('php://input'),true);
		$name = isset($dataInput['productName'])?$this->filterInput($dataInput['productName']):'';
		$price = isset($dataInput['price'])?$dataInput['price']:'';
		$categoryID = isset($dataInput['category'])?$this->filterInput($dataInput['category'],"INT"):'';
        $shortDescription = isset($dataInput['shortDescription'])?$this->filterInput($dataInput['shortDescription']):'';
        $longDescription = isset($dataInput['longDescription'])?$this->filterInput($dataInput['longDescription']):'';
        $discount = isset($dataInput['discount'])?$dataInput['discount']:0;
        $listImage = isset($dataInput['listImage'])?$this->filterInput($dataInput['listImage']):'';
        $avatar = isset($dataInput['avatar'])?$dataInput['avatar']:'';
        $quantity= isset($dataInput['quantity'])?$dataInput['quantity']:'';
        $totalLike = 0;
        $totalView = 1;
        $rate = 5 ;
        $status = 0;
        $createDate = $updateDate=date("Y-m-d h:i:sa");
        
        if ($name!='' && $price!='' && $categoryID!='' && $shortDescription !='' && $longDescription!='' && $quantity!='' && $avatar !='') {
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
                'create_date' => $createDate,
                'update_date' => $createDate 
            );
            $this->load->model('Product_model');
            if ($this->Product_model->insertProduct($product)) {
                $message = array(
                    'status' => true,
                    'message' => 'Insert Successful!'
                );
                echo json_encode($message);
            } else{
                $message = array(
                    'status' => false,
                    'message' => 'ERROR'
                );
                echo json_encode($message);
            }
        } else  {
            $message = array(
                'status' => false,
                'message' => 'ERROR'
            );
            echo json_encode($message);
        }
		
    }
    
    /**
    * Filter input from client
    * 
    * @input input from client
    * @type type input, default string
    * @return $input type
    */
    public function filterInput( $input, $type = NULL)
    {
        $input = trim($input);
        $input = filter_var($input, FILTER_SANITIZE_STRING);
        if ($type=='INT') {
            //Không phải là số nguyên thì return chuỗi trống
            if (filter_var($input, FILTER_VALIDATE_INT) === false){
                return '';
            }
        }
        if ($type=='URL') {
            //URL không hợp lệ thì return chuỗi trống
            if (filter_var($url, FILTER_VALIDATE_URL) === false) {
                return '';
            }
        }
        return $input;
    }
    

}

/* End of file Controllername.php */