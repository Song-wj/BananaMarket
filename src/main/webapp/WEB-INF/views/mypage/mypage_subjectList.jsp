<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<c:forEach var="vo" items="${ list }">
					<c:if test="${ vo.bstopic eq '동네 기본주제' }">
						<article class="subject-card-top">

							<a class="subject-card-link" href="http://localhost:9000/banana/mypage_subjectContent.do?bsid=${ vo.bsid }&bstitle=${ vo.bstitle }">

								<div class="subject-card-photo">
									<img src="http://localhost:9000/banana/resources/upload/${ vo.bssfile }">
								</div>
								<div class="subject-card-title">${ vo.bstitle }</div>
							</a>
						</article>
					</c:if>
				</c:forEach>
			</div>
		</section>
		<section class="interest-subject">
			<h2>관심주제</h2>
			<div class="subject-card-wrap">
				<c:forEach var="vo" items="${ list }">
					<c:if test="${ vo.bstopic eq '관심주제' }">
						<article class="subject-card-top">

							<a class="subject-card-link" href="http://localhost:9000/banana/mypage_subjectContent.do?bstitle=${ vo.bstitle }">

								<div class="subject-card-photo">
									<img src="http://localhost:9000/banana/resources/upload/${ vo.bssfile }">
								</div>
								<div class="subject-card-title">${ vo.bstitle }</div>
							</a>
						</article>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>