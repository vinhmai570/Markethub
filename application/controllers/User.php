<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';
require APPPATH . '/libraries/CreatorJwt.php';

use chriskacerguis\RestServer\RestController;

class User extends RestController {
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
        $this->auth = new Auth();
        $this->objOfJwt = new CreatorJwt();
    }

    public function index()
    {
        
    }
    
    /**
    * get all user
    * 
    * @echo response json all user
    */
    public function getUsers_get()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['status'] == true) {                   // admin or editor
            $checkAuth = false;
            if ($getPermission['permission'] == 'admin')  {
                $checkAuth =true;
            } 
            if($checkAuth == true) {                                // confirmed
                $user = $this->User_model->getUsers();
                $this->response($user, 200);
            } else {                                 // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,406);
            }
        } else {                                    // not access
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,406);
        }
    }

    /**
    * get user by ID
    * 
    * @param - user_id
    * @echo response json user
    */
    public function userid_get($userID)
    {
        $getPermission = $this->auth->checkPermission();
        $checkAuth = false;
        if ($getPermission['permission'] == 'admin')  {
            $checkAuth =true;
        } else if ($getPermission['permission'] == 'user') {
            if ($userID == $getPermission['user_id']) {         
                $checkAuth = true;
            }
        }
        if($checkAuth == true) {                                // confirmed
            $UserByID = $this->User_model->getUserByID($userID);
            $this->response($UserByID,200);
        } else {                                 // not access
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,406);
        }

        
    }

     /**
    * Insert user from Client
    * 
    * @echo json message: success/error
    */
    public function register_post()
    {
        $name = $this->post('user_name', true);
		$email = $this->post('email', true);
		$phone = $this->post('phone', true);
        $password = md5($this->post('password'));

        //checking email already exists then to show error
        $que=$this->db->query("select * from user where email='$email' or user_name ='$name' ");
		$row = $que->num_rows();
		if ($row>0) {
            $que=$this->db->query("select * from user where email='$email'")->row();
		    if ($que->active == 0) {
                if ($name!='' && $email!='' && $phone!='' && $password !='' ) {
                    $users = array(
                        'user_name'=> $name,
                        'email' => $email,
                        'phone' => $phone,
                        'password' => $password,
                        'group_id' => 3,
                        'active' => 0
                    );
                    if ($this->User_model->updateUserByEmail($users, $email)) {
                        if ($this->User_model->sendEmailVerify($email)) {
                            $message = array(
                                'status' => true,
                                'message' => 'Registered successfully, please check email to confirm account'
                            );
                            $this->response($message,200);
                        } else {
                            $message = array(
                                'status' => false,
                                'message' => 'Registered failed'
                            );
                            $this ->response($message,400);
                        }
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Registration failed'
                        );
                        $this->response($message,400);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Please enter full information!'
                    );
                    $this->response($message,400);
                }

            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Email is already exists'
                );
                $this->response($message,406);
            }
        } else {//if not already exists, then running code bellow
            if ($name!='' && $email!='' && $phone!='' && $password !='' ) {
                $users = array(
                    'user_name'=> $name,
                    'email' => $email,
                    'phone' => $phone,
                    'password' => $password,
                    'group_id' => 3,
                    'active' => 0
                );
                if ($this->User_model->register($users)) {
                    if ($this->User_model->sendEmailVerify($email)) {
                        $message = array(
                            'status' => true,
                            'message' => 'Registered successfully, please check email to confirm account'
                        );
                        $this->response($message,200);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Registered failed'
                        );
                        $this ->response($message,400);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Registration failed'
                    );
                    $this->response($message,400);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Please enter full information!'
                );
                $this->response($message,400);
            }
        }
    }

    public function verify_get($key)
    {
        if(isset($key)) {
            if( $this->User_model->verifyEmail($key)){
              echo "Verify Successful";   
            } else {
                echo "Verify error";
            }
        } else {
            echo "null";
        }
    }

    public function forgotPassword_post()
    {
        $email = $this->post('email');
        if ($email) {
            $password = $this->randomString(6);
            if ($this->User_model->sendPassword($email, $password)) {
                $message = array(
                    'status' => true,
                    'message' => 'Send password successful'
                );
                $this->response($message,200);
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Email not exist'
                );
                $this->response($message,400);
            }
        }
    }

    public function randomString($length) {
        $keys = array_merge(range(0,9), range('a', 'z'));
        $key = "";
        for($i=0; $i < $length; $i++) {
            $key .= $keys[mt_rand(0, count($keys) - 1)];
        }
        return $key;
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