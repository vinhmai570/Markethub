<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model {

    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function getProducts()
    {
        $this->db->select('product_name, price, category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->join('user', 'user.user_id = product.user_id');
        $products = $this->db->get('product');
        if ($products->num_rows() > 0) {
            return $products->result_array();
        } else {
            return 0;
        }
    }

    public function insertProduct($product)
    {
        $this->db->insert('product',$product);
        return $this->db->insert_id();
    }

    public function getProductByID($id)
    {
        $this->db->select('product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->where('product_id',$id);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByID = $this->db->get()->row();
        return $productByID;
    }

    public function getProductByCategory($categoryID)
    {
        $this->db->select('product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->where('category_id',$categoryID);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByCategory = $this->db->get()->result_array();
        return $productByCategory;
    }

    public function getProductByUser($userID)
    {
        $this->db->select('product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->where('user_id',$userID);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByUser = $this->db->get()->result_array();
        return $productByUser;
    }

    public function getProductByView()
    {
        $this->db->select('product_name, price, category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->join('user', 'user.user_id = product.user_id');
        $this->db->order_by('total_view','DESC');
        $productByView = $this->db->get()->result_array();
        return $productByView;
    }

    public function getProductByDiscount()
    {
        $this->db->select('product_name, price, category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('status', 1);
        $this->db->join('user', 'user.user_id = product.user_id');
        $this->db->order_by('discount','DESC');
        $productByDiscount = $this->db->get()->result_array();
        return $productByDiscount;
    }

    public function updateViewProduct($productID)
    {
        $this->db->select('total_view');
        $this->db->where('product_id', $productID);
        $total_view = $this->db->get('product');
        $total_view = $total_view->result_array();
        $total_view = $total_view[0]['total_view']+1;
        $data = array(
            'total_view' => $total_view
        );
        $this->db->where('product_id', $productID);
        return $this->db->update('product',$data);
    }

    public function confirmProduct($id)
    {
        $this->db->where('product_id', $id);
        $this->db->update('product',['status' => 1]);
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 2; // id not found
        } else {
            return 1; // success
        }
    }

    public function updateProduct($product, $id)
    {
        $this->db->where('product_id', $id);
        return $this->db->update('product',$product);
    }

    public function deleteProduct($id)
    {
        $this->db->where('product_id',$id);
        $this->db->delete('product');
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 2; // id not found
        } else {
            return 1; // success
        }
    }
}

/* End of file ModelName.php */
   