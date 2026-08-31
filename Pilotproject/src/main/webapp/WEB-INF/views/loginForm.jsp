<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/login.js"></script>
<link rel="stylesheet" href="/css/login.css">

<title>LOGIN</title>
</head>
<body>
	<form action="/j_spring_security_check" method="post" name="loginForm">
		<div style="text-align:center;">
    <img src="/images/logo3.png" width="100">
    <h3>LOGIN</h3>
</div>
		<table borer="1" width="300">
			<tr>
				<td><input type="text" name="o_id" placeholder="ID"></td>
			</tr>
			<tr>
				<td><input type="password" name="o_passwd" placeholder="PassWord"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인" onclick="return check()"><a href="/writeForm"><input type="button" value="회원가입"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>