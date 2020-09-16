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

}

/* End of file Controllername.php */