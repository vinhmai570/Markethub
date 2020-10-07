<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Voucher_model extends CI_Model {
    
    public function __construct()
	{
		parent::__construct();
		
    }
    
    public function getVoucher()
    {
        $this->db->select('*');
        $voucher = $this->db->get('voucher');
        if ($voucher->num_rows() > 0) {
            return $voucher->result_array();
        } else {
            return 0;
        }
    }


    public function getVoucherByID($id)
    {
        $this->db->select('*');
        $this->db->from('voucher');
        $this->db->where('voucher_id',$id);
        $this->db->join('user', 'user.user_id = voucher.shop_id');
        $voucherByID = $this->db->get()->row();
        return $voucherByID;
    }

    public function getVoucherSQL($query)
    {
        return $this->db->get_where('voucher', $query);
    }

    public function insertVoucher($voucher)
    {
        $this->db->insert('voucher', $voucher);
        return $this->db->insert_id();
    }

    public function updateVoucher($voucher, $id)
    {
        $this->db->where('voucher_id', $id);
        return $this->db->update('voucher', $voucher);
    }
    
    public function deleteVoucher($id)
    {
        $this->db->where('voucher_id',$id);
        $this->db->delete('voucher');
        if ($this->db->error()['message']) {
            return 0; // error
        } else if (!$this->db->affected_rows()) {
            return 2; // id not found
        } else {
            return 1; // success
        }
    }


    function DeleteExpriredVoucher()
    {
        $this->db->select('*');
        $this->db->from('voucher');
        $this->db->where('DATEDIFF(CURDATE(), voucher.update_date) >= voucher.expiration or quantity <= 0');
        $this->db->delete('voucher');
    }

}

/* End of file ModelName.php */