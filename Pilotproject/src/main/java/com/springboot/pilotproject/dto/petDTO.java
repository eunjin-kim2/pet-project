package com.springboot.pilotproject.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class petDTO {

	private int p_no;
	private String p_name;
	private String p_type;
	private String p_breed;
	private String p_birth;
	private String p_gender;
	private String p_neutered;
	private double p_weight;
	private String p_detail;
	private MultipartFile p_upload;
	private String p_image;
	private Date p_reg_date;
	private int o_no;   // 외래키 추가
}
