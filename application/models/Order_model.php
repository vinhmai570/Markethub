<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order_model extends CI_Model {
    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function getProductByOrderID($orderID)
    {
        $this->db->select('*');
        $this->db->where('order_id', $orderID);
        $order = $this->db->get('order');
        return $order->row();
    }
    

}

/* End of file ModelName.php */
