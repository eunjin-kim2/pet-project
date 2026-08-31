<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/ownerlist.css">
<title>반려인 목록</title>
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">반려인 목록</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="content">
	<table class="owner-table">
		<tr>
			<th>no</th>
			<th>ID</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>가입일</th>
		</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td><a href="/admin/viewForm?o_id=${dto.o_id}">${dto.o_no}</a></td>
			<td><a href="/admin/viewForm?o_id=${dto.o_id}">${dto.o_id}</a></td>
			<td><a href="/admin/viewForm?o_id=${dto.o_id}">${dto.o_name}</a></td>
			<td>${dto.o_tel}</td>
			<td>${dto.o_email }</td>
			<td>${dto.o_addr }</td>
			<td>${dto.o_zipno }</td>
			<td><fmt:formatDate value="${dto.o_join_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</table>
	<div class="btn-area">
		<a href="/admin/adminmain" class="btn"><input type="button" value=" 이전 페이지"></a>
	</div>
	</div>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>