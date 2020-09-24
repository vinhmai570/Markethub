<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Order extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Order_model');
    }

    public function index()
    {
        
    }

    public function confirmOrder_put()
    {
        $orderID = $this->put('order_id');
        $this->load->model('Product_model');
        $order = $this->Order_model->getProductByOrderID($orderID);
        $productOrder = json_decode($order->product_order);
        foreach ($productOrder as $key => $product) {
            $this->Product_model->updateProductOrder($product->id,$product->quantity);
        }
    }
}

/* End of file Controllername.php */
