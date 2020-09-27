<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order_model extends CI_Model {
    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function insertOrder($order)
    {
        $this->db->insert('order', $order);
        return $this->db->insert_id();
    }

    public function insertOrderItem($orderItem)
    {
        $this->db->insert('order_item', $orderItem);
        return $this->db->insert_id();
    }

    public function orderListToConfirm($userID = null,$shop = null, $permission = null)
    {   
        $this->db->select('*');
        $this->db->from('order');
        if ($permission == 'admin') {
            if ($userID) {
                $this->db->where('user_id', $userID);
            }
            $this->db->where('status', 0);
            return $this->db->get()->result_array();
        } else {
            if ($shop) {           //            get list order by shop
                $this->db->where('shop_id', $userID);
            } else {                //            get list order by user
                $this->db->where('user_id', $userID);
            }
            $this->db->where('status', 0);
            return $this->db->get()->result_array();
        }
    }

    public function orderListConfirmed($userID = null,$isShop = null, $permission = null)
    {   
        $this->db->select('*');
        $this->db->from('order');
        if ($permission == 'admin') {
            if ($userID) {
                $this->db->where('user_id', $userID);
            }
            $this->db->where('status', 1);
            return $this->db->get()->result_array();
        } else {
            if ($isShop) {           //            get list order by shop
                $this->db->where('shop_id', $userID);
            } else {                //            get list order by user
                $this->db->where('user_id', $userID);
            }
            $this->db->where('status', 0);
            return $this->db->get()->result_array();
        }
       
    }

    public function getPOrderByOrderID($orderID)
    {
        $this->db->select('*');
        $this->db->where('order_id', $orderID);
        return $this->db->get('order')->row();
    }

    public function getOrderItems($orderID)
    {
        $this->db->select('*');
        $this->db->where('order_id', $orderID);
        return $this->db->get('order_item')->result_array();
    }

    public function confirmOrder($orderID)
    {
        $this->db->where('order_id',$orderID);
        $this->db->set('status',1);
        return $this->db->update('order');
    }

    public function getProductByOrderID($orderID)
    {
        $this->db->select('*');
        $this->db->where('order_id', $orderID);
        $order = $this->db->get('order');
        return $order->row();
    }
    
    
    public function deleteOrder($orderID)
    {
        $this->db->where('order_id', $orderID);
        $this->db->where('status', 0);
        $this->db->delete('order');
        if ($this->db->error()['message']) {
            return 0; // error
        } else {
            return 1;
        }
    }

    public function deleteOrderItems($orderID)
    {
        $this->db->where('order_id', $orderID);
        $this->db->delete('order_item');
        if ($this->db->error()['message']) {
            return 0; // error
        } else {
            return 1; // success
        }
     }

   

}

/* End of file ModelName.php */
