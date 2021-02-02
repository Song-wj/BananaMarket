<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2cb442acb5509f83b057470646a5299b&libraries=services"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		if(${result}){
			$("#btnLike").addClass('btn_like');
		}
		
		$("#btnLike").click(function(){
			  if($(this).hasClass('btn_like')){
				  //좋아요 취소
				  $(this).removeClass('btn_like');
				  
				//ajax를 활용한 서버 연동
				  $.ajax({
					  url:"shop_unlike.do?mid=whtjdrnr010&sid=${vo.sid }", //mid는 로그인한사람id
					  success:function(result){
						  alert("좋아요 취소되었습니다");
						  location.reload();
						  }
					});
				
			  }
			  else{
				  //좋아요 눌렀을 때
				  $(this).addClass('btn_like');

				//ajax를 활용한 서버 연동
					$.ajax({
						url:"shop_like.do?mid=whtjdrnr010&sid=${vo.sid }", //mid는 로그인한사람id
						success:function(result){
							alert("좋아요 반영되었습니다");
							location.reload();
							$(this).addClass('btn_like');
						}
					});
			  }
			});
	});
	
</script>
<style>
	.store-info-top {
		text-align: center;
	}
	
	.store-info-top .image-container {
		margin-top: 110px;
		z-index: 1;
	}
	
	.store-info-top .image-container img {
		width: 65%;
		height: 450px;
	}
	
	.store-info-top .image-container #dark-cover {
		border: 5px solid red;
		position: relative;
		margin-top: -455px;
		margin-left: 330px;
		width: 65%;
		height: 450px;
		z-index: 2;
    	background-color: #495057;
    	opacity: .7;
	}
	
	.store-info-top .desc-container {
		z-index: 3;
	    display: flex;
	    flex-direction: row;
	    justify-content: flex-start;
	    align-items: stretch;
	    width: 65%;
	    margin-left: 330px;
	    margin-top: -150px;
	}
	
	.store-info-top .desc-container div {
	    font-style: normal;
	    font-weight: 700;
	    font-size: 20px;
	    line-height: 150%;
	    letter-spacing: -.02em;
	    color: white;
	    margin-left: 50px;
	}
	
	.store-info-top .desc-container div a {
		color: white;
	}
	
	.store-info-top .desc-container h1 {
		margin-top: 40px;
	    font-style: normal;
	    font-weight: 700;
	    font-size: 30px;
	    line-height: 125%;
	    letter-spacing: -.03em;
	    display: -webkit-box;
	    color: white;
	    margin-left: -150px;
	}
	
	.store-info-body {
		border: 1px solid red;
		margin-top: 75px;
		margin-left: 330px;
		width: 65%;
		border-top: 10px solid #FEE500;
		border-bottom: 10px solid #FEE500;
		border-left: 1px solid #FEE500;
		border-right: 1px solid #FEE500;
	}
	
	.store-info-body .store-intro {
		padding: 24px 0;
	}
	
	.store-info-body .store-intro .intro-list {
		display: block;
	    list-style-type: none;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;	
	}
	
	.store-info-body .store-intro .intro-list li {
		margin-top: 0;
		display: flex;
	    flex-direction: row;
	    justify-content: flex-start;
	    margin-bottom: 30px;
	}
	.store-info-body .store-intro .intro-list li .shop-img img,
	.store-info-body .store-intro .intro-list li .location-img img,
	.store-info-body .store-intro .intro-list li .phone-img img{
		width: 28px;
		height: 28px;
	}
	
	.store-info-body .store-intro .intro-list li p {
		display: block;
   		overflow: visible;
   		margin-left: 16px;
	    font-style: normal;
	    font-weight: 400;
	    font-size: 18px;
	    line-height: 150%;
	    letter-spacing: -.02em;
	}
	.store-info-body .store-intro .intro-list li p.info-content{
	    width:85%;
	}
	
	.store-info-body .store-intro .intro-list li p a {
		color: #2694AB
	}
	
	.store-info-photo,
	.store-info-map {
		margin-top: 25px;
		margin-left: 330px;
		width: 65%;
		border-bottom: 10px solid #FEE500;
		border-left: 1px solid #FEE500;
		border-right: 1px solid #FEE500;
		padding-bottom: 50px;
	}
	
	.store-info-photo div h2,
	.store-info-map div h2 {
		margin-left: 40px;
		padding-bottom: 40px;
	}	
	
	.carousel-inner img {
   		width: 1024px;
   	 	height: 500px;
   	 	border-radius: 10px;
  	}

  	.carousel-control-prev {
		left: 8%;  		
  	}
  	.carousel-control-next {
		right: 8%;  		
  	}
  	
  	.store-info-map .map-detail {
  		margin-left: 105px;
  	}
  	.btn_unlike {
		float:right;
	  	position: relative;
	 	margin:2px 10px;
	 	margin-right:15px;
	  	width: 50px;
	  	height: 50px;
	  	border: 1px solid #e8e8e8;
	  	border-radius: 44px;
	  	font-family: notokr-bold,sans-serif;
	  	font-size: 14px;
	  	line-height: 16px;
	  	background-color: #fff;
	  	color: #DD5D54;
	  	box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
	  	transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	  	cursor: pointer;
	}
	.btn_unlike:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
	}
	.btn_like .img_emoti {
	    background-position: -30px -120px;
	}
	.img_emoti {
	    display: inline-block;
	    overflow: hidden;
	    font-size: 0;
	    line-height: 0;
	    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
	    text-indent: -9999px;
	    vertical-align: top;
	    width: 20px;
	    height: 17px;
	    margin-top: 1px;
	    background-position: 0px -120px;
	    text-indent: 0;
	}
  	ul.storeReview>li {
  		display:inline-block;
  		margin-top:20px;
  	}
  	a.reviewCount {
  		font-size:25px;
  		font-weight:700;
  		margin-left:45px;
  	}
  	button.reviewWriteBtn {
  		margin-left:40%;
  		width:150px;
  	}
		
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>

