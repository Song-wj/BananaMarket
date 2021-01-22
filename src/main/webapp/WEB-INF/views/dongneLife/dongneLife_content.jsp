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
		
		$("#btnLike").click(function(){
			  if($(this).hasClass('btn_like')){
				  //좋아요 취소
				  $(this).removeClass('btn_like');
			  }
			  else{
				  //좋아요 눌렀을 때
				  $(this).addClass('btn_like');
			  }
			});
	});
	
</script>
<style>
	div.dongnelife_content {
		width: 70%;
		margin:auto;
		height: 1000px;
		padding-top:150px;
		padding-bottom:3%;
		border:1px solid green;
	}
	section.section2_dongneLife_content,
	section.section3_dongneLife_content,
	section.section4_dongneLife_content,
	section.section5_dongneLife_content,
	section.section6_dongneLife_content,
	section.section7_dongneLife_content  {
		width:60%;
		margin-left:14%;
		padding-left:5%;
		margin-bottom:40px;
	}
	section.section1_dongneLife_content div.content_nav {
		border-bottom:1px solid black;
		padding:10px 0;
	}
	section.section1_dongneLife_content li {
		display:inline-block;
	}
	section.section1_dongneLife_content li:first-child {
		display:inline-block;
		margin-left:-10%;
		padding:0 25%;
		font-size:22px;
		font-weight:800;
	}
	section.section1_dongneLife_content li:nth-child(2) {
		display:inline-block;
		padding-left:20%;
	}
	section.section1_dongneLife_content li:nth-child(3) button {
		margin-left:15px;
		margin-right:10px;
	}
	section.section1_dongneLife_content li:first-child img {
		width:30px;
		height:30px;
	}
	section.section1_dongneLife_content .btn_unlike {
	  	position: relative;
	 	margin:2px 10px;
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
	section.section1_dongneLife_content .btn_unlike:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
	}
	section.section1_dongneLife_content .btn_like .img_emoti {
	    background-position: -30px -120px;
	}
	section.section1_dongneLife_content .img_emoti {
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
	section.section1_dongneLife_content  .btn_unlike .ani_heart_m {
	    margin: -63px 0 0 -63px;
	}
	section.section2_dongneLife_content div.content_top {
		padding:20px 0;
	}
	section.section2_dongneLife_content div.content_top label.content_topic {
		font-size:18px;
	}
	section.section2_dongneLife_content div.content_member {
		padding-top:30px;
	}
	section.section2_dongneLife_content img.memberImg {
		magin-bottom:100px;
		width:100px;
		heigth:100px;
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px #FEE500;
	}
	section.section2_dongneLife_content div.memberImg {
		float:left;
		display:inline-block;
		width:120px;
		height:120px;
	} 
	section.section2_dongneLife_content div.memberSide {
		float:inherit; 
		padding:10px 0;
	}
	section.section2_dongneLife_content ul.memberSide {
		display:inline-block;
		list-style:none;
	}
	section.section2_dongneLife_content ul.memberSide>li {
		margin-left:15px;
	}
	section.section2_dongneLife_content ul.memberSide>li:first-child {
		padding-top:10px;
		font-size:26px;
		font-weight:900;
	}
	section.section2_dongneLife_content ul.memberSide>li:nth-child(2) {
		margin-top:3px; 
		font-size:20px;
		color:gray;
	}
	section.section2_dongneLife_content,
	section.section3_dongneLife_content {
		padding-bottom:30px;
		border-bottom:1px solid lightgray;
	}
	section.section4_dongneLife_content {
		padding-top:0;
		margin-top:-30px;
		padding-bottom:10px;
		border-bottom:1px solid lightgray;
	}
	section.section6_dongneLife_content {
		margin-top:-50px;
		padding-top:30px;
		border-top:1px solid lightgray;
	}
	section.section3_dongneLife_content div.content_detail p {
		font-size:18px;
		font-weight:800;
	}
	section.section4_dongneLife_content div.content_response ul {
		list-style-type:none;
	}
	section.section4_dongneLife_content div.content_response ul li img {
		width:20px;
		height:20px;
	}
	section.section5_dongneLife_content div.content_comment {
		padding-bottom:50px;
	}
	section.section5_dongneLife_content img.commentMemberImg {
		magin-bottom:100px;
		width:50px;
		heigth:50px;
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px #FEE500;
	}
	section.section5_dongneLife_content div.commentMemberImg {
		float:left;
		display:inline-block;
		width:65px;
		height:110px;
	} 
	section.section5_dongneLife_content div.commentMemberSide {
		margin-top:-10px;
	}
	section.section5_dongneLife_content ul.commentMemberSide {
		display:inline-block;
		list-style:none;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li {
		margin-left:15px;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:first-child {
		font-size:16px;
		font-weight:900;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(2) {
		margin-top:3px; 
		font-size:15px;
		color:gray;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(3) {
		margin-top:8px; 
		font-size:17px;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(4) {
		margin-top:5px; 
		font-size:17px;
	}
	section.section4_dongneLife_content div.content_response ul li button,
	section.section5_dongneLife_content div.commentMemberSide ul li button {
		all:unset;
		margin-right:10px;
		position: relative;
        top: -4px;
	}
	section.section5_dongneLife_content div.commentMemberSide ul li button {
		margin-top:9px;
		font-size:15px;
	}
	section.section4_dongneLife_content div.content_response ul li button:hover,
	section.section5_dongneLife_content div.commentMemberSide ul li button:hover {
		all:unset;
		margin-right:10px;
		position: relative;
        top: -4px;
		color: #FEE500;
		text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
	}
	section.section6_dongneLife_content div.content_comment_write input {
		width:75%;
		height:30px;
		font-size:18px;
		padding:5px 5px;
		margin:0 10px;
	}
	section.section6_dongneLife_content div.content_comment_write img {
		width:23px;
		height:23px;
		margin-bottom:-7px;
	}
	section.section6_dongneLife_content button.comment_writeBtn,
	section.section1_dongneLife_content li:nth-child(3) button,
	section.section1_dongneLife_content li:nth-child(4) button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:7px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section6_dongneLife_content button.comment_writeBtn:hover,
	section.section1_dongneLife_content li:nth-child(3) button:hover,
	section.section1_dongneLife_content li:nth-child(4) button:hover {
		cursor:pointer;
		opacity:0.7;
	}
	
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_content">
		<section class="section1_dongneLife_content">
			<div class="content_nav">
				<ul>
					<li><a href="dongneLife.do"><img src="images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li>
						<button type="button" class="btn_unlike" id="btnLike">
  						<span class="img_emoti">좋아요</span></button>
  					</li>
					<li><a href="dongneLife_update.do"><button class="comment_writeBtn">수정</button></a>
					<li><a href="dongneLife_delete.do"><button class="comment_writeBtn">삭제</button></a>
				</ul>
			</div>
		</section>
		<section class="section2_dongneLife_content">
			<div class="content_top">
				<a href="#"><label class="content_topic">우리동네질문 ></label></a>
				<div class="content_member">
					<div class="memberImg">
						<img src="images/mypage_bananaimg.jpg" class="memberImg">
					</div>
					<div class="memberSide">
						<ul class="memberSide">
							<li>닉네임</li>
							<li>반포1동 인증 1회  / 1시간 전</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section class="section3_dongneLife_content">
			<div class="content_detail">
				<p>~~ 내용 ~~~<br>
				와아ㅏㅏㅏㅏ아
				호
				<br><br>
				</p>
			</div>
		</section>
		<section class="section4_dongneLife_content">
			<div class="content_response">
				<ul>
					<li>
						<a href="#"><img src="images/smile.png"><button type="button">공감하기</button></a>
						<a href="#"><img src="images/messenger.png"><button type="button">댓글 2</button></a>
					</li>
				</ul>
			</div>
		</section>
		<section class="section5_dongneLife_content">
			<div class="content_comment">
				<div class="commentMemberImg">
					<img src="images/mypage_bananaimg.jpg" class="commentMemberImg">
				</div>
				<div class="commentMemberSide">
					<ul class="commentMemberSide">
						<li>닉네임</li>
						<li>반포동  / 29분 전</li>
						<li>있어요</li>
						<li>
							<a href="#"><button type="button">공감하기</button></a>
							<a href="#"><button type="button">답글쓰기</button></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="content_comment">
				<div class="commentMemberImg">
					<img src="images/mypage_bananaimg.jpg" class="commentMemberImg">
				</div>
				<div class="commentMemberSide">
					<ul class="commentMemberSide">
						<li>닉네임</li>
						<li>서초동  / 1시간 전</li>
						<li>몰라요</li>
						<li>
							<a href="#"><button type="button">공감하기</button></a>
							<a href="#"><button type="button">답글쓰기</button></a>
						</li>
					</ul>
				</div>
			</div>
		</section>
		<section class="section6_dongneLife_content">
			<div class="content_comment_write">
				<a href="#"><img src="images/dongneLife_locate.png"><button type="button"></button></a>
				<a href="#"><img src="images/dongneLife_inputimg.png"><button type="button"></button></a>
				<input type="text" placeholder="따뜻한 댓글을 입력해주세요 :)">
				<a href="#"><button class="comment_writeBtn">등록</button></a>
			</div>
		</section>
		<section class="section7_dongneLife_content">
			
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>