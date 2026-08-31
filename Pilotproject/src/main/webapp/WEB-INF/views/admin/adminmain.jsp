<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet" href="/css/adminmain.css">
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">관리자페이지</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
	
	<div class="container">
		<a href="/admin/ownerList"><input type="button" value="반려인 관리"></a>
		<a href="/pet/petList"><input type="button" value="반려동물 게시판"></a>
	</div>
	
	<footer class="footer">
	    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
	    <div>문의: kh1234@naver.com | 051-345-6789</div>
	</footer>
</body>
</html>