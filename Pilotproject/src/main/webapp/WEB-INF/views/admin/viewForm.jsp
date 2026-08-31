<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려인 상세정보</title>
<link rel="stylesheet" href="/css/ownerview.css">
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">반려인 상세정보</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="content">
	<table width="400">
			<tr>
				<td>아이디 </td>
				<td>${view.o_id}</td>
			</tr>
			<tr>
				<td>이름 </td>
				<td>${view.o_name}</td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td>${view.o_tel}</td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td>${view.o_email}</td>
			</tr>
			<tr>
				<td>주소 </td>
				<td>${view.o_addr}</td>
			</tr>
			<tr>
				<td>우편번호 </td>
				<td>${view.o_zipno}</td>
			</tr>
				
		</table>
	<div class="btn-area">
		<a href="/admin/ownerList" class="btn"><input type="button" value=" 이전 페이지"></a>
		<a href="/admin/updateForm?o_id=${view.o_id}"><input type="button" value="회원정보수정" class="update-btn"></a>
		<a href="/admin/delete?o_id=${view.o_id}"><input type="button" value="회원탈퇴" class="update-btn"></a>
	</div>
		
	</div>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>