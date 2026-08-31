<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/petlist.css">
<title>Our Pets</title>
</head>
<body>
<div class="header">
    <div class="header-left">
        <img src="/images/logo3.png" alt="logo">
        <div class="header-title">Our Pets</div>
    </div>

    <div class="header-right">
        <a href="/">HOME</a>
        <a href="/logout">LOGOUT</a>
    </div>
</div>
<div class="intro-box">
    <h2>🐾 우리 아이들을 만나보세요</h2>

    <p>
        등록된 반려동물들의 정보를 확인해 보세요.<br>
        사진이나 이름을 클릭하면 상세 정보를 볼 수 있습니다.
    </p>
	<br>
    <div class="pet-count">
        현재 등록된 반려동물 <b>${list.size()}</b>마리
    </div>
</div>

	<table class="pet-table">
		<tr>
		<c:forEach var="pet" items="${list}" varStatus="status">
		    <td class="pet-box">
		        <a href="/pet/petView?p_no=${pet.p_no}">
		           <img src="/pet/image?name=${pet.p_image}" alt="p_image">
		        </a>
		        <div>
		            <a href="/pet/petView?p_no=${pet.p_no}">${pet.p_name}</a>
		        </div>
		    </td>
		    <c:if test="${(status.index + 1) % 5 == 0}">
		        </tr><tr>
		    </c:if>
		</c:forEach>
		</tr>
	</table>
<div class="btn-area">
    <a href="/owner/ownermain"><input type="button" value="이전페이지"></a>
    <a href="/pet/petWriteForm?o_no=${view.o_no}"><input type="button" value="반려동물 등록하기" class="write-btn"></a>
</div><br><br><br>
</body>
<footer class="footer">
    <div>평일 10:00 - 18:00(주말 및 공휴일 휴무)</div>
    <div>문의: kh1234@naver.com | 051-345-6789</div>
</footer>
</html>