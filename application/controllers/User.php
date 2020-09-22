<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class User extends RestController {
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
    }

    public function index()
    {
        
    }
    
    /**
    * get all user
    * 
    * @echo response json all user
    */
    public function getUser_get()
    {
        $user = $this->User_model->getUser();
        if($user) {
            $this->response($user, 200);
        } 
    }

    /**
    * get user by ID
    * 
    * @param - user_id
    * @echo response json user
    */
    public function id_get($id)
    {
        $UserByID = $this->User_model->getUserByID($id);
        $this->response($UserByID,200);
    }

     /**
    * Insert user from Client
    * 
    * @echo json message: success/error
    */
    public function registerUser_post()
    {
        $name = $this->post('user_name');
		$email = $this->post('email');
		$phone = $this->post('phone');
        $password = md5($this->post('password'));
       

        //checking email already exists then to show error
        $que=$this->db->query("select * from user where email='$email'");
		$row = $que->num_rows();
		if($row>0)
		{
		    $message = array(
                'status' => false,
                'message' => 'Email is already exists'
            );
            $this->response($message,200);
        }
        //if not already exists, then running code bellow
        else
        {

            if ($name!='' && $email!='' && $phone!='' && $password !='' ) {
                
                $users = array(
                    'user_name'=> $name,
                    'email' => $email,
                    'phone' => $phone,
                    'password' => $password
                );
                if ($this->User_model->register($users)) {
                    $message = array(
                        'status' => true,
                        'message' => 'Registered successfully'
                    );
                    $this->response($message,200);
                } 
                else
                {
                    $message = array(
                        'status' => false,
                        'message' => 'Registration failed'
                    );
                    $this->response($message,404);
                }
            } 
            else {
                $message = array(
                    'status' => false,
                    'message' => 'Please enter full information!'
                );
                $this->response($message,400);
            }
        }
    }


    public function updateUser_put()
    {
        $id = $this->put('id');
        $name = $this->put('user_name');
		$email = $this->put('email');
		$phone = $this->put('phone');
        $password = $this->put('password');
        $address = $this->put('address');
        $avatar = $this->put('avatar');
        
        //checking email already exists
        $que=$this->db->query("select * from user where email='$email' and user_id != '$id' "); //except itself
		$row = $que->num_rows();
		if($row>0)
		{
		    $message = array(
                'status' => false,
                'message' => 'Email is already exists'
            );
            $this->response($message,200);
        }
        
        //if not already exists, then running code bellow
        else
        {

            if ($id!='' && $name!='' &&$email!='' && $phone!='' && $password !='' && $address!='') {
                
                $users = array(
                    'user_name'=> $name,
                    'email' => $email,
                    'phone' => $phone,
                    'password' => $password,
                    'address' => $address,
                    'avatar' => $avatar
                );
                if ($this->User_model->updateUser($users, $id)) {
                    $message = array(
                        'status' => true,
                        'message' => 'Updated successfully'
                    );
                    $this->response($message,200);
                } 
                else
                {
                    $message = array(
                        'status' => false,
                        'message' => 'Update failed'
                    );
                    $this->response($message,404);
                }
            } 
            else {
                $message = array(
                    'status' => false,
                    'message' => 'Please enter full information!'
                );
                $this->response($message,400);
            }
        }
    }

    public function updateGroupUser_put()
    {
        
    }

}

/* End of file Controllername.php */
?>