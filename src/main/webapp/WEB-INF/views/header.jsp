<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	* {
		padding: 0;
		margin: 0;
		outline: none;	
		color: #212529;
		font-family: 'Noto Sans KR', snas-serif;
	}

	#fixed-bar {
		width: 100%;
	    background-color: #fff;
	    position: fixed;
	    top: 0;
	    left: 0;
	    right: 0;
	    z-index: 100;
	}
	
	.fixed-bar-box-shadow {
		box-sizing: border-box;
		border-bottom: 1px solid rgba(0,0,0,0.1);
	}
	
	#fixed-bar #fixed-bar-wrap {
	    width: 100%;
	    padding: 16px 0;
	    position: relative;
	}
	
	#fixed-bar #fixed-bar-wrap .fixed-logo {
		margin-bottom: 5px;	
		margin-left: 10%;
	}
	
	#header-search-input {
		position: absolute;
		top:30px;
		margin-left: 30px;
		width: 400px;
		padding: 8px 0;
		text-indent: 8px;
		font-size: 16px;
		color: #212529;
		background-color: transparent;
		border: 2px solid #FEE500;
		border-radius: 5px;
	}
	
	#header-search-button {
		all: unset;
		position: absolute;
		top: 40px;
		margin-left: 395px;
	}
	
	#fixed-bar .header-menu-list {
		position: absolute;
		top: 40px;
		left: 75rem;
		list-style-type: none;
	}
	
	#fixed-bar .header-menu-list .header-menu-item {
		display: inline-block;
		margin-right: 1.5rem;
	}
	
	#fixed-bar .header-menu-list .header-menu-item .menu-link {
		text-decoration: none;
		color: #212529;
		font-weight: bold;
		padding: 3px;
	}
	
	#fixed-bar .header-menu-list .header-menu-item .menu-link:active {
		border-radius: 7px;
		border: 1px solid #FEE500;
		background-color: #FEE500;
	}
	
</style>
</head>
<body>
	<header id="fixed-bar" class="fixed-bar-box-shadow">
		<div id="fixed-bar-wrap">
			<img class="fixed-logo" src="http://localhost:9000/banana/images/logo1.png"
			 onclick="location.href='http://localhost:9000/banana/index.do'">
			<input type="text" id="header-search-input" placeholder="동네 이름, 물품명 등을 검색해보세요!">
			<button id="header-search-button">
				<img src="http://localhost:9000/banana/images/search-icon.svg">
			</button>
			<c:choose>
				<c:when test="${ svo.nickname eq '관리자'}">
					<ul class="header-menu-list">
						<li id="name-area" class="header-menu-item"><a class="menu-link" href="#">${ svo.nickname }님</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/logout.do">로그아웃</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/memberManage.do">회원 관리</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/boardSubjectManage.do">동네생활 관리</a></li>
					</ul>
				</c:when>
				<c:when test="${ svo ne null }">
					<ul class="header-menu-list">
						<li id="name-area" class="header-menu-item"><a class="menu-link" href="#">${ svo.nickname }님</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/logout.do">로그아웃</a></li>
<<<<<<< HEAD
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/mypage.do">나의 바나나</a></li>	
=======
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/mypage.do">나의 바나나</a></li>
>>>>>>> 6ff513ff27d2bc01ee6d1d4f7d02dd3833b4276a
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/popularProduct.do">바나나 매물</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/dongneLife.do">동네생활</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/neighborhood.do">내 근처</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="header-menu-list">
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/login.do">로그인</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/join.do">회원가입</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/popularProduct.do">바나나 매물</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/dongneLife.do">동네생활</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/neighborhood.do">내 근처</a></li>
					</ul>
				</c:otherwise>
			</c:choose> 
		</div>
	</header>
</body>
</html>