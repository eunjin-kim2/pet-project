<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 아이 등록</title>
<script src="/js/petWrite.js"></script>
<link rel="stylesheet" href="/css/petwrite.css">
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">우리 아이 등록</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="content">
		<form action="/pet/petWrite" method="post" name="pet" enctype="multipart/form-data">
		<table width="400">
			<tr>
				<td>이름 </td>
				<td><input type="text" name="p_name"></td>
			</tr>
			<tr>
				<td>동물 종 </td>
				<td><input type="text" name="p_type" placeholder="강아지, 고양이"></td>
			</tr>
			<tr>
				<td>품종 </td>
				<td><input type="text" name="p_breed"></td>
			</tr>
			<tr>
				<td>출생일 </td>
				<td><input type="date" name="p_birth"></td>
			</tr>
			<tr>
				<td>성별 </td>
				<td>
				    <label class="radio-btn">
				        <input type="radio" name="p_gender" value="여아">
				        <span>여아</span>
				    </label>
				
				    <label class="radio-btn">
				        <input type="radio" name="p_gender" value="남아">
				        <span>남아</span>
				    </label>
				</td>
				<tr>
					<td>중성화 여부 </td>
					<td>
					    <label class="radio-btn">
					        <input type="radio" name="p_neutered" value="YES">
					        <span>YES</span>
					    </label>
					
					    <label class="radio-btn">
					        <input type="radio" name="p_neutered" value="NO">
					        <span>NO</span>
					    </label>
					</td>
			</tr>
			<tr>
				<td>몸무게 </td>
				<td><input type="text" name="p_weight" placeholder="숫자"> kg</td>
			</tr>
			<tr>
				<td>반려동물 상세 </td>
				<td>
					<textarea name="p_detail" cols="35" rows="5" placeholder="매력, 특징"></textarea>
				</td>
			</tr>
			<tr>
				<td>반려동물 사진 </td>
				<td><input type="file" name="p_upload"></td>
			</tr>
			</table>
			<div class="btn-area">
       			<input type="submit" value="등록하기" class="register-btn" onclick="return check()">
    		</div><br>
		</form>
		</div>


</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>