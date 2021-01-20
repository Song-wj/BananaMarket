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
	#content {
		text-align: center;
		margin-top: 130px;
		padding-bottom: 0;
	}

  	.carousel-inner img {
   		width: 677px;
   	 	height: 500px;
   	 	border-radius: 10px;
  	}

  	.carousel-control-prev {
		left: 27%;  		
  	}
  	.carousel-control-next {
		right: 27%;  		
  	}
  	
  	#article-profile #article-profile-link {
	    text-decoration: none;
	    display: block;
	    margin-top: 25px;
	    padding-bottom: 23px;
	    position: relative;
	}
  	
  	#article-profile .space-between {
  		display: flex;
    	align-items: flex-start;
    	justify-content: flex-start;
    	margin: 0;
    	padding: 0;
	}

	#article-profile #article-profile-image {
    	display: inline-block;
    	margin-left: 37.5rem;
	}
	#article-profile #article-profile-image img{
		width: 60px;
		height: 60px;
		object-fit: cover;
		border-radius: 50%;
		border: 2px solid #FEE500;
	}
	
	#article-profile #article-profile-left {
    	display: inline-block;
    	margin-left: 8px;
	}
	
	#article-profile #article-profile-left #nickname {
	    font-size: 20px;
	    font-weight: 600;
	    line-height: 1.5;
	    letter-spacing: -0.6px;
	    color: #212529;
	    text-align: left;
	}
	
	#article-profile #article-profile-left #region-name {
	    font-size: 18px;
	    line-height: 1.46;
	    letter-spacing: -0.6px;
	    color: #212529;
	}
	
	#article-profile #article-profile-right {
	    position: absolute;
	    right: 38rem;
	    padding-right: 36px;
	}
	
	#article-profile #article-profile-right dl {
    	display: block;
 	   width: 100px;
	}
	
	#article-profile #article-profile-right dl dt {
	    position: absolute;
	    top: 36px;
	    right: 0px;
	    font-size: 18px;
	    line-height: 1;
	    letter-spacing: -0.6px;
	    color: #868e96;
	}
	
	#article-profile #article-profile-right .text-color-03 {
    	color: #1561a9;
	}
	
	#article-profile #article-profile-right dl dd {
	    position: absolute;
	    font-size: 16px;
	    font-weight: bold;
	    line-height: 1;
	    letter-spacing: -0.5px;
	    margin-top: 1px;
	    width: 100px;
	    text-align: right;
	}
	
	#article-profile #article-profile-right .meters {
	    clear: both;
	    display: block;
	    width: 100px;
	    background-color: #e9ecef;
	    height: 4px;
	    border-radius: 100px;
	    -webkit-border-radius: 100px;
	    -moz-border-radius: 100px;
	    position: relative;
	    vertical-align: middle;
	    margin-top: 24px;
	}	
	
	#article-profile #article-profile-right .meters .bar-color-03 {
    	background-color: #1561a9;
	}
	
	#article-profile #article-profile-right .meters .bar {
	    position: absolute;
	    top: 0;
	    left: 0;
	    bottom: 0;
	    height: 4px;
	    -webkit-border-radius: 100px;
	}
	
	#article-profile #article-profile-right .face {
	    position: absolute;
	    right: 0;
	    top: 0;
	}
	
	.face-01, .face-02, .face-03, .face-04, .face-05, .face-06 {
	    display: inline-block;
	    overflow: hidden;
	    text-indent: -9999px;
	    text-align: left;
	    background: url(http://localhost:9000/banana/images/temperature_face.png) no-repeat;
	    background-size: 29px 147px;
	}
	
	/*
		.face-01 : -0px -27px;
		.face-02 : -0px -51px;
		.face-03 : -0px -75px;
		.face-04 : -0px -99px;
		.face-05 : -0px -123px;
		.face-06 : -0px -0px;
	*/
	.face-03 {
		background-position: -0px -75px;
	    width: 24px;
	    height: 24px;
	}
	
	#article-description {
		border-top: 1px solid #e9ecef;
	    padding: 32px 0;
	    width: 677px;
	    margin: 0 auto;
	    border-bottom: 1px solid #e9ecef;
	    text-align: left;
	}
	
	#article-description #article-title {
	    font-size: 22px;
	    font-weight: 600;
	    line-height: 1.5;
	    letter-spacing: -0.6px;
	}
	
	#article-description #article-category {
	    margin-top: 4px;
	    font-size: 15px;
	    line-height: 1.46;
	    letter-spacing: -0.6px;
	    color: #868e96;
	}
	
	#article-description #article-price {
	    margin-top: 4px;
	    line-height: 1.76;
	    letter-spacing: -0.6px;
	}
	
	#article-description #article-detail {
	    margin-bottom: 16px;
	    margin-top: 8px;
	}
	
	#article-description #article-detail p {
	    font-size: 20px;
	    line-height: 1.6;
	    letter-spacing: -0.6px;
	    margin: 16px 0;
	    word-break: break-all;
	}
	
	#article-description #article-counts {
	    font-size: 17px;
	    line-height: 1.46;
	    letter-spacing: -0.6px;
	    color: #868e96;
	}
	
	#article-detail-hot-more, #article-detail-related, #search-articles {
	    width: 677px;
	    margin: 0 auto;
	    padding-top: 32px;
	    position: relative;
	}
	
	#article-detail-hot-more h3 {
	    font-size: 25px;
	    text-align: left;
	    line-height: 1.47;
	    letter-spacing: -0.6px;
	    font-weight: 600;
	    padding-bottom: 0px;
	    margin-bottom: 30px;		
	}
	
	#article-detail-hot-more #hot-more-link {
		position: absolute;
	    top: 32px;
	    right: 0;
	    text-align: right;
	}
	
	#article-detail-hot-more #hot-more-link a {
		font-size: 20px;
	    line-height: 1.4;
	    letter-spacing: -0.6px;
	    text-decoration: none;
	    color: #FEE500;
	    background-color: #666;
	    padding: 3px 15px;
	    border-radius: 10px;
	}
	
	#article-detail-hot-more #hot-more-link a:active {
		opacity: 0.6;
	}
	
	.cards-wrap {
	    display: flex;
	    justify-content: space-around;
	    flex-wrap: wrap;
	    width: 100%;
	    margin: 0 auto;
	}
	
	.cards-wrap .card {
	    border:1px solid white;
	    width: calc(33% - 16px);
	    margin-right: 16px;
	    margin-bottom: 56px;
	}
	
	.cards-wrap .card-link {
   		color: #212529;
   		text-decoration: none;
	}	
	
	.cards-wrap .card .card-photo {
	    width: 100%;
	    padding-top: 100%;
	    position: relative;
	    overflow: hidden;
	    border-radius: 12px;
	    background-color: #F8F9FA;
	    box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.15);
	    box-sizing: border-box;
	}
	
	.cards-wrap .card .card-photo img {
		position: absolute;
	    top: 0;
	    bottom: 0;
	    width: 100%;
	    box-sizing: border-box;
	    border-radius: 12px;
	    border: 1px solid transparent;
	}
	
	.cards-wrap .card .card-desc {
    	margin-top: 12px;
	}
	
	.cards-wrap .card .card-desc .card-title {
	    font-size: 16px;
	    letter-spacing: -0.02px;
	    color: #212529;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    margin-bottom: 4px;
	    line-height: 1.5;
	    font-weight: normal;
	}
	
	.cards-wrap .card .card-desc .card-price {
		font-size: 15px;
	    font-weight: 700;
	    line-height: 1.5;
	    margin-bottom: 4px;
	}
	
	.cards-wrap .card .card-desc .card-region-name {
		font-size: 13px;
	    color: #212529;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    margin-bottom: 4px;
	    line-height: 1.5;
	}
	
	.cards-wrap .card .card-desc .card-counts {
    	color: #868e96;
    	font-size: 13px;
	}
	
	
