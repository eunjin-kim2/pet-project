package com.springboot.pilotproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.pilotproject.dto.ownerDTO;

@Mapper
public interface ownerDAO {
	
	//로그인용 조회,회원정보 상세보기, 수정폼
	public ownerDTO findById(String o_id);
	
	//회원 목록
	public List<ownerDTO> ownerList();
	
	//회원가입
	public int ownerInsert(ownerDTO dto);
		
	//회원정보 수정
	public int ownerUpdate(ownerDTO dto);
	public int adminUpdate(ownerDTO dto);
		
	//회원 탈퇴
	public int ownerDelete(String o_id);
	public int adminDelete(String o_id);
}
