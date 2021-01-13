<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바나나마켓</title>
<style>
	* {
		padding: 0;
		margin: 0;
		outline: none;	
	}
	
	#home-main-section-top {
		margin-top: 72px;
		padding-top: 24px;
		background-color: #FBF7F2;
	}
	
	#home-main-section-top #home-main-top {
		width: 1024px;
		height: 760px;
		margin: 0 auto;
		position: relative;
		background-color: #FBF7F2;
	}
	
	#home-main-section-top #home-main-top .home-main-desc {
		height: 474px;
		margin-left: -120px;
	}
	
	#home-main-section-top .home-main-title {
		font-size: 4.8rem;
   		line-height: 1.3;
	    padding-top: 20rem;
	    margin-bottom: 3.2rem;
	    letter-spacing: -0.4px;
	    font-size: 48px;
	}
	
	#home-main-section-top .home-main-txt {
		font-size: 16px;
		line-height: 1.5;
		letter-spacing: -0.3px;
	}

	#home-main-section-top .home-main-img-top {
		position: absolute;
		right: -120px;
	    bottom: 0;
	    width: 804px;
	    height: 685px;
	    background: #FBF7F2 url(http://localhost:9000/banana/images/section1.png) no-repeat;
	    background-size: 804px 685px;
	}
	
</style>
</head>
<body>
	<section id="home-main-section-top">
		<div id="home-main-top">
			<div class="home-main-desc">
				<h1 class="home-main-title">바로만나 나중에만나<br>바나나마켓</h1>
				<p class="home-main-txt">중고 거래부터 동네 정보까지, 이웃과 함께 해요.<br>가깝고 따뜻한 당신의 근처를 만들어요.</p>
			</div>
			<div class="home-main-img-top"></div>
		</div>
	</section>
</body>
</html>