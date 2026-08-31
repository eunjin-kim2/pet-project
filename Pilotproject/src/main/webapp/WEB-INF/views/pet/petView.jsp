<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/petview.css">
<meta charset="UTF-8">
<title>반려동물 자세히 보기</title>
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">상세 정보</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="content">
<table style="table-layout:fixed; width:500px;">
    <colgroup>
        <!-- 첫 번째 열 (라벨) -->
        <col style="width:130px;">

        <!-- 두 번째 열 (데이터) -->
        <col style="width:auto;">
    </colgroup>

    <tr>
        <td colspan="2">
            <img src="/pet/image?name=${pet.p_image}" alt="p_image">
        </td>
    </tr>

    <tr>
        <td>이름</td>
        <td>${pet.p_name}</td>
    </tr>

    <tr>
        <td>동물종</td>
        <td>${pet.p_type}</td>
    </tr>

    <tr>
        <td>품종</td>
        <td>${pet.p_breed}</td>
    </tr>

    <tr>
        <td>생일</td>
        <td>${pet.p_birth}</td>
    </tr>

    <tr>
        <td>성별</td>
        <td>${pet.p_gender}</td>
    </tr>

    <tr>
        <td>중성화</td>
        <td>${pet.p_neutered}</td>
    </tr>

    <tr>
        <td>몸무게</td>
        <td>${pet.p_weight}kg</td>
    </tr>

    <tr class="detail-row">
        <td>특징</td>
        <td>${pet.p_detail}</td>
    </tr>
</table>
</div>
	<div class="btn-area">
		<a href="/pet/petList" class="btn">이전 페이지</a>
		<a href="/pet/petPasswordCheckForm?p_no=${pet.p_no}&mode=update" class="btn">수정하기</a>
		<a href="/pet/petPasswordCheckForm?p_no=${pet.p_no}&mode=delete" class="btn delete-btn">삭제하기</a>
	</div><br><br>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>