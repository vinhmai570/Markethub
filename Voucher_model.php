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
        $this->db->select('voucher_id, voucher_code, voucher_name, discount, user_id, expiration, create_date');
        $this->db->from('voucher');
        $this->db->where('voucher_id',$id);
        $this->db->join('user', 'user.user_id = voucher.user_id');
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

}

/* End of file ModelName.php */
