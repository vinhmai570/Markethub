<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/controllers/Auth.php';

use chriskacerguis\RestServer\RestController;

class Category extends RestController {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Category_model');
        $this->auth = new Auth();
    }

    public function index()
    {
       
    }

    public function getCategory_get()
    {
        $category = $this->Category_model->getCategory();
        if($category) {
            $this->response($category, 200);
        } 
    }

    public function id_get($id)
    {
        $CategoryByID = $this->Category_model->getCategoryByID($id);
        $this->response($CategoryByID,200);
    }

    public function ParentID_get($id)
    {
        $CategoryParentID = $this->Category_model->getCategoryParentID($id);
        $this->response($CategoryParentID,200);
    }

    public function ParentStatusID_get($id)
    {
        $CateStatusParentID = $this->Category_model->getCategoryStatusParentID($id);
        $this->response($CateStatusParentID,200);
    }

    public function HomeCategory_get()
    {
        $HomeCate = $this->Category_model->getHomeCategory();
        $this->response($HomeCate,200);
    }

    public function insertCategory_post()
    {
        $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) 
            {                   // admin or editor
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin' || $getPermission['permission'] == 'editor') 
                    { $checkAuth =true; 
                }
                if($checkAuth == true) 
                {     
                    $category_Name = $this->post('name'); 
                    $category_Banner = $this->post('banner');
                    $category_UserID = $this->post('user_id');
                    $category_Parent_ID = $this->post('parent_id');
                    $createDate = $updateDate= date("Y-m-d h:i:sa");
                    //checking name already exists then to show error
                    $que=$this->db->query("select * from category where name='$category_Name'");
                    $row = $que->num_rows();
                    if($row>0)
                    {
                        $message = array(
                            'status' => false,
                            'message' => 'Category name is already exists'
                        );
                        $this->response($message,200);
                    } else {  //if not already exists, then running code bellow
                        if($category_Name !='' && $category_UserID!='') {
                            $category = array(
                                'name'=> $category_Name,
                                'banner' => $category_Banner,
                                'user_id' => $category_UserID,
                                'parent_id' => $category_Parent_ID,
                                'create_date' => $createDate,
                                'update_date' => $createDate 
                            );
                            if ($this->Category_model->insertCategory($category))
                            {
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
                        }else   {
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
        }else   {                                    // not access
            $message = array(
                'status' => false,
                'message' => 'Authorization'
            );
            $this->response($message,400);
        }
    }

    public function updateCategory_put()
    {
        $id= $this->put('id');
        if ($id!='') 
        {
            $getPermission = $this->auth->checkPermission();
            if ($getPermission['status'] == true) // admin or editor
            {                   
                $checkAuth = false;
                if ($getPermission['permission'] == 'admin')  {  $checkAuth = true; }
                else if ($getPermission['permission'] == 'editor') 
                {
                    $CategoryByID = $this->Category_model->getCategoryByID($id);
                    $userID = $CategoryByID->user_id;
                    if ($userID == $getPermission['user_id']) { $checkAuth = true; } // category created by this user_id 
                }
                if ($id!='') 
                {
                    $category_Name = $this->put('name'); 
                    $category_Banner = $this->put('banner');
                    $category_UserID = $this->put('user_id');
                    $category_Status = $this->put('status');
                    $category_Parent_ID = $this->put('parent');
                    $updateDate= date("Y-m-d h:i:sa");

                    //checking name already exists then to show error
                    $que=$this->db->query("select * from category where name='$category_Name' and category_id != $id");
                    $row = $que->num_rows();
                    if($row>0)
                    {
                        $message = array(
                            'status' => false,
                            'message' => 'Category name is already exists'
                        );
                        $this->response($message,200);
                    } else {  //if not already exists, then running code bellow
                        if($category_Name !='' && $category_UserID!='') {
                            $category = array(
                                'name'=> $category_Name,
                                'banner' => $category_Banner,
                                'user_id' => $category_UserID,
                                'parent_id' => $category_Parent_ID,
                                'status' => $category_Status,
                                'update_date' => $updateDate
                            );
                            if ($this->Category_model->updateCategory($category, $id)) {
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
                    $CategoryByID = $this->Category_model->getCategoryByID($id);
                    $userID = $CategoryByID->user_id;
                    if ($userID == $getPermission['user_id']) { $checkAuth = true; }     // category created by this user_id 
                }

                if($checkAuth == true) 
                {  
                    $que=$this->db->query("select * from category where category_id = $id and parent_id != 0");
                    $row = $que->num_rows();
                    if($row>0)
                    {
                        $message = array(
                            'status' => false,
                            'message' => 'Parent categories really exist, you cannot delete'
                        );
                        $this->response($message,200);
                    }
                    $checkDelete = $this->Category_model->deleteCategory($id);
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
                            'message' => 'Category Not found'
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
