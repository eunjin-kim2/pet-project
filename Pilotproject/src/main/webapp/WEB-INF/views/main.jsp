<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/main.css">
<title>반려동물 등록</title>
</head>
<body>
<div class="container">
	<div class="title-area">
	    <img src="/images/logo3.png" alt="logo" class="logo">
	    <h2>반려동물 등록</h2>
	</div>
    <hr>

    <!-- 비회원 -->
    <sec:authorize access="isAnonymous()">

        <div class="desc">
            <p>환영합니다.</p>
            <p>반려동물 등록 및 관리를 위한 서비스입니다.</p>
            <p>우리 아이의 정보를 등록하고, 사진과 함께 소중한 추억을 남겨보세요.</p>
            <p>우리 아이를 자랑해 보아요!</p>
        </div>

        <div class="btn-area">
            <a href="/loginForm" class="btn">
                <input type="button" value="로그인" class="login">
            </a>

            <a href="/writeForm" class="btn">
                <input type="button" value="회원가입" class="join">
            </a>
        </div>

    </sec:authorize>


    <!-- 일반회원 -->
    <sec:authorize access="hasRole('USER')">
		<div class="user-name">
   			<span class="username">
        		<sec:authentication property="principal.username"/>
    		</span>님 환영합니다 😊
		</div>

        <div class="btn-area">
            <a href="/owner/ownermain" class="btn">
                <input type="button" value="반려인페이지" class="mypage">
            </a>

            <a href="/logout" class="btn">
                <input type="button" value="로그아웃" class="logout">
            </a>
        </div>

    </sec:authorize>


    <!-- 관리자 -->
    <sec:authorize access="hasRole('ADMIN')">

        <div class="user-name">
        	관리자
        	<span class="username">
       		 	<sec:authentication property="principal.username"/>
    		</span> 님 환영합니다.
        </div>

        <div class="btn-area">
            <a href="/admin/adminmain" class="btn">
                <input type="button" value="관리자 페이지" class="admin">
            </a>

            <a href="/logout" class="btn">
                <input type="button" value="로그아웃" class="logout">
            </a>
        </div>

    </sec:authorize>

</div>
</body>
</html>