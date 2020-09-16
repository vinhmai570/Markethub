<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model {

    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function getProducts()
    {
        $this->db->select('*');
        $products = $this->db->get('products');
        $products = $products->result_array();
        return $products;
    }
}

/* End of file ModelName.php */
   