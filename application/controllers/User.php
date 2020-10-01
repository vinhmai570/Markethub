<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';
use chriskacerguis\RestServer\RestController;

class User extends RestController {
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
        $this->auth = new Auth();
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
    public function userid_get($userID = 0)
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
        $password = $this->post('password');
        
        $validatePhone = $this->validatePhone($phone);
        if ($validatePhone['status']===false) {
            $this->response($validatePhone, 400);
            return 0;
        }

        $validateEmail = $this->validateEmail($email);
        if ($validateEmail['status']===false) {
            $this->response($validateEmail, 400);
            return 0;
        }
        $validatePassword = $this->validatePassword($password);
        if ($validatePassword['status'] === false) {                 
            $this->response($validatePassword, 400);
            return 0;
        }
        $validateUserName = $this->validateUsername($name);
        if ($validateUserName['status'] === false) {
            $this->response($validateUserName, 400);
            return 0;
        }
        
        //checking email already exists then to show error
        $user = $this->User_model->getUserByEmail($email);
		if ($user) {
		    if ($user->active == 0) {
                $users = array(
                    'user_name'=> $name,
                    'email' => $email,
                    'phone' => $phone,
                    'password' => md5($password),
                    'group_id' => 3,
                    'active' => 0
                );
                if ($this->User_model->updateUserByEmail($users, $email)) {
                    if ($this->User_model->sendEmailVerify($email)) {
                        $message = array(
                            'status' => true,
                            'message' => 'Đăng kí thành công, vui lòng xác nhận Email'
                        );
                        $this->response($message,200);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Đăng kí thất bại'
                        );
                        $this ->response($message,400);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Vui lòng nhập đủ các trường'
                    );
                    $this->response($message,400);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Email đã tồn tại'
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
                            'message' => 'Đăng kí thành công, vui lòng xác nhận email'
                        );
                        $this->response($message,201);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Đăng kí thất bại'
                        );
                        $this ->response($message,400);
                    }
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Đăng kí thất bại'
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

    /**
     * Verify email 
     * 
     */
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

    /**
     * Send random password 6 characters to email user
     * 
     * @body param: email
     */
    public function forgotPassword_post()
    {
        $email = $this->post('email');
        if ($email) {
            $password = $this->randomString(6);                         // Random password
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
    
    /**
     * Update user
     * 
     * @param body: email, phone, address, avatar optional
     */
    public function update_put()
    {
        $username = $this->auth->checkPermission()['username'];
        if ($username=='') {
            $message = array(
                'status' => false,
                'message' => 'Authorization failed'
            );
            $this->response($message,401);
            return 0;
        }
		$email = $this->put('email');
		$phone = $this->put('phone');
        $address = $this->put('address');
        $avatar = $this->put('avatar');

        if ($phone) {                   
            $validatePhone = $this->validatePhone($phone);
            if ($validatePhone['status']===false) {
                $this->response($validatePhone, 400);
                return 0;
            }
        }

        if ($email) {
            $validateEmail = $this->validateEmail($email);
            if ($validateEmail['status']===false) {
                $this->response($validateEmail, 400);
                return 0;
            }
        }
        //checking email already exists
        $que=$this->db->query("select * from user where email='$email' "); //except itself
		$row = $que->num_rows();
		if ($row>0) {
		    $message = array(
                'status' => false,
                'message' => 'Email is already exists'
            );
            $this->response($message,200);
        } else {
            if ($email!='' || $phone!='' || $address!='' || $avatar) {
                if ($this->User_model->updateUser($username, $email, $phone, $address, $avatar)) {
                    $message = array(
                        'status' => true,
                        'message' => 'Cập nhật tài khoản thành công'
                    );
                    $this->response($message,200);
                } else {
                    $message = array(
                        'status' => false,
                        'message' => 'Có lỗi xảy ra'
                    );
                    $this->response($message,404);
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Vui lòng nhập đầy đủ thông tin'
                );
                $this->response($message,400);
            }
        }
    }
    public function changePassword_patch()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['permission'] == 'admin' ||$getPermission['permission'] == 'user' || $getPermission['permission'] == 'editor') {
            $password = $this->patch('password');
            $newPassword = $this->patch('newPassword');
            $confirmPassword = $this->patch('confirmPassword');
            if ($newPassword != $confirmPassword) {
                $message = array(
                    'status' => false,
                    'message' => 'Mật khẩu mới phải trùng khớp với nhau'
                ); 
                $this->response($message, 404);
                return 0;
            }
            if ($password=='' || $newPassword == '' || $confirmPassword=='') {
                $message = array(
                    'status' => false,
                    'message' => 'Vui lòng nhập đủ thông tin'
                ); 
                $this->response($message, 400);
                return 0;
            }
            $userID = $getPermission['user_id'];
            $user = $this->User_model->getUserByID($userID);
            if (md5($password) == $user->password) {            // confirm user
                $validatePassword = $this->validatePassword($newPassword);
                if ($validatePassword['status'] === false) {                   // check length password
                    $this->response($validatePassword, 400);
                    return 0;
                } else {
                    if ($this->User_model->updatePassword($userID, $newPassword))  {
                        $message = array(
                            'status' => true,
                            'message' => 'Đổi mật khẩu thành công'
                        ); 
                        $this->response($message, 200);
                    }
                }
            } else {
                $message = array(
                    'status' => false,
                    'message' => 'Mật khẩu cũ không đúng'
                ); 
                $this->response($message, 401);
            }
        } else { 
            $message = array(
                'status' => false,
                'message' => 'Authorization failed'
            );
            $this->response($message,401);
        }
    }

    public function validatePassword($password = '')
	{
		$password = trim($password);

		$regex_lowercase = '/[a-z]/';
		$regex_uppercase = '/[A-Z]/';
		$regex_number = '/[0-9]/';
		$regex_special = '/[!@#$%^&*()\-_=+{};:,<.>ยง~]/';

		if (empty($password)) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu không được để trống'
            );
            return $message;
		}

		if (strlen($password) < 6) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải có ít nhất 6 kí tự'
            );
            return $message;
        }
        
		if (preg_match_all($regex_lowercase, $password) < 1) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải có ít nhất một chữ cái thường'
            );
            return $message;
		}

		if (preg_match_all($regex_uppercase, $password) < 1) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải có ít nhất một chữ cái hoa'
            );
            return $message;
		}

		if (preg_match_all($regex_number, $password) < 1) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải có ít nhất một chữ số'
            );
            return $message;
		}

		if (preg_match_all($regex_special, $password) < 1) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải có ít nhất một kí tự đặc biệt'
            );
            return $message;
		}

		if (strlen($password) > 32) {
			$message = array(
                'status' => false,
                'message' => 'Mật khẩu phải không quá 32 kí tự'
            );
            return $message;
		}
		$message = array(
            'status' => true,
            'message' => 'Mật khẩu đúng'
        );
        return $message;
    }
    public function validatePhone($phone = '')
    {
        $phone = str_replace(array('-', '.', ' '), '', $phone);
        
        // $number is not a phone number
        if (!preg_match('/^0[0-9]{9}$/', $phone)) {
            $message = array(
                'status' => false,
                'message' => 'Số điện thoại không hợp lệ'
            );
            return $message;
        }
        $message = array(
            'status' => true,
            'message' => 'Đã kiểm tra'
        );
        return $message;
    }

    public function validateEmail($email = '')
    {
        $this->load->helper('email');
        if (!valid_email($email)) {
            $message = array(
                'status' => false,
                'message' => 'Email không hợp lệ'
            );
            return $message;
        }
        $message = array(
            'status' => true,
            'message' => 'Đã kiểm tra'
        );
        return $message;
    }

    public function validateUsername($username = "")
    {
        $username = trim($username);
        $regexSpecialCharacter = "/^[A-Za-z0-9_]+$/";
        if (strlen($username)<6) {
            $message = array(
                'status' => false,
                'message' => 'Tên tài khoản phải lớn hơn 6 kí tự'
            );
            return $message; 
        }
        if (!preg_match($regexSpecialCharacter, $username)) {
            $message = array(
                'status' => false,
                'message' => 'Tên tài khoản không được chứa các kí tự đặc biệt'
            );
            return $message; 
        }
        $userByUsername = $this->User_model->getUserByUsername($username);
        if( $userByUsername ) {
            $message = array(
                'status' => false,
                'message' => 'Tên tài khoản đã có người sử dụng',
            );
            return $message;
        }
        $message = array(
            'status' => true,
            'message' => 'Đã kiểm tra'
        );
        return $message; 
    }
}

/* End of file Controllername.php */
?>