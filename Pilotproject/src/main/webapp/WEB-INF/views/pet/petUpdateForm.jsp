<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/js/petUpdate.js"></script>
<link rel="stylesheet" href="/css/petupdate.css">
<title>반려동물 정보수정</title>
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">반려동물 정보수정</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="content">
		<form action="/pet/petUpdate" method="post" name="pet" enctype="multipart/form-data">
		
		<table>
			<tr>
				<td>이름 </td>
				<td>${updateForm.p_name}</td>
			</tr>
			<tr>
				<td>동물 종 </td>
				<td>${updateForm.p_type}</td>
			</tr>
			<tr>
				<td>품종 </td>
				<td>${updateForm.p_breed}</td>
			</tr>
			<tr>
				<td>출생일 </td>
				<td>${updateForm.p_birth}</td>
			</tr>
			<tr>
				<td>성별 </td>
				<td>${updateForm.p_gender}</td>
			</tr>
			<tr>
				<td>중성화 여부 </td>
				 <td>
				  <label class="radio-btn">
				        <input type="radio" name="p_neutered" value="YES"
				            ${updateForm.p_neutered=='YES'?'checked':''}><span>YES</span>
				  </label>
				  <label class="radio-btn">
				        <input type="radio" name="p_neutered" value="NO"
				            ${updateForm.p_neutered=='NO'?'checked':''}><span>NO</span>
				  </label>
    			</td>
			</tr>
			<tr>
				<td>몸무게 </td>
				<td><input type="text" name="p_weight" placeholder="숫자" value="${updateForm.p_weight}"> kg</td>
			</tr>
			<tr>
				<td>반려동물 상세 </td>
				<td>
					<textarea name="p_detail" cols="35" rows="5" placeholder="매력, 특징">${updateForm.p_detail}</textarea>
				</td>
			</tr>
			<tr>
				<td>반려동물 사진 </td>
				<td><input type="file" name="p_upload"></td>
			</tr>
		</table>
		<div class="btn-area">
			<input type="hidden" name="p_no" value="${updateForm.p_no}">
			<input type="submit" value="수정하기" onclick="return check()" class="register-btn">
		</div><br>
	</form>
	</div>
</body>
</html>