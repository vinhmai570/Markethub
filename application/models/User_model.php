<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {
    
    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function register($user)
    {
        $this->db->insert('user',$user);
        return $this->db->insert_id();
    }
    
    public function getUser($query)
    {
        return $this->db->get_where('user',$query);
    }

}

/* End of file ModelName.php */
