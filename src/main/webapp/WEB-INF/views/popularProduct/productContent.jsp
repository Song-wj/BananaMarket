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
					  url:"product_unlike.do?mid=${svo.mid}&pid=${vo.pid }", //mid는 로그인한사람id
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
						url:"product_like.do?mid=${svo.mid}&pid=${vo.pid }", //mid는 로그인한사람id
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
	#content {
		text-align: center;
		margin-top: 160px;
		padding-bottom: 0;
	}
	
  	.carousel-inner img {
   		width: 677px;
   	 	height: 500px;
   	 	border-radius: 10px;
  	}
  	
  	.carousel-caption {
		width: 70%;
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
	    padding: 12px 0 32px 0;
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
	
	button.product_btn_style {
	position: relative;
	color: RGB(82, 67, 21);
	background-color: RGB(254, 229, 0);
	font-weight: bold;
	border: 1px solid RGB(254, 229, 0);
	padding: 12px 15px;
	font-size: 17px;
	border-radius: 5px;
	margin-left:500px;
	}

	button.product_btn_style:hover {
		opacity: 0.7;
	}
	
	div.product_btn{
		text-align:center;
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
	
</style>
</head>
<script>
$(document).ready(function(){
	lightbox.option({
	    resizeDuration: 200,
	    wrapAround: true,
	    disableScrolling: false,
	    fitImagesInViewport:false
	});
	
});	
</script>
<body>
<jsp:include page="../header.jsp" />

<div id="content">
		<div id="demo" class="carousel slide" data-ride="carousel">
			 <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			  </ul>
			 
			 <!-- The slideshow -->
			  <div class="carousel-inner" style="width:677px; margin-left:32%;">
			    <div class="carousel-item active">
			      <c:forEach var="list" items="${pfile_list}" >
			      	<div>
						<img src="http://localhost:9000/banana/resources/upload/${list}">
				    </div>
				    <div class="carousel-item">
				    	<img src="http://localhost:9000/banana/resources/upload/${list}">
				    </div>
				    <div class="carousel-item">
				      <a href="http://localhost:9000/banana/resources/upload/${st.current}"  data-lightbox="example-set"><img src="http://localhost:9000/banana/resources/upload/${list}" ></a> 
				    </div>
				   </c:forEach> 
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
		<div id="article-profile">
			<a id="article-profile-link" href="#">
				<div class="space-between">
					<div>
						<div id="article-profile-image"><img src="http://localhost:9000/banana/resources/upload/${ vo.msfile }"></div>
					</div>
					<div id="article-profile-left">
						<div id="nickname">${vo.nickname }</div>
						<div id="region-name">${vo.maddr }</div>
					</div>
					<div id="article-profile-right">
						<dl id="temperature-wrap">
							<dt>매너온도</dt>
							<dd class="text-color-03">${vo.score}.5</dd>
						</dl>
						<div class="meters">
							<div class="bar bar-color-03" style="width: 37%"></div>
						</div>
						<div class="face face-03"></div>
					</div>
				</div>
			</a>
		</div>
		<div class="description">
			<section id="article-description">
				<div class="product_btn">
					<%-- <c:choose>
						<c:when test="${mid ne null }">
							<a href="pickProc.di?mid=${mid }&pid=${pid}"><button type="button" class="product_btn_style" id="like">찜</button></a>
						</c:when>
						<c:otherwise>
							<button type="button" class="product_btn_style" id="like">찜</button>
						</c:otherwise>
					</c:choose> --%>
					<!-- <button type="button" class="product_btn_style" id="like">찜하기</button>  -->
					<button type="button" class="btn_unlike" id="btnLike">
  						<span class="img_emoti">좋아요</span>
  					</button> 
  					
  					<c:if test="${svo.mid ne vo.mid }">
						<a href="chat_write.do?pid=${vo.pid}&mid=${vo.mid}"><button type="button" class="product_btn_style">채팅 하기</button></a>
					</c:if>
					
				</div>
				<h1 id="article-title" style="margin-top:0px;">${vo.ptitle}</h1>
				<p id="article-category">${vo.pcategory}&middot;<time>${vo.pdate}</time></p>
				<p id="article-price" style="font-size:20px; font-weight: bold;">${vo.pprice} 원</p>
				<div id="article-detail">
					<p>${vo.pcontent}</p>
				</div>
				<p id="article-counts">
					<%-- 채팅 ${vo.pchat} &middot;  --%>관심 ${vo.plike} &middot; 조회 ${vo.phits }
				</p>
			</section> 	
		</div>

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
		<!--  <article class="card">
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
		</article> -->
	</section>
</section>

</div>
<jsp:include page="../footer.jsp" />
</body>
</html>