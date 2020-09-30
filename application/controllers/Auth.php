<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/CreatorJwt.php';

use chriskacerguis\RestServer\RestController;

class Auth extends RestController {
       
    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
        $this->objOfJwt = new CreatorJwt();
        header('Content-Type: application/json');
        date_default_timezone_set('Asia/Saigon');
    }

    public function index()
    {
        
    }

    public function login_post()
    {
        $username = $this->post('username'); 
        $password = md5($this->post('password')); 
        $message = array(
            'status' => false,
            'message' => 'Sai tài khoản hoặc mật khẩu'
        );
        $val = $this->User_model->getUserByUsername($username); //Model to get single data row from database base on username
        if (!$val) {
            $this->response($message, 404);
        }
		$match = $val->password;   //Get password for user from database
        if($password == $match){  
        	if ($val->active == 1) {
                $token['id'] = $val->user_id;  
                $token['username'] = $val->user_name;
                $date = new DateTime();
                $token['expiration'] = $date->getTimestamp() + 60*60*24*7;// expiration = 7 day
                $token['group_id']=$val->group_id;
                $output['token'] = $this->objOfJwt->GenerateToken($token);
                $output['username']= $val->user_name;
                $output['email'] = $val->email;
                $output['phone'] = $val->phone;
                $output['group_id'] = $val->group_id;
                $this->response($output, 200); //This is the respon if success
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Please very email'
                );
                $this->response($message, 400); //This is the respon if failed
            }
        }
        else {
            $this->response($message, 400); //This is the respon if failed
        }
    }

    /**
    * Check token expired from header request 
    * 
    * @echo message: true/false
    */
    public function checkToken_post()
    {
        $token = isset($this->input->request_headers('Authorization')['Authorization'])?$this->input->request_headers('Authorization')['Authorization']:0; // get token in header
        if ($token) {
            $token = $this->objOfJwt->DecodeToken($token);
            $now = new DateTime();
            $checkTime = $now->getTimestamp();
            if ($checkTime > $token['expiration']) { // token expired
                $message = array(
                    'status' => false,
                    'message' => "Auth Failed"
                );
                $this->response($message,400);
            } else {
                $message = array(
                    'status' => true,
                    'message' => "Success"
                );
                $this->response($message,200);
            }
        } else {
            $message = array(
                'status' => false,
                'message' => "Auth Failed"
            );
            $this->response($message,404);
        }
    }

    public function getUserByToken()
    {
        $token = isset($this->input->request_headers('Authorization')['Authorization'])?$this->input->request_headers('Authorization')['Authorization']:0; // get token in header
        if ($token) {
            $token = $this->objOfJwt->DecodeToken($token);
            $now = new DateTime();
            $checkTime = $now->getTimestamp();
            if ($checkTime > $token['expiration']) { // token expired
                $message = array(
                    'status' => false,
                    'message' => "Auth Failed"
                );
                return 0;
            } else {
                return $token;
            }
        } else {
            $message = array(
                'status' => false,
                'message' => "Auth Failed"
            );
            return 0;
        }
    }

    /**
    * Check permission by token from header request
    * 
    * @echo message: true/false + permission
    */
    public function checkPermission()
    {
        $token = isset($this->input->request_headers('Authorization')['Authorization'])?$this->input->request_headers('Authorization')['Authorization']:0; // get token in header
        if ($token) {
            $token = $this->objOfJwt->DecodeToken($token);
            $now = new DateTime();
            $checkTime = $now->getTimestamp();
            if ($checkTime > $token['expiration']) { // token expired
                $message = array(
                    'status' => false,
                    'message' => "Auth Failed",
                    'user_id' => 0,
                    'username' => ''
                );
                return $message;
            } else {                                // token true
                if ($token['group_id'] == 1) {
                    $message = array(
                        'status' => true,
                        'permission' => 'admin',
                        'user_id' => $token['id'],
                        'username' => $token['username']
                    );
                    return $message;
                } else if($token['group_id'] == 2 ) {
                    $message = array(
                        'status' => true,
                        'permission' => 'editor',
                        'user_id' => $token['id'],
                        'username' => $token['username']
                    );
                    return $message;
                } else {
                    $message = array(
                        'status' => false,
                        'permission' => 'user',
                        'user_id' => $token['id'],
                        'username' => $token['username']
                    );
                    return $message;
                }
            }
        } else {
            $message = array(
                'status' => false,
                'user_id' => 0,
                'permission' => 'unknown',
                'username' => ''
            );
            return $message;
        }
    }


}

/* End of file Controllername.php */
