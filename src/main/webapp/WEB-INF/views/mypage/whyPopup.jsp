<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7ce94d4dd9c22ccad809655bc3ab74f&libraries=services"></script>
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/banana//js/jqbar.js"></script>

</head>
<body>
	<div></div>
	<div>키워드 알림이 오지 않는 경우를 확인해 보세요</div><div></div>
	<h2>1. 새롭게 작성한 게시글에 대해서만 알림이 울려요.</h2>
	<div>끌어올리기한 게시글은 키워드 알림이 울리지 않아요.</div>
	<div></div><div></div>
	<h2>2. 게시글 제목에 키워드가 포함되어 있지 않은 경우</h2>
	<div>게시글의 제목에 키워드가 정확히 매칭되는 경우에만 알림이 울려요.</div>
	<div>띄어쓰기와 맞춤법이 달라도 울리지 않을 수 있는 점 참고 부탁드릴게요.</div>
	<div>게시글 제목에 포함될 수 있는 키워드로 등록해 주세요.</div>
	<div></div><div></div>
	<h2>3. 이미 동일한 키워드 알림을 받은 적이 있는 경우</h2>
	<div>키워드 알림은 1번만 발송돼요. 동일한 키워드 알림이라면 1번 이상</div>
	<div>발송되지 않는 점 참고해 주세요.</div>
	<div></div><div></div>
	<h2>4. 키워드 알림을 끈 상태일 경우</h2>
	<div>키워드 알림이 꺼져 있는 상태라면 키워드 알림을 켜주세요.</div>

</body>
</html>