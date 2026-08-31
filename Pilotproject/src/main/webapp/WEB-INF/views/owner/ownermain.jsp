<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/ownermain.css">
<title>반려인 페이지</title>
</head>

<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">반려인 페이지</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>

<!-- ===== CONTENT ===== -->
<div class="container">

    <a href="/owner/viewForm?o_id=${view.o_id}"><input type="button" value="반려인 상세 정보"></a>

    <a href="/owner/passwordCheckForm?mode=update"><input type="button" value="반려인 정보 수정"></a>

    <a href="/pet/petList"><input type="button" value="Our Pets"></a>

    <a href="/pet/petWriteForm?o_no=${view.o_no}"><input type="button" value="반려동물 등록하기"></a>

    <a href="/owner/passwordCheckForm?mode=delete" class="full">
   		<input type="button" value="회원탈퇴"  class="delete-btn">
	</a>
</div>
<!-- ===== FOOTER ===== -->
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>

</body>
</html>