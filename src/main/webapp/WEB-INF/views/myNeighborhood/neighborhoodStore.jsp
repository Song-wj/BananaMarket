<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
	
	.store-info-body .store-intro .intro-list li p a {
		color: #2694AB
	}
	
	.store-info-photo {
		margin-top: 25px;
		margin-left: 330px;
		width: 65%;
		border-bottom: 10px solid #FEE500;
		border-left: 1px solid #FEE500;
		border-right: 1px solid #FEE500;
	}
	
	.store-info-photo div h2 {
		margin-left: 40px;
		padding-bottom: 40px;
	}	
	
	.carousel-inner img {
		margin-left: 280px;
   		width: 677px;
   	 	height: 500px;
   	 	border-radius: 10px;
   	 	margin-bottom: 50px;
  	}

  	.carousel-control-prev {
		left: 20%;  		
  	}
  	.carousel-control-next {
		right: 20%;  		
  	}
		
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="store-info-top">
	<div id="dark-cover">배경</div>
	<div class="image-container">
		<img src="http://localhost:9000/banana/images/store1.jpeg">
	</div>
	<div class="desc-container">
		<div>
			<a href="#">옥정동</a> &middot; <a href="#">뷰티/미용</a>
		</div>
		<h1>뷰림헤어살롱 옥정점</h1>
	</div>
</section>
<section class="store-info-body">
	<div class="store-intro">
		<ul class="intro-list">
			<li>
				<div class="shop-img">
					<img src="http://localhost:9000/banana/images/market.svg">
				</div>
				<p class="info-content">
					안녕하세요^^<br>
					옥정동 뷰림헤어입니다.<br>
					요즘 코로나 때문에 마음대로 다니시길 어려우시져?<br>
					저희샵은 공간을 최대한 분리되어있어서 좀더 쾌적하고 편안하게 시술받을 수 있는 장점이 있어요<br>
					신규고객님들은 30%할인 적용도 있으시니 방문해주셔서 예쁘게 머리하시고 기분전환하세요!
				</p>
			</li>
			<li>
				<div class="location-img">
					<img src="http://localhost:9000/banana/images/location.svg">
				</div>
				<p class="info-location">경기도 양주시 회천남로 76</p>
			</li>
			<li>
				<div class="phone-img">
					<img src="http://localhost:9000/banana/images/phone.svg">
				</div>
				<p class="info-phone"><a href="#">0318623555</a></p>
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
			  <div class="carousel-inner">
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
<jsp:include page="../footer.jsp"/>
</body>
</html>