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

    /**
     * update like when user like a product or unlike product
     * 
     * @param $increase = true/false
     */
    public function updateLikeOrViewProduct($productID, $increase = true, $viewed = false)
    {
        if ($viewed===true) {
            $sql = "update product set total_like=total_like+1 where product_id=$productID ";
        } else {
            if ($increase==true) {
                $sql = "update product set total_like=total_like+1 where product_id=$productID ";
            } else {
                $sql = "update product set total_like=total_like-1 where product_id=$productID ";
            }
        }
        $this->db->query($sql);
        if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }
    }

    public function insertUserLikeOrView($userID, $productID, $viewed = false)
    {
        $this->db->select('*');
        $this->db->where('user_id', $userID);
        $this->db->where('product_id', $productID);
        $date = date("Y-m-d h:i:sa");
        if ($viewed===true) {
            $userView = $this->db->get('user_view');
            if ($userView->num_rows()>0) {
                return 0;
            }
            $data = array(
                'user_id' => $userID,
                'product_id' => $productID,
                'viewed_at' => $date
            );
            $this->db->insert('user_view', $data);
            return $this->db->insert_id();
        }
        $userLike = $this->db->get('user_like');
        if ($userLike->num_rows()>0) {
            return 0;
        }
        $data = array(
            'user_id' => $userID,
            'product_id' => $productID,
            'liked_at' => $date
        );
        $this->db->insert('user_like', $data);
        return $this->db->insert_id();
    }

    public function deleteUserLikeOrView($userID, $productID, $viewed = false)
    {
        
        $this->db->select('*');
        $this->db->where('user_id', $userID);
        $this->db->where('product_id', $productID);
        if ($viewed===true) {
            $this->db->delete('user_view');
        } else {
            $this->db->delete('user_like');
        }
        if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1; // success
        }    
    }

    public function getProductsLikedOrViewed($userID,$viewed = false)
    {
        $this->db->select('product_id');
        $this->db->where('user_id',$userID);
        if ($viewed===true) {
            $this->db->order_by('viewed_at', 'DESC');            
            $products = $this->db->get('user_view');
        } else {
            $this->db->order_by('liked_at', 'DESC');            
            $products = $this->db->get('user_like');
        }
        $data = array();
        if ($products) {
            $products =  $products->result_array();
            foreach ($products as $key => $product) {
                // var_dump();
                if ($product) {
                    array_push($data,$this->getProductByID($product['product_id']));
                }
            }
        }
        if ($data) {
            return $data;
        }
        return 0;
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

    public function searchProduct($query, $searchBinary = false, $categoryID = null, $shopID = null, $priceGte = null, $priceLte = null, $orderBy = null, $start = null, $limit = null)
    {
        $query .="%";
        $query ="%".$query;
        $sql = "SELECT product_id, product_name, price, product.category_id, short_description, discount, product.avatar, total_like, rate, user.user_name,product.user_id, total_order, product.update_date FROM product, user, category 
        where product_name ";
        if ($searchBinary == true) {
            $sql = $sql."like binary ".$this->db->escape($query);
        } else {
            $sql = $sql."like ".$this->db->escape($query);
        }
        if ($categoryID) {
            $sql.=" and product.category_id=".$this->db->escape($categoryID);
        }
        if ($shopID) {
            $sql.=" and product.user_id=".$this->db->escape($shopID);
        }
        $sql .= " and product.user_id=user.user_id ";
        if ($priceLte) {
            if ($priceGte) {
                $sql .= "and price between ".$this->db->escape($priceGte)." and ". $this->db->escape($priceLte);
            } else {
                $sql .= "and price <=$this->db->escape($priceLte) ";
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
                if (is_numeric($start) && is_numeric($limit)) {
                    $sql .= " LIMIT $start,$limit ";
                }
            }
            return $this->db->query($sql)->result_array();
        }
        $sql .= " order by total_order desc ";
        if ($start && $limit) {
            if (is_numeric($start) && is_numeric($limit)) {
                $sql .= " LIMIT $start,$limit ";
            }
        }
        $products = $this->db->query($sql);
        if ($products->num_rows()<10 && $searchBinary==false) {
            return 0;
        } else {
            return $products->result_array();
        }
    }
}

/* End of file ModelName.php */
   