<section class="store-info-top">
	<div id="dark-cover">배경</div>
	<div class="image-container">
		<img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg }">
	</div>
	<div class="desc-container">
		<div>
			<a href="#">${vo.dong}</a> &middot; <a href="#">${vo.skinds}<!--   뷰티/미용  --></a>
		</div>
		<h1>${vo.sname}<!--  뷰림헤어살롱 옥정점  --></h1>
	</div>
</section>
<section class="store-info-body">
	<div class="store-intro">
		<ul class="intro-list">
			<li>
				<div class="shop-img">
					<img src="http://localhost:9000/banana/images/market.svg">
					
				</div>
				<p class="info-content">${vo.sintro }
					<!-- 안녕하세요^^<br>
					옥정동 뷰림헤어입니다.<br>
					요즘 코로나 때문에 마음대로 다니시길 어려우시져?<br>
					저희샵은 공간을 최대한 분리되어있어서 좀더 쾌적하고 편안하게 시술받을 수 있는 장점이 있어요<br>
					신규고객님들은 30%할인 적용도 있으시니 방문해주셔서 예쁘게 머리하시고 기분전환하세요! -->
				</p>
				<div class="likebutton">
				<button type="button" class="btn_unlike" id="btnLike">
  							<span class="img_emoti">좋아요</span></button>
  				</div>
			</li>
			<li>
				<div class="location-img">
					<img src="http://localhost:9000/banana/images/location.svg">
				</div>
				<p class="info-location">${vo.saddr} ${vo.saddr_num}<!--  경기도 양주시 회천남로 76 --></p>
			</li>
			<li>
				<div class="phone-img">
					<img src="http://localhost:9000/banana/images/phone.svg">
				</div>
				<p class="info-phone"><a href="#">${vo.sph}<!-- 0318623555 --></a></p>
			</li>
			<li>
				<a href="updateStore.do?sid=${vo.sid }"><button type="button">업체 관리</button></a>
			</li>
		</ul>
	</div>
</section>
<section class="store-info-photo">
	<div>
		<h2>사진</h2>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
			  
			  <!-- The slideshow -->
			  <div class="carousel-inner" style="width:1024px; margin-left:8.5%;">
			    <div class="carousel-item active">
			      <img src="http://localhost:9000/banana/images/store_photo1.jpeg" >
			    </div>
			    <div class="carousel-item">
			      <img src="http://localhost:9000/banana/images/store_photo2.jpeg" >
			    </div>
			    <div class="carousel-item">
			      <img src="http://localhost:9000/banana/images/store_photo3.jpeg" >
			    </div>
			  </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
		</div>
</section>
<section class="store-info-map">
	<div>
		<ul class="storeReview">
			<li><a href="neighborStoreReview_list.do?sid=${vo.sid }" class="reviewCount">업체 후기 ${review_count }</a></li>
			<% String mid = "test1234"; %>
			<li><a href="neighborStoreReview_write.do?sid=${vo.sid }&mid=<%= mid %>"><button type="button" class="reviewWriteBtn">후기쓰기</button></a></li>
		</ul>
	</div>
</section>
<section class="store-info-map">
	<div>
		<h2>찾아가는 길</h2>
		<input type="hidden" id="addr2" value="${vo.addr2 }">
	</div>
	<div class="map-detail">
		<div id="map" style="width:90%;height:500px;"></div>
	</div>
</section>
<jsp:include page="../footer.jsp"/>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch($("#addr2").val(), function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.sname}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<!-- <script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1611215955729",
		"key" : "242ra",
		"mapWidth" : "1024",
		"mapHeight" : "400"
	}).render();
</script> -->
</body>
</html>