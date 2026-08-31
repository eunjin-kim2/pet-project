package com.springboot.pilotproject.controller;

import java.io.File;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.pilotproject.dao.ownerDAO;
import com.springboot.pilotproject.dao.petDAO;
import com.springboot.pilotproject.dto.ownerDTO;
import com.springboot.pilotproject.dto.petDTO;

@Controller
public class petController {
	@Autowired
	private petDAO dao;
	
	@Autowired
	private ownerDAO ownerdao;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/pet/petList")
	public String petList(Authentication auth,Model model) {
		model.addAttribute("list",dao.petList());
		String o_id = auth.getName();
	    ownerDTO owner = ownerdao.findById(o_id);

	    model.addAttribute("o_no", owner.getO_no());
		return "pet/petList";
	}

	
	@RequestMapping("/pet/petView")
	public String viewForm(@RequestParam("p_no") int p_no, Model model){
		model.addAttribute("pet",dao.petView(p_no));
		return "pet/petView";
	}
	
	
	 @RequestMapping("/pet/petWriteForm")
	    public String petWriteForm(Authentication auth, Model model) {

	        String o_id = auth.getName();
	        ownerDTO ownerdto = ownerdao.findById(o_id);

	        model.addAttribute("o_no", ownerdto.getO_no());

	        return "pet/petWriteForm";
	    }
	
	@RequestMapping("/pet/petWrite")
	public String petWrite(petDTO dto,@RequestParam("p_upload") MultipartFile p_upload, Principal principal)throws Exception{
		String o_id = principal.getName(); //로그인한 관리자
		ownerDTO ownerdto = ownerdao.findById(o_id); //관리자 정보 조회
		dto.setO_no(ownerdto.getO_no()); //상품 등록자 번호 자동 세팅
	
		if (!p_upload.isEmpty()) {
			String p_image = p_upload.getOriginalFilename();
			p_upload.transferTo(new File("C:\\SPRINGBOOT\\Pilotproject\\src\\main\\resources\\static\\images\\" + p_image));
			dto.setP_image(p_image);
		} 
		dao.petInsert(dto);
		
		return "redirect:/pet/petList";
	}
	
	
	@RequestMapping("/pet/petUpdate")
	public String petupdate(petDTO dto,@RequestParam("p_upload") MultipartFile p_upload, Principal principal)throws Exception{
		
		String o_id = principal.getName(); //로그인한 관리자
		ownerDTO ownerdto = ownerdao.findById(o_id); //관리자 정보 조회
		dto.setO_no(ownerdto.getO_no()); //상품 등록자 번호 자동 세팅
	
		petDTO oldPet = dao.petView(dto.getP_no());
		// 기존 반려인 번호 유지
	    dto.setO_no(oldPet.getO_no());
		
	    if (!p_upload.isEmpty()) {
	    	String p_image = p_upload.getOriginalFilename();

	        p_upload.transferTo(
	        		new File("C:/upload/" + p_image)
	        );

	        dto.setP_image(p_image);
	    } else {
	        dto.setP_image(oldPet.getP_image());
	    }
		dao.petUpdate(dto);
		return "redirect:/pet/petList";
	}
	
	@RequestMapping("/pet/petUpdateForm")
	public String petupdateForm(Model model,@RequestParam("p_no") int p_no) {
		model.addAttribute("updateForm",dao.petView(p_no));
		return "pet/petUpdateForm";
	}
	
	// 수정 버튼 누르면 비밀번호 확인 페이지로 이동
	@RequestMapping("/pet/petUpdateCheck")
	public String petUpdateCheck(@RequestParam("p_no") int p_no,Model model) {

	    model.addAttribute("p_no", p_no);
	    model.addAttribute("mode", "update");

	    return "pet/petPasswordCheckForm";
	}
	
	// 비밀번호 확인
	@RequestMapping("/pet/petPasswordCheck")
	public String petPasswordCheck(
	        @RequestParam("p_no") int p_no,
	        @RequestParam("mode") String mode,
	        @RequestParam("o_passwd") String o_passwd,
	        Principal principal,
	        Authentication auth,
	        Model model) {

	    String o_id = principal.getName();
	    ownerDTO owner = ownerdao.findById(o_id);

	    petDTO pet = dao.petView(p_no);

	    boolean isAdmin = auth.getAuthorities().stream()
	            .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

	    // 일반 회원은 자기 반려동물만 가능
	    if (!isAdmin && pet.getO_no() != owner.getO_no()) {
	        return "redirect:/pet/petList";
	    }

	    if (passwordEncoder.matches(o_passwd, owner.getO_passwd())) {

	        if (mode.equals("update")) {
	            return "redirect:/pet/petUpdateForm?p_no=" + p_no;
	        }

	        if (mode.equals("delete")) {
	            dao.petDelete(p_no);
	            return "redirect:/pet/petList";
	        }
	    }

	    model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
	    model.addAttribute("p_no", p_no);
	    model.addAttribute("mode", mode);

	    return "pet/petPasswordCheckForm";
	}
	
	@RequestMapping("/pet/petPasswordCheckForm")
	public String petPasswordCheckForm(@RequestParam("p_no") int p_no,
			@RequestParam("mode") String mode,Model model) {

	    model.addAttribute("p_no", p_no);
	    model.addAttribute("mode", mode);

	    return "pet/petPasswordCheckForm";
	}
	
	@RequestMapping("/pet/image")
	public ResponseEntity<Resource> petImage(
	        @RequestParam("name") String name) throws Exception {

	    File file = new File("C:/upload/" + name);

	    Resource resource = new FileSystemResource(file);

	    return ResponseEntity.ok()
	            .body(resource);
	}
	
}
