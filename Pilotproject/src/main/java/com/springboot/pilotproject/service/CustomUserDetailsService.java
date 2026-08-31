package com.springboot.pilotproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.springboot.pilotproject.dao.ownerDAO;
import com.springboot.pilotproject.dto.ownerDTO;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private ownerDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		ownerDTO dto = dao.findById(username);
		
		if(dto == null) {
			throw new UsernameNotFoundException("사용자가 없습니다.");
		}
		
		return User.builder()
				   .username(dto.getO_id())
				   .password(dto.getO_passwd())
				   .roles(dto.getO_authority())	   
				   .build();
	}
}