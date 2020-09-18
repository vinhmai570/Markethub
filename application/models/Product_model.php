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
        $products = $this->db->get('product');
        $products = $products->result_array();
        return $products;
    }

    public function insertProduct($product)
    {
        $this->db->insert('product',$product);
        return $this->db->insert_id();
    }

}

/* End of file ModelName.php */
   