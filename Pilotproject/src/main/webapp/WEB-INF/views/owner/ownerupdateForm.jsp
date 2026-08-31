<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려인 정보수정</title>
<script src="/js/ownerupdate.js"></script>
<link rel="stylesheet" href="/css/ownerupdate.css">
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">반려인 정보수정</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>

<form action="/owner/update" method="post" name="owner">
<input type="hidden" name="o_id" value="${updateForm.o_id}">
<div class="content">
	<table>
		<tr>
			<td>아이디 </td>
			<td>${updateForm.o_id}</td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td> <input type="password" name="o_passwd"></td>
		</tr>
		<tr>
			<td>이름 </td>
			<td>${updateForm.o_name}</td>
		</tr>
		<tr>
			<td>전화번호 </td>
			<td><input type="text" name="o_tel" size="3" maxlength="3" value="${fn:split(updateForm.o_tel,'-')[0] }"> - 
				<input type="text" name="o_tel2" size="4" maxlength="4" value="${fn:split(updateForm.o_tel,'-')[1] }"> - 
				<input type="text" name="o_tel3" size="4" maxlength="4" value="${fn:split(updateForm.o_tel,'-')[2] }"></td>
		</tr>
		<tr>
			<td>이메일 </td>
			<td>
				<input type="text" name="o_email" value="${fn:split(updateForm.o_email,'@')[0] }">@
				<select name="o_email2">
					<option value="">선택</option>
					<option value="naver.com" <c:if test="${fn:contains(updateForm.o_email,'naver.com')}">selected</c:if>>naver.com</option>
					<option value="gmail.com" <c:if test="${fn:contains(updateForm.o_email,'gmail.com')}">selected</c:if>>gmail.com</option>
					<option value="daum.com" <c:if test="${fn:contains(updateForm.o_email,'daum.com')}">selected</c:if>>daum.com</option>
					<option value="nate.com" <c:if test="${fn:contains(updateForm.o_email,'nate.com')}">selected</c:if>>nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주소 </td>
			<td><input type="text" name="o_addr" readonly value="${fn:split(updateForm.o_addr,',')[0] }">
			<input type="button" value="주소검색" onclick="goPopup()"></td>
		</tr>
		<tr>
			<td>상세주소 </td>
			<td><input type="text" name="o_addr2" readonly value="${fn:split(updateForm.o_addr,',')[1] }"></td>
		</tr>
		<tr>
			<td>우편번호 </td>
			<td><input type="text" name="o_zipno" readonly value="${updateForm.o_zipno}"></td>
		</tr>
	</table>
	<div class="btn-area">
		<input type="submit" value="수정하기" onclick="return check()" class="update-btn">
		<a href="/owner/ownermain"><input type="button" value="수정취소"></a>
	</div>
	</div>
</form>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>