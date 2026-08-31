<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/passworkcheck.css">
<title>비밀번호 확인</title>
</head>

<body>

<div class="container">

    <h3>비밀번호 확인</h3>

    <div class="info">
        반려동물 정보 수정 또는 삭제를 위해<br>
        비밀번호를 입력하세요.
    </div>

    <form method="post" action="/pet/petPasswordCheck">

        <input type="hidden" name="p_no" value="${p_no}">
        <input type="hidden" name="mode" value="${mode}">

        <input type="password"
               name="o_passwd"
               placeholder="PassWord">

        <input type="submit" value="확인">

    </form>

    <c:if test="${not empty msg}">
        <p>${msg}</p>
    </c:if>

</div>

</body>
</html>