<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Register extends RestController {

       
    function __construct()
    {
        parent::__construct();
        $this->load->model('Product_model');
    }

    public function index()
    {
        $name=$this->post('name');
        $email=$this->post('email');
        $phone=$this->post('phone');
        $password=$this->post('password');
        $groupID=$this->post('groupID')==3?3:$this->post('groupID')==2?2:'';
        
    }

}

/* End of file Controllername.php */
