<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class User extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Product_model');
    }

    public function index()
    {
       
    }

}

/* End of file Controllername.php */
