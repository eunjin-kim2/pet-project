package com.springboot.pilotproject.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ownerDTO {
	
	private int o_no;
	private String o_id;
	private String o_passwd;
	private String o_name;
	private String o_tel;
	private String o_email;
	private String o_addr;
	private String o_zipno;
	private Date o_join_date;
	private String o_authority;
}
