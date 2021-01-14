<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바나나마켓</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	* {
		padding: 0;
		margin: 0;
		outline: none;	
		color: #212529;
		font-family: 'Noto Sans KR', snas-serif;
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
   		line-height: 1.3;
	    padding-top: 20rem;
	    margin-bottom: 3.2rem;
	    letter-spacing: -0.4px;
	    font-size: 42px;
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
	
	.home-main-section {
		padding: 6rem 0;
		display: block;
	}
	
	.home-main-section .home-main-content {
		width: 1024px;
	    margin: 0 auto;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	}
		
	.home-main-section .home-main-img1 {
		background-image: url(http://localhost:9000/banana/images/section2.png);
		background-size: 532px 684px;
		width: 532px;
		height: 684px;
		display: inline-block;
	}
	
	.home-main-section .home-main-title {
		font-size: 42px;
	    line-height: 1.35;
	    margin-bottom: 2.4rem;
	}
		
	.home-main-section .home-main-txt {
		font-size: 18px;
		line-height: 1.5;
		letter-spacing: -0.3px;
	}	
	
	.home-main-section .home-buttons {
		margin-top: 3.2rem;
	}
	
	.home-main-section .home-buttons .home-button1,
	.home-main-section .home-buttons .home-button2,
	.home-main-section .home-buttons .home-button3 {
		background-color: #F1F3F5;
	    color: #212529;
	    border: none;
	    border-radius: 6px;
	    text-decoration: none;
	    padding: 14.5px 25px;
	    display: inline-block;
	    font-size: 18px;
	    line-height: 1.47;
	    letter-spacing: -0.3px;
	    font-weight: bold;
	}
	
	.home-main-section .home-buttons .home-button1:hover,
	.home-main-section .home-buttons .home-button2:hover,
	.home-main-section .home-buttons .home-button3:hover {
		opacity: 0.6;
	}
	.home-main-section .home-buttons .home-button2 {
		margin-left: 15px;
	}
	
	.background-pale-green {
		background-color: #E6F3E6;
	}
	
	.background-gray {
		background-color: #F8F9FA;
	}
	
	.home-main-section .home-main-img2 {
		background-image: url(http://localhost:9000/banana/images/section3.png);
	    background-size: 515px 740px;
	    width: 546px;
	    height: 740px;
	    display: inline-block;
	}
	.home-main-section .home-main-img3 {
		background-image: url(http://localhost:9000/banana/images/section4.png);
	    background-size: 515px 740px;
	    width: 546px;
	    height: 740px;
	    display: inline-block;
	}
	
	.home-main-section .home-story-list {
		margin-top: 4rem;
		display: flex;
		justify-content: space-between;
		list-style-type: none;
	}
	
	.home-main-section .home-story-list .home-story-list-item {
		margin-right: 4.2rem;
		display: list-item;
	}
	
	.home-main-section .home-story-list .icon-story1 {
		background-image: url(http://localhost:9000/banana/images/section3_icon1.svg);
		width: 56px;
		height: 56px;
		background-size: 56px 56px;
	}
	.home-main-section .home-story-list .icon-story2 {
		background-image: url(http://localhost:9000/banana/images/section3_icon2.svg);
		width: 56px;
		height: 56px;
		background-size: 56px 56px;
	}
	.home-main-section .home-story-list .icon-story3 {
		background-image: url(http://localhost:9000/banana/images/section3_icon3.svg);
		width: 56px;
		height: 56px;
		background-size: 56px 56px;
	}
	
	.home-main-section .home-story-list .home-story-title {
		font-size: 16px;
		color: black;
		font-weight: bold;
		margin-bottom: 0.8rem;
		margin-top: 1.6rem;
	}
	
	.home-main-section .home-story-list .home-story-txt {
		font-size: 14px;
		line-height: 1.5;
	}
	
	.home-main-section .home-hot-content {
		width: 1024px;
		margin: 6rem auto 12rem auto;
	}
	
	.cards-wrap {
		display: flex;
	    justify-content: space-around;
	    flex-wrap: wrap;
	    width: 100%;
	    margin: 0 auto;
	}
	
	.cards-wrap .card-top {
		width: calc(25% - 44px);
	    margin-right: 44px;
	    margin-bottom: 56px;
	}
	
	.cards-wrap .card-link {
		text-decoration: none;
	    color: #212529;
	}
	
	.cards-wrap .card-top .card-photo {
		width: 100%;
	    padding-top: 100%;
	    position: relative;
	    overflow: hidden;
	    border-radius: 12px;
	    background-color: #F8F9FA;
	    box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.15);
	    box-sizing: border-box;
	}
	.cards-wrap .card-top .card-photo img{
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    width: 100%;
	    box-sizing: border-box;
	    border-radius: 12px;
	    border: 1px solid transparent;
	}
	
	.cards-wrap .card-top .card-desc {
		margi-top: 12px;
	}
	
	.cards-wrap .card-top .card-desc .card-title {
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
	
	.cards-wrap .card-top .card-desc .card-price {
	    font-size: 15px;
	    font-weight: 700;
	    line-height: 1.5;
	    margin-bottom: 4px;
	}
	
	.cards-wrap .card-top .card-desc .card-region-name {
		font-size: 13px;
	    color: #212529;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    margin-bottom: 4px;
	    line-height: 1.5;
	}
	
	.cards-wrap .card-top .card-desc .card-counts {
		color: #868e96;
    	font-size: 13px;
	}
	
	.home-keywords-content {
		width: 1024px;
    	margin: 4rem auto;
    	background-color: white;
	}
	
	.home-keywords-content .top-keywords-list {
		display: inline-block;
    	list-style-type: none;
    	vertical-align: middle;
    	margin-left: 4rem;
	}

	.home-keywords-content .top-keywords-list .keyword-item {
	    display: inline-block;
	    vertical-align: middle;
	    margin-right: 3.2rem;
    	margin: 1.6rem;
	}
	
	.home-keywords-content .top-keywords-list .keyword-link {
	    font-size: 15px;
    	line-height: 1.5;
    	letter-spacing: -0.3px;
		text-decoration: none;
   		color: #212529;
	}
	
	.home-keywords-content .top-keywords-list .keyword-link:active {
		text-decoration: underline;
	}
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
	<section class="home-main-section">
		<div class="home-main-content">
			<div class="home-main-img1"></div>
			<div>
				<h1 class="home-main-title">우리 동네<br>중고 직거래 마켓</h1>
				<p class="home-main-txt">동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
				<div class="home-buttons">
					<a class="home-button1" href="#">인기매물 보기</a>
					<a class="home-button2" href="#">믿을 수 있는 중고거래</a>
				</div>
			</div>
		</div>
	</section>
	<section class="home-main-section background-pale-green">
		<div class="home-main-content">
			<div>
				<h1 class="home-main-title">이웃과 함께 하는<br>동네 생활</h1>
				<p class="home-main-txt">우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
				<ul class="home-story-list">
					<li class="home-story-list-item">
						<div class="icon-story1"></div>
						<div class="home-story-title">우리동네질문</div>
						<div class="home-story-txt">궁금한게 있을 땐<br>이웃에게 물어보세요.</div>
					</li>
					<li class="home-story-list-item">
						<div class="icon-story2"></div>
						<div class="home-story-title">동네분실센터</div>
						<div class="home-story-txt">무언가를 잃어버렸을 때,<br>함께 찾을 수 있어요.</div>
					</li>
					<li class="home-story-list-item">
						<div class="icon-story3"></div>
						<div class="home-story-title">동네모임</div>
						<div class="home-story-txt">관심사가 비슷한 이웃과<br>온오프라인으로 만나요.</div>
					</li>
				</ul>
			</div>
			<div class="home-main-img2"></div>
		</div>
	</section>
	<section class="home-main-section">
		<div class="home-main-content">
			<div class="home-main-img3"></div>
			<div>
				<h1 class="home-main-title">내 근처에서 찾는<br>우리 동네 가게</h1>
				<p class="home-main-txt">우리 동네 가게를 찾고 있나요?<br>동네 주민이 남긴 진짜 후기를 함께 확인해보세요!</p>
				<div class="home-buttons">
					<a class="home-button3" href="#">당근마켓 동네가게 찾기</a>
				</div>
			</div>
		</div>
	</section>
	<section class="home-main-section background-gray">
		<div class="home-hot-content">
			<h1 class="home-main-title" style="text-align: center;">중고거래 인기매물</h1>
				<div class="cards-wrap">
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo1.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">파르세코난로</h2>
								<div class="card-price">무료나눔</div>
								<div class="card-region-name">울산 중국 성안동</div>
								<div class="card-counts"><span>관심 5</span> &#183; <span>채팅 18</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo2.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">실내자전거 팝니다</h2>
								<div class="card-price">10,000원</div>
								<div class="card-region-name">서울 강북구 번1동</div>
								<div class="card-counts"><span>관심 2</span> &#183; <span>채팅 16</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo3.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">커블 쳉어 와이더 블랙</h2>
								<div class="card-price">30,000원</div>
								<div class="card-region-name">울산 남구 달동</div>
								<div class="card-counts"><span>관심 8</span> &#183; <span>채팅 14</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo4.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">빌레로이앤보흐 소접시 3p</h2>
								<div class="card-price">36,000원</div>
								<div class="card-region-name">경기도 용인시 수지구 죽전1동</div>
								<div class="card-counts"><span>관심 5</span> &#183; <span>채팅 24</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo5.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">커블체어 와이더</h2>
								<div class="card-price">50,000원</div>
								<div class="card-region-name">대구 북구 대현동</div>
								<div class="card-counts"><span>관심 4</span> &#183; <span>채팅 29</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo6.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">핏분 fitboon 무게 조절 덤벨</h2>
								<div class="card-price">100,000원</div>
								<div class="card-region-name">서울 관악구 신림동</div>
								<div class="card-counts"><span>관심 9</span> &#183; <span>채팅 2</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo7.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">커블체어 와이더 의자</h2>
								<div class="card-price">30,000원</div>
								<div class="card-region-name">경기도 성남시 중원구 도촌동</div>
								<div class="card-counts"><span>관심 5</span> &#183; <span>채팅 4</span></div>
							</div>
						</a>
					</article>
					<article class="card-top">
						<a class="card-link" href="#">
							<div class="card-photo">
								<img src="http://localhost:9000/banana/images/card-photo8.jpg">
							</div>
							<div class="card-desc">
								<h2 class="card-title">내친구 과학공룡</h2>
								<div class="card-price">100,000원</div>
								<div class="card-region-name">부산 남구 대연제5동</div>
								<div class="card-counts"><span>관심 1</span> &#183; <span>채팅 28</span></div>
							</div>
						</a>
					</article>
					<div>
						<a href="#" style="text-align: center; font-size: 16px; font-weight: bold;">인기매물 더 보기</a>
					</div>
				</div>
		</div>
	</section>
	<section class="home-keywords-content">
		<h3><a href="#" style="text-align: left; font-size: 16px; font-weight: bold;">중고거래 인기검색어</a></h3>
			<ul class="top-keywords-list">
				<li class="keyword-item"><a class="keyword-link" href="#">노트북</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">컴퓨터</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">의자</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">아이패드</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">자전거</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">모니터</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">에어팟</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">아이폰</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">책상</a></li>
				<li class="keyword-item"><a class="keyword-link" href="#">냉장고</a></li>
			</ul>
	</section>
</body>
</html>