</style>
</head>
<body>
<jsp:include page="../header.jsp" />

<article id="content">
	<section id="product-images">
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
			      <img src="http://localhost:9000/banana/images/card-photo1.jpg" >
			    </div>
			    <div class="carousel-item">
			      <img src="http://localhost:9000/banana/images/card-photo2.jpg" >
			    </div>
			    <div class="carousel-item">
			      <img src="http://localhost:9000/banana/images/card-photo3.jpg" >
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
	<section id="article-profile">
		<a id="article-profile-link" href="#">
			<div class="space-between">
				<div>
					<div id="article-profile-image"><img src="http://localhost:9000/banana/images/mypage_bananaimg.jpg"></div>
				</div>
				<div id="article-profile-left">
					<div id="nickname">바나나</div>
					<div id="region-name">동작구 흑석동</div>
				</div>
				<div id="article-profile-right">
					<dl id="temperature-wrap">
						<dt>매너온도</dt>
						<dd class="text-color-03">36.5℃</dd>
					</dl>
					<div class="meters">
						<div class="bar bar-color-03" style="width: 37%"></div>
					</div>
					<div class="face face-03"></div>
				</div>
			</div>
		</a>
	</section>
	<section id="article-description">
		<h1 id="article-title" style="margin-top:0px;">손연재 자세 교정 커블체어</h1>
		<p id="article-category">기타 중고물품&middot;<time>5시간 전</time></p>
		<p id="article-price" style="font-size:20px; font-weight: bold;">15,000원</p>
		<div id="article-detail">
			<p>상태도 좋고 깨끗합니다</p>
		</div>
		<p id="article-counts">
			채팅 45 &middot; 관심 19 &middot; 조회 309
		</p>
	</section>
</article>
<section id="article-detail-hot-more">
	<h3>당근마켓 인기중고</h3>
	<div id="hot-more-link"><a href="#">더 구경하기</a></div>
	<section class="cards-wrap">
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link" href="#">
				<div class="card-photo">
					<img src="">
				</div>
				<div class="card-desc">
					<h2 class="card-title">추피와두두</h2>
					<div class="card-price">50,000원</div>
					<div class="card-region-name">서울 용산구 한남동</div>
					<div class="card-counts"><span>관심 8</span>&middot;<span>채팅 15</span></div>
				</div>
			</a>
		</article>
	</section>
</section>

<jsp:include page="../footer.jsp" />
</body>
</html>