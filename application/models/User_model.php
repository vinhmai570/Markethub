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
    
    
    /**
     * Comment of Thach, Task registed 
     **/


    //get total property user
    public function getUser()
    {
        $this->db->select('*');
        $users = $this->db->get('user');
        if($users->num_rows() > 0){
            return $users->result_array();
        }else { return 0; }
    }
    

    public function getUserByID($id)
    {
        $this->db->select('user_name, email, phone, password, address, group_id ');
        $this->db->from('user');
        $this->db->where('user_id',$id);
        $this->db->join('group_user', 'group_user.group_id = user.user_id');
        $userByID = $this->db->get();
        $userByID = $userByID->result_array();
        return $userByID;
    }

    //get user equal sql
    public function getUserSQL($query)
    {
        return $this->db->get_where('user',$query);
    }


    public function deleteUser($userID){
        $this->db->where('user_id', $userID);
        return $this->db->delete('user');
    }

    public function updateUser($user, $id)
    {
        $this->db->where('user_id', $id);
        return $this->db->update('user', $user);
    }

    
}

/* End of file ModelName.php */
