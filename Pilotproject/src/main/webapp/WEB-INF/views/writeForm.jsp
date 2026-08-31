<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/js/write.js"></script>
<link rel="stylesheet" href="/css/write.css">

</head>
<body>
	<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">회원가입</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
	</div>
	<form action="/ownerInsert" method="post" name="owner">
		<table width="500">
			<tr>
				<td>아이디 </td>
				<td><input type="text" name="o_id" placeholder="ID"></td>
			</tr>
			<tr>
				<td>비밀번호 </td>
				<td><input type="password" name="o_passwd" placeholder="PassWord"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="o_passwd2" placeholder="PassWord"></td>
			</tr>
			<tr>
				<td>이름 </td>
				<td><input type="text" name="o_name"></td>
			</tr>
			<tr>
				<td>전화번호 </td>
				<td>
					<input type="text" name="o_tel" size="3" maxlength="3"> - 
					<input type="text" name="o_tel2" size="4" maxlength="4"> - 
					<input type="text" name="o_tel3" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td>
					<input type="text" name="o_email">@
					<select name="o_email2">
						<option value="">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.com">daum.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>주소 </td>
				<td><input type="text" name="o_addr" readonly><input type="button" onclick="goPopup();" value="주소검색"></td>
			</tr>
			<tr>
				<td>상세주소 </td>
				<td><input type="text" name="o_addr2" readonly></td>
			</tr>
			<tr>
				<td>우편번호 </td>
				<td><input type="text" name="o_zipno" readonly></td>
			</tr>
		</table>
		<div class="btn-area">
		    <input type="submit" value="회원가입" onclick="return check()">
		</div>
	</form>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>