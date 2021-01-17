<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){

	});
</script>
<style>
	.mypage_subjectList {
		text-align: center;
	}
	
	.subjectList_title_area .subjectList_title {
		text-align: left;
		margin-top: 50px;
		margin-left: 50px;
		font-size: 2rem;
		font-weight: bold;
		padding-bottom: 40px;
		border-bottom: 2px solid #ccc;
		width: 90%;
	}
	
	.basic-subject {
		width: 90%;
		margin-left: 50px;
	}
	
	.interest-subject {
		width: 90%;
		margin-left: 50px;
	}
	
	.basic-subject h2,
	.interest-subject h2  {
		text-align: left;
	}
	
	.subject-card-wrap {
		display: flex;
		/* justify-content: space-around; */
		align-items: stretch;
		flex-wrap: wrap;
		width: 100%;
		margin-top: 50px;
	}
	
	.subject-card-wrap .subject-card-top {
		width: 40%;	    
		margin-bottom: 50px;
		margin-left: 50px;
	}
	
	.subject-card-wrap .subject-card-link {
		text-decoration: none;
		color: #212529;
	}
	
	.subject-card-wrap .subject-card-top .subject-card-photo {
		width: 100%;
	    padding-top: 50%;
	    position: relative;
	    overflow: hidden;
	    border-radius: 12px;
	    background-color: #F8F9FA;
	    box-shadow: inset 0px 0px 0px 1px rgba(0, 0, 0, 0.15);
	    box-sizing: border-box;
	}
	.subject-card-wrap .subject-card-top .subject-card-photo img{
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    height: 225px;
	    box-sizing: border-box;
	    border-radius: 12px;
	    border: 1px solid transparent;
	    z-index: 1;
	}
	
	.subject-card-wrap .subject-card-top .subject-card-title {
		position: relative;
		margin-top: -190px;
		padding-top: 115px;
		padding-bottom: 30px;
		text-align: left;
		text-indent: 20px;		
		font-size: 30px;
		font-weight: bold;
		color: white;
		z-index: 700;
		background-color: black;
		opacity: 0.4;
		border: 1px solid transparent;
		border-radius: 12px;
	}
</style>
</head>
<body>
	<div class="mypage_subjectList">
		<section class="subjectList_title_area">
			<div class="subjectList_title">동네생활 주제목록</div>
		</section>
		<section class="basic-subject">
			<h2>동네 기본주제</h2>
			<div class="subject-card-wrap">
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/동네사건사고.jpg">
						</div>
						<div class="subject-card-title">동네사건사고</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/분실실종센터.jpg">
						</div>
						<div class="subject-card-title">분실/실종센터</div>
					</a>
				</article>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/우리동네질문.jpg">
						</div>
						<div class="subject-card-title">우리동네질문</div>
					</a>
				</article>
			</div>
		</section>
		<section class="interest-subject">
			<h2>관심주제</h2>
			<div class="subject-card-wrap">
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/강아지.jpg">
						</div>
						<div class="subject-card-title">강아지</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/건강.jpg">
						</div>
						<div class="subject-card-title">건강</div>
					</a>
				</article>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/겨울간식대전.jpg">
						</div>
						<div class="subject-card-title">겨울간식대전</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/고양이.jpg">
						</div>
						<div class="subject-card-title">고양이</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/기타.jpg">
						</div>
						<div class="subject-card-title">기타</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/동네맛집.jpg">
						</div>
						<div class="subject-card-title">동네맛집</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/동네소식.jpg">
						</div>
						<div class="subject-card-title">동네소식</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/동네카페.jpg">
						</div>
						<div class="subject-card-title">동네카페</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/살림청소정리.jpg">
						</div>
						<div class="subject-card-title">살림/청소/정리</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/식물.jpg">
						</div>
						<div class="subject-card-title">식물</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/아이교육학원.jpg">
						</div>
						<div class="subject-card-title">아이교육/학원</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/우리동네사진전.jpg">
						</div>
						<div class="subject-card-title">우리동네사진전</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/일상.jpg">
						</div>
						<div class="subject-card-title">일상</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/임신출산육아.jpg">
						</div>
						<div class="subject-card-title">임신/출산/육아</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#"> 
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/집꾸미기.jpg">
						</div>
						<div class="subject-card-title">집꾸미기</div>
					</a>
				</article>
				<article class="subject-card-top">
					<a class="subject-card-link" href="#">
						<div class="subject-card-photo">
							<img src="http://localhost:9000/banana/images/취미자기계발.jpg">
						</div>
						<div class="subject-card-title">취미/자기계발</div>
					</a>
				</article>
			</div>
		</section>
	</div>
</body>
</html>