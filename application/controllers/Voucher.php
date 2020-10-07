<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Voucher extends RestController {


    function __construct()
    {
        parent::__construct();
        $this->load->model('Voucher_model');
        $this->auth = new Auth();
    }
   

    public function randomString($length) {
        $keys = array_merge(range(0,9), range('a', 'z'));
        $key = "";
        for($i=0; $i < $length; $i++) {
            $key .= $keys[mt_rand(0, count($keys) - 1)];
        }
        return $key;
    }

    public function getVoucher_get()
    {
        $voucher = $this->Voucher_model->getVoucher();
        if($voucher) {
            $this->response($voucher, 200);
        } 
        
    }

    public function id_get($id)
    {
        $VoucherByID = $this->Voucher_model->getVoucherByID($id);
        $this->response($VoucherByID,200);
    }

    public function insertVoucher_post()
    {
        $getPermission = $this->auth->checkPermission();
        if ($getPermission['status'] == true) {                   // admin or editor
            $checkAuth = false;
            if ($getPermission['permission'] == 'admin' || $getPermission['permission'] == 'editor') { $checkAuth =true; }
    
            if($checkAuth == true) 
            {     
            $voucher_Code = strtoupper($this->randomString(8));
            $voucher_Name = $this->post('voucher_name'); 
            $voucher_discount = $this->post('discount');
            $quantity = $this->post('quantity'); 
            $voucher_ShopID = $this->post('shop_id');
            $voucher_Expiration = $this->post('expiration');
            $status = 1;
            $createDate = $updateDate= date("Y-m-d h:i:sa");
            //checking name already exists then to show error
            $que=$this->db->query("select * from voucher where voucher_name='$voucher_Name'");
            $row = $que->num_rows();
                if($row>0) {
                    $message = array(
                        'status' => false,
                        'message' => 'Voucher name is already exists'
                    );
                    $this->response($message,200);
                } else {  //if not already exists, then running code bellow
                    if($voucher_Name !='' && $voucher_ShopID!='' && $voucher_Code!='' &&$voucher_discount!='') {
                        $voucher = array(
                            'voucher_code' => $voucher_Code,
                            'voucher_name'=> $voucher_Name,
                            'discount' => $voucher_discount,
                            'quantity' => $quantity,
                            'shop_id' => $voucher_ShopID,
                            'expiration'=> $voucher_Expiration,
                            'status' => $status,
                            'create_date' => $createDate,
                            'update_date' => $createDate 
                        );
                        if ($this->Voucher_model->insertVoucher($voucher)) {
                            //$this->Voucher_model->DeleteExpriredVoucher();
                            $message = array(
                                'status' => true,
                                'message' => 'Success'
                            );
                            $this->response($message,200);
                        } else{
                            $message = array(
                                'status' => false,
                                'message' => 'Error'
                            );
                            $this->response($message,404);
                        }
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Vui lòng nhập đầy đủ thông tin!'
                        );
                        $this->response($message,400);
                    }
                }
            } else {                                 // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,404);
            }
        } else {                                    // not access
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,400);
        }
    }

    public function updateVoucher_put()
    {
        $id= $this->put('voucher_id');
        if ($id!='') 
        {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) // admin or editor
            {                   
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  {  $checkAuth = true; }
                else if ($getPermission['permission'] == 'editor') 
                {
                    $VoucherByID = $this->Voucher_model->getVoucherByID($id);
                    $userID = $VoucherByID->user_id;
                    if ($userID == $getPermission['user_id']) { $checkAuth = true; } // voucher created by this user_id 
                }
                if ($id!='') 
                {
                    
                    $voucher_Name = $this->put('voucher_name'); 
                    $voucher_discount = $this->put('discount');
                    $quantity = $this->put('quantity');
                    $voucher_ShopID = $this->put('shop_id');
                    $voucher_Expiration = $this->put('expiration');
                    $status = $this->put('status');
                    $updateDate= date("Y-m-d h:i:sa");

                    //checking name already exists then to show error
                    $que=$this->db->query("select * from voucher where voucher_name='$voucher_Name' and voucher_id != $id");
                    $row = $que->num_rows();
                    if($row>0)
                    {
                        $message = array(
                            'status' => false,
                            'message' => 'voucher name is already exists'
                        );
                        $this->response($message,200);
                    } else {  //if not already exists, then running code bellow
                        if($voucher_Name !='' && $voucher_ShopID!='' &&$voucher_discount !='') {
                            $voucher = array(
                                'voucher_name'=> $voucher_Name,
                                'discount' => $voucher_discount,
                                'quantity' => $quantity,
                                'shop_id' => $voucher_ShopID,
                                'expiration'=> $voucher_Expiration,
                                'status' => $status,
                                'update_date' => $updateDate
                            );
                            if ($this->Voucher_model->updateVoucher($voucher, $id)) {
                                $message = array(
                                    'status' => true,
                                    'message' => 'Updated Successfully'
                                );
                                $this->response($message,200);
                            } else{
                                $message = array(
                                    'status' => false,
                                    'message' => 'Update Error'
                                );
                                $this->response($message,404);
                            }
                        }
                        else {
                            $message = array(
                                'status' => false,
                                'message' => 'Vui lòng nhập đầy đủ thông tin!'
                            );
                            $this->response($message,400);
                        }
                    }
                }
                else {                                 // not access
                    $message = array(
                        'status' => false,
                        'message' => 'Authorization'
                    );
                    $this->response($message,404);
                }
            }
            else {                                 // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,404);
            }
        }
    }
    
    public function delete_delete($id)
    {
        if ($id!='') 
        {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) 
            {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  { $checkAuth =true; } 
                else if ($getPermission['permission'] == 'editor') 
                {
                    $VoucherByID = $this->Voucher_model->getVoucherByID($id);
                    $userID = $VoucherByID->user_id;
                    if ($userID == $getPermission['user_id']) { $checkAuth = true; }     // voucher created by this user_id 
                }

                if($checkAuth == true) 
                {  
                    $checkDelete = $this->Voucher_model->deleteVoucher($id);
                    if ($checkDelete == 1) {
                        $message = array(
                            'status' => true,
                            'message' => 'Success'
                        );
                        $this->response($message,200);
                    } else if($checkDelete == 0) {
                        $message = array(
                            'status' => false,
                            'message' => 'Error'
                        );
                        $this->response($message,400);
                    } else {
                        $message = array(
                            'status' => false,
                            'message' => 'Voucher Not found'
                        );
                        $this->response($message,404);
                    }
                }
            }
            else {                                    // not access
                $message = array(
                    'status' => false,
                    'message' => 'Authorization'
                );
                $this->response($message,400);
            }
        }
        else {                                    // not access
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,400);
        }
    }

}
/* End of file Controllername.php */
?>