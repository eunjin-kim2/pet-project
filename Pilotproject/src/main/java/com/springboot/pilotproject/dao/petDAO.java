package com.springboot.pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.pilotproject.dto.ownerDTO;
import com.springboot.pilotproject.dto.petDTO;

@Mapper
public interface petDAO {

	
	public List<petDTO> petList();

	
	public int petInsert(petDTO dto);
	
	public int petWrite(petDTO dto);
	
	//동물정보 상세보기, 수정폼
	public petDTO petView(int p_no);
	
	//동물정보 수정
	public int petUpdate(petDTO dto);
			
	//동물 삭제
	public int petDelete(int p_no);
	
}