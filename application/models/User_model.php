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
    
    public function sendEmailVerify($toEmail)
    {
        $fromEmail = 'autoreply@markethub.maitrongvinh.tk'; 
        $subject = 'Verify Your Email Address';
        $message = 'Dear '.$toEmail.',<br /><br />Please click on the below activation link to verify your email address.<br /><br /> '.base_url().'index.php/user/verify/' .md5($toEmail) . ' <br /><br /><br />Thanks<br />Markethub Team';
        
        //configure email settings
        $config['protocol'] = 'smtp';
        $config['smtp_host'] = 'markethub.maitrongvinh.tk'; //smtp host name
        $config['smtp_port'] = '25'; //smtp port number
        $config['smtp_user'] = $fromEmail;
        $config['smtp_pass'] = 'pass'; //$from_email password
        $config['mailtype'] = 'html';
        $config['charset'] = 'iso-8859-1';
        $config['wordwrap'] = TRUE;
        $config['newline'] = "\r\n"; //use double quotes
        $this->email->initialize($config);
        
        //send mail
        $this->email->from($fromEmail, 'Markethub');
        $this->email->to($toEmail);
        $this->email->subject($subject);
        $this->email->message($message);
        return $this->email->send();
    }


    public function verifyEmail($key)
    {
        $this->db->where('md5(email)',$key);
        return $this->db->update('user',['active'=>1]);
    }

    public function sendPassword($email, $password)
    {
       $checkEmailExist = $this->db->get_where('user',['email' => $email])->result_array();
       if ($checkEmailExist > 0) {
            $this->db->set('password',md5($password));
            $this->db->where('email',$email);
            $this->db->update('user');
        
            $this->load->library('email');
            $fromEmail = 'verify@maitrongvinh.tk'; 
            $subject = 'Markethub Forgot Password';
            $message = 'Dear '.$email.',<br /><br />Your new password is<h3> <b>'. $password .'<b></h3><br/>Markethub Team';
            
            //configure email settings
            $config['protocol'] = 'smtp';
            $config['smtp_host'] = 'markethub.maitrongvinh.tk'; //smtp host name
            $config['smtp_port'] = '25'; //smtp port number
            $config['smtp_user'] = $fromEmail;
            $config['smtp_pass'] = 'pass'; //$from_email password
            $config['mailtype'] = 'html';
            $config['charset'] = 'iso-8859-1';
            $config['wordwrap'] = TRUE;
            $config['newline'] = "\r\n"; //use double quotes
            $this->email->initialize($config);
            
            //send mail
            $this->email->from($fromEmail, 'Markethub');
            $this->email->to($email);
            $this->email->subject($subject);
            $this->email->message($message);
            return $this->email->send();
       } else {
            return 0;
       }
    }
    
    /**
     * Comment of Thach, Task registed 
     **/


    //get total property user
    public function getUsers()
    {
        $this->db->select('*');
        $users = $this->db->get('user');
        if($users->num_rows() > 0){
            return $users->result_array();
        } else {
             return 0; 
        }
    }
    
    public function getUserByUsername($username)
    {
        $this->db->select('user_name, user_id, email, phone, password, address, group_id, active ');
        $this->db->from('user');
        $this->db->where('user_name',$username);
        $this->db->or_where('email', $username);
        return $this->db->get()->row();
    }

    public function getUserByEmail($email)
    {
        $this->db->select('*');
        $this->db->from('user');
        $this->db->where('email', $email);
        return $this->db->get()->row();
    }

    public function getUserByID($id)
    {
        $this->db->select('user_name, email, phone, address, group_id ');
        $this->db->from('user');
        $this->db->where('user_id',$id);
        $userByID = $this->db->get();
        $userByID = $userByID->row();
        return $userByID;
    }

    public function deleteUser($username){
        $this->db->where('username', $username);
        return $this->db->delete('user');
    }

    public function updateUser($username, $email = null, $phone = null, $address = null, $avatar = null)
    {
        $this->db->where('user_name', $username);
        if ($email) {
            $this->db->set('email', $email);
        }
        if ($phone) {
            $this->db->set('phone', $phone);
        }
        if ($address) {
            $this->db->set('address', $address);
        }
        if ($avatar) {
            $this->db->set('avatar', $avatar);
        }
        return $this->db->update('user');
    }

    public function updateUserByEmail($user, $email)
    {
        $this->db->where('email', $email);
        return $this->db->update('user', $user);
    }

    public function updatePassword($userID, $newPassword)
    {
        $this->db->where('user_id', $userID);
        $this->db->set('password',md5($newPassword));
        $this->db->update('user');
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 0; // id not found
        } else {
            return 1;
        }
    }
}

/* End of file ModelName.php */
