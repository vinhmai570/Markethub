<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart_model extends CI_Model {
    public function __construct()
	{
		parent::__construct();
		
    }

    public function getCartByUserID($userID)
    {
        $this->db->select('*');
        $this->db->from('cart');
        $this->db->where('user_id', $userID);
        return $this->db->get()->result_array();
    }

    public function getCartItemByUserID($userID)
    {
        $this->db->select('product');
        $this->db->from('cart');
        $this->db->where('user_id', $userID);
        return $this->db->get()->result_array();
    }

    public function getCartItemByShopID($userID, $shopID)
    {
        $this->db->select('*');
        $this->db->from('cart');
        $this->db->where('user_id', $userID);
        $this->db->where('shop_id', $shopID);
        return $this->db->get()->row();
    }

    public function insertCart($data)
    {
        $this->db->insert('cart', $data);
        return $this->db->insert_id();
    }

    public function addToCart($products, $cart_id)
    {   
        $this->db->where('cart_id', $cart_id);
        $this->db->set('product', $products);
        $this->db->update('cart');
        if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }
    
    public function updateCart($userID, $shopID, $productID, $quantity)
    {
        
    }

    public function deleteAllCartItems($userID)
    {
        $this->db->where('user_id', $userID);
        $this->db->delete('cart');
    }

}

/* End of file ModelName.php */

