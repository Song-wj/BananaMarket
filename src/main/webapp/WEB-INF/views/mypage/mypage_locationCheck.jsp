<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 인증</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a99b377be4054deadacd517c12c13fbf"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);
</script>
</head>
<style>
	.mypage_locationCheck {
		width:98%;
		height:700px;
		margin:auto;
	}
	.mypage_locationCheck label:nth-child(2) {
		margin: 10px 0 10px 300px;
		font-size:22px;
	}
	.mypage_locationCheck label:nth-child(3) {
		display:inline-block;
		font-size:20px;
		color:rgb(98,71,24);
		text-shadow: -0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500;
		margin: 30px 0 40px 400px;
	}
	.mypage_locationCheck label:nth-child(3):hover{
		color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
	} 
	.mypage_locationCheck button {
		color:RGB(82,67,21);
		background-color:#FEE500;
		border:1px solid #FEE500;
		font-size:18px;
		font-weight:bold;
		width: 190px;
		height: 60px;
		margin: 0 420px; 
		padding:15px 17px;
		border-radius:5px;
     	}
    .mypage_locationCheck button:hover {
		opacity:0.7;
	}
	#map {
		border:1px solid green;
		margin: 35px 130px;
		width:800px;
		height:500px;
	}
</style>
<body>
	<div class="mypage_locationCheck">
		<section class="section1_locationCheck">
			<div class="map" id="map">나와라 지도지도</div>
			<label>현재 위치가 내 동네로 설정한 '<b>이의동</b>'에 있습니다.</label>
			<label>왜 동네 인증을 해야하나요?</label><br>
			<button type="button">동네 인증 완료하기</button>
		</section>
	</div>	
</body>
</html>