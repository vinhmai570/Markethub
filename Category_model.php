<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Category_model extends CI_Model {
    /**
     * Comment of Thach, Task handle category 
     **/
    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function insertCategory($category)
    {
        $this->db->insert('category', $category);
        return $this->db->insert_id();
    }

    //get total property category
    public function getCategory(){
        $this->db->select('*');
        $category = $this->db->get('category');
        if($category->num_rows() > 0)
        {
            return $category->result_array();
        }else { return 0; }
    }


    public function getCategoryByID($id)
    {
        $this->db->select('category_id, name, banner, status, parent_id, create_date, update_date');
        $this->db->from('category');
        $this->db->where('category_id', $id);
        $categoryById = $this->db->get();
        $categoryById = $categoryById->result_array();
        return $categoryById;
    }

    //get all information category and ignore status
    public function getCategoryParentID($id)
    {
        $this->db->select('category_id, name, banner, status, parent_id, create_date, update_date');
        $this->db->from('category');
        $this->db->where('parent_id', $id);
        $categoryParentID = $this->db->get();
        if($categoryParentID->num_rows() > 0)
        {
            return $categoryParentID->result_array();
        }else { return 0; }
    }

    public function getCategoryStatusParentID($id)
    {
        $this->db->select('category_id, name, banner, status, parent_id, create_date, update_date');
        $this->db->from('category');
        $this->db->where('parent_id', $id);
        $this->db->where('status', '1');
        $categoryStatusParentID = $this->db->get();
        if($categoryStatusParentID->num_rows() > 0)
        {
            return $categoryStatusParentID->result_array();
        }else { return 0; }
    }

    public function getHomeCategory()
    {
        $this->db->select('category_id, name, banner, status, parent_id , create_date, update_date');
        $this->db->from('category');
        $this->db->where('parent_id', '0');
        $this->db->where('status', '1');
        $categoryParentID = $this->db->get();
        if($categoryParentID->num_rows() > 0)
        {
            return $categoryParentID->result_array();
        }else { return 0; }
    }

    //get category equal sql
    public function getCategorySQL($query)
    {
        return $this->db->get_where('category', $query);
    }

    public function updateCategory($category, $id)
    {
        $this->db->where('category_id', $id);
        return $this->db->update('category', $category);
    }
    
    public function deleteCategory($id)
    {
        $this->db->where('category_id',$id);
        $this->db->delete('category');
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 2; // id not found
        } else {
            return 1; // success
        }
    }
}

/* End of file ModelName.php */
