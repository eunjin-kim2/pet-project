package com.springboot.pilotproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.pilotproject.dao.ownerDAO;
import com.springboot.pilotproject.dto.ownerDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ownerController {
	@Autowired
	private ownerDAO dao;
	
    @Autowired
    private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public String root() {
		return "redirect:/main";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
		
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/loginForm";
	}
	
	@RequestMapping("/loginError")
	public String loginError() {
		return "loginError";
	}
	
	@RequestMapping("/owner/ownermain")
	public String ownermain(Authentication auth, Model model) {

	    String o_id = auth.getName();
	    ownerDTO dto = dao.findById(o_id);

	    model.addAttribute("view", dto);

	    return "owner/ownermain";
	}
	
	@RequestMapping("/admin/adminmain")
	public String adminmain() {
	    return "admin/adminmain";
	}
	
	@RequestMapping("/admin/ownerList")
	public String adminownerList(Model model) {
		model.addAttribute("list", dao.ownerList());
	    return "admin/ownerList";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping("/ownerInsert")
	public String ownerInsert(HttpServletRequest request,ownerDTO dto) {
		String o_tel = request.getParameter("o_tel");
		String o_tel2 = request.getParameter("o_tel2");
		String o_tel3 = request.getParameter("o_tel3");
		String o_email = request.getParameter("o_email");
		String o_email2 = request.getParameter("o_email2");
		String o_addr = request.getParameter("o_addr");
		String o_addr2 = request.getParameter("o_addr2");
		String o_zipno = request.getParameter("o_zipno");
		dto.setO_tel(o_tel);
		
		//연락처
		dto.setO_tel(o_tel+"-"+o_tel2+"-"+o_tel3);
		//이메일
		dto.setO_email(o_email+ "@" +o_email2);
		//주소
		dto.setO_addr(o_addr+","+o_addr2);
		//우편번호
		dto.setO_zipno(o_zipno);
		
		 // 비밀번호
	    String o_passwd = request.getParameter("o_passwd");

	    // 비밀번호 암호화
	    dto.setO_passwd(passwordEncoder.encode(dto.getO_passwd()));
//	    String encPass = passwordEncoder.encode(o_passwd);
//	    dto.setO_passwd(encPass);
		
		dao.ownerInsert(dto);
		return "redirect:/main";
	}

	@RequestMapping("/admin/viewForm")
	public String viewForm(HttpServletRequest request, Model model) {
		String o_id = request.getParameter("o_id");
		ownerDTO dto = dao.findById(o_id);
		model.addAttribute("view",dto);
		return "admin/viewForm";
	}
	@RequestMapping("/owner/viewForm")
	public String ownerviewForm(HttpServletRequest request, Model model) {
		String o_id = request.getParameter("o_id");
		ownerDTO dto = dao.findById(o_id);
		model.addAttribute("view",dto);
		return "owner/ownerviewForm";
	}

	@RequestMapping("/admin/delete")
	public String adminDelete(HttpServletRequest request) {
		String o_id = request.getParameter("o_id");
		dao.ownerDelete(o_id);
		return "redirect:/admin/ownerList";
	}
	
	@RequestMapping("/owner/delete")
	public String ownerDelete(HttpServletRequest request) {
		String o_id = request.getParameter("o_id");
		dao.ownerDelete(o_id);
		return "redirect:/logout";
	}
	
	// 비밀번호 확인폼 (수정/탈퇴 공용)
	@RequestMapping("/owner/passwordCheckForm")
	public String passwordCheckForm(HttpServletRequest request,Model model) {
	    String mode = request.getParameter("mode");
	    model.addAttribute("mode", mode);
	    return "owner/passwordCheckForm";
	}
	
	// 비밀번호 확인 처리
	@RequestMapping("/owner/passwordCheck")
	public String passwordCheck(Authentication authentication,HttpServletRequest request, Model model) {
	    String mode = request.getParameter("mode");
	    String o_passwd = request.getParameter("o_passwd");

	    String o_id = authentication.getName();
	    ownerDTO dto = dao.findById(o_id);

	    if(dto != null && passwordEncoder.matches(o_passwd, dto.getO_passwd())) {
	        if("update".equals(mode)) {
	            model.addAttribute("updateForm", dto);
	            return "owner/ownerupdateForm";
	        }
	        else if("delete".equals(mode)) {
	            dao.ownerDelete(o_id);
	            return "redirect:/logout";
	        }
	    }

	    model.addAttribute("msg", "비밀번호가 틀렸습니다.");
	    model.addAttribute("mode", mode);

	    return "owner/passwordCheckForm";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}
	
	@RequestMapping("/admin/update")
	public String adminupdate(HttpServletRequest request,ownerDTO dto) {
		String o_id = request.getParameter("o_id");
		String o_tel = request.getParameter("o_tel");
		String o_tel2 = request.getParameter("o_tel2");
		String o_tel3 = request.getParameter("o_tel3");
		String o_email = request.getParameter("o_email");
		String o_email2 = request.getParameter("o_email2");
		String o_addr = request.getParameter("o_addr");
		String o_addr2 = request.getParameter("o_addr2");
		String o_zipno = request.getParameter("o_zipno");
		dto.setO_id(o_id);
		dto.setO_tel(o_tel);
		
		//연락처
		dto.setO_tel(o_tel+"-"+o_tel2+"-"+o_tel3);
		//이메일
		dto.setO_email(o_email+"@"+o_email2);
		//주소
		dto.setO_addr(o_addr+","+o_addr2);
		//우편번호
		dto.setO_zipno(o_zipno);
		dao.adminUpdate(dto);
		return "redirect:/admin/ownerList";
	}
	
	@RequestMapping("/admin/updateForm")
	public String adminupdateForm(HttpServletRequest request, Model model) {
		String o_id = request.getParameter("o_id");
		model.addAttribute("updateForm",dao.findById(o_id));
		return "admin/updateForm";
	}
	
	@RequestMapping("/owner/update")
	public String ownerupdate(HttpServletRequest request,ownerDTO dto) {
		String o_id = request.getParameter("o_id");
		String o_tel = request.getParameter("o_tel");
		String o_tel2 = request.getParameter("o_tel2");
		String o_tel3 = request.getParameter("o_tel3");
		String o_email = request.getParameter("o_email");
		String o_email2 = request.getParameter("o_email2");
		String o_addr = request.getParameter("o_addr");
		String o_addr2 = request.getParameter("o_addr2");
		String o_zipno = request.getParameter("o_zipno");
		dto.setO_tel(o_tel);
		
		//연락처
		dto.setO_tel(o_tel+"-"+o_tel2+"-"+o_tel3);
		//이메일
		dto.setO_email(o_email+"@"+o_email2);
		//주소
		dto.setO_addr(o_addr+","+o_addr2);
		//우편번호
		dto.setO_zipno(o_zipno);
		
		 // 비밀번호
	    String o_passwd = request.getParameter("o_passwd");

	    // 비밀번호 암호화
	    dto.setO_passwd(passwordEncoder.encode(dto.getO_passwd()));
	    dao.ownerUpdate(dto);
		
		return "redirect:/owner/ownermain";
	}
	
	@RequestMapping("/owner/updateForm")
	public String ownerupdateForm(HttpServletRequest request, Model model) {
		String o_id = request.getParameter("o_id");
		model.addAttribute("updateForm",dao.findById(o_id));
		return "owner/ownerupdateForm";
	}

}
