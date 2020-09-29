<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model {

    public function __construct()
	{
		parent::__construct();
    }
    
    public function getProducts($orderBy = null, $start = null, $limit = null)
    {
        $this->db->select('product_id, product_name, price, category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,user.user_id, update_date ');
        $this->db->join('user', 'user.user_id = product.user_id');
        if ($orderBy) {
            if ($orderBy == 'discount') {
                $this->db->order_by('discount','DESC');
            } else if ($orderBy == 'totalorder') {
                $this->db->order_by('total_order','DESC');
            }
        }
        if ($start && $limit) {
            $this->db->limit($limit, $start);
        }
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
        $this->db->select('product_id, product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('product_id',$id);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByID = $this->db->get()->row();
        return $productByID;
    }

    public function getProductByCategory($categoryID)
    {
        $this->db->select('product_id, product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,product.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('category_id',$categoryID);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByCategory = $this->db->get()->result_array();
        return $productByCategory;
    }

    public function getProductByUser($userID)
    {
        $this->db->select('product_id, product_name, price, category_id, short_description, long_description, discount, list_image, product.avatar, total_like, total_view, rate, user.user_name,user.user_id, update_date ');
        $this->db->from('product');
        $this->db->where('product.user_id',$userID);
        $this->db->join('user', 'user.user_id = product.user_id');
        $productByUser = $this->db->get()->result_array();
        return $productByUser;
    }

    public function updateLikeProduct($productID)
    {
        $this->db->select('total_like');
        $this->db->where('product_id', $productID);
        $total_like = $this->db->get('product')->row();
        $total_like = $total_like->total_like+1;
        $this->db->set('total_like',$total_like);
        $this->db->where('product_id', $productID);
        $this->db->update('product');
        if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }

    /**
     * update quantity, total_order after order
     * 
     * 
     */
    public function updateProductOrder($id, $quantity)
    {
        $this->db->select('quantity, total_order');
        $this->db->where('product_id', $id);
        $product = $this->db->get('product')->row();
        $totalOrder = $product->total_order + $quantity;
        $quantity = $product->quantity - $quantity; // $product->quantity is total quantity of product, $quantity is quantity in order
        $data = array(
            'total_order' => $totalOrder,
            'quantity' => $quantity
        );
        $this->db->where('product_id', $id);
        $this->db->update('product', $data);
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }

    public function confirmProduct($id)
    {
        $this->db->where('product_id', $id);
        $this->db->update('product',['status' => 1]);
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }

    public function updateProduct($product, $id)
    {
        $this->db->where('product_id', $id);
        $this->db->update('product',$product);
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }

    public function deleteProduct($id)
    {
        $this->db->where('product_id',$id);
        $this->db->delete('product');
        if ($this->db->error()['code']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }
    public function searchProduct($query, $categoryID = null, $shopID = null, $priceGte = null, $priceLte = null, $orderBy = null, $start = null, $limit = null)
    {
        $sql = "SELECT product_id, product_name, price, product.category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,product.user_id, total_order, update_date FROM product, user, category 
        where product_name like binary '%$query%' ";
        
        if ($categoryID) {
            $sql.="and product.category_id=$categoryID ";
        }
        if ($shopID) {
            $sql.="and product.user_id=$shopID ";
        }
        $sql .= "and product.category_id=category.category_id and product.user_id=user.user_id ";
        if ($priceLte) {
            if ($priceGte) {
                $sql .= "and price between $priceGte and $priceLte ";
            } else {
                $sql .= "and price <=$priceLte ";
            }
        }
        if ($orderBy) {
            // $sql .= "or long_description like  binary '%$query%' or user.user_name like  binary '%$query%' or category.category_name like binary'%$query%' ";
            if ($orderBy == 'priceasc') {
                $sql .= "order by price asc ";
            } else if ($orderBy == 'pricedesc') {
                $sql .= "order by price desc ";
            } else if ($orderBy == 'total_like') {
                $sql .= "order by total_like desc ";
            } else if ($orderBy == 'totalorder') {
                $sql .= "order by total_order desc ";
            }
            if ($start && $limit) {
                $sql .= " LIMIT $start,$limit ";
            }
            return $this->db->query($sql)->result_array();
        }
        $sql .= " order by total_order desc ";
        if ($start && $limit) {
            $sql .= " LIMIT $start,$limit ";
        }
        return $this->db->query($sql)->result_array();
    }
}

/* End of file ModelName.php */
   