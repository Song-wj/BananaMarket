<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

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
					  url:"dongnelife_unlike.do?mid=whtjdrnr010&bid=${vo.bid }", //mid는 로그인한사람id
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
						url:"dongnelife_like.do?mid=whtjdrnr010&bid=${vo.bid }", //mid는 로그인한사람id
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
	div.dongnelife_content {
		width: 70%;
		margin:auto;
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
	section.section3_dongneLife_content div.content_detail  {
		font-size:18px;
		font-weight:500;
	}
	section.section3_dongneLife_content img{
		width:150px;
		height:150px;
		object-fit: contain;
		margin-top:100px;
		margin-right:20px;
	}
	section.section4_dongneLife_content div.content_response ul {
		list-style-type:none;
	}
	section.section4_dongneLife_content div.content_response ul li img {
		width:20px;
		height:20px;
	}
	section.section5_dongneLife_content div.content_comment {
		margin-bottom:10px;
		margin-top:-20px;
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
		padding-bottom:30px;
	}
	section.section5_dongneLife_content ul.commentMemberSide {
		display:inline-block;
		list-style:none;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li {
		margin-left:15px;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:first-child {
		margin-top:10px;
		font-size:16px;
		font-weight:900;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(2) {
		margin-top:3px; 
		font-size:15px;
		color:gray;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(3) {
		height:15%;
		margin-top:8px; 
		font-size:17px;
	}
	section.section5_dongneLife_content ul.commentMemberSide>li:nth-child(4) {
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
	section.section6_dongneLife_content div.content_comment_write textarea {
		width:650px;
		height:30px;
		font-size:18px;
		padding:5px 5px;
		margin:0 10px;
		resize:none;
	}
	section.section6_dongneLife_content div.content_comment_write img {
		width:23px;
		height:23px;
		margin-bottom:10px;
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

	section.section6_dongneLife_content>div>div {
		margin-top:-50px;
		padding-top:2px;
		padding-left:88%;
	}
	div.content_comment_write ul>li {
		display:inline-block;
	}
	div.content_comment_write>ul>li:first-child {
		padding-bottom:10px;
	}
</style>
<script>
	$(document).ready(function(){
		var session_mid = $("#session_mid").val();
		
		/** 데이터 로딩 시 댓글 전체 리스트 출력 **/
		comment_list($("#bid").val());
		
		/** Ajax를 활용한 댓글 전체 리스트 출력 **/
		function comment_list(bid){
			$.ajax({
				url:"comment_list_ajax_proc.do?bid="+bid,
				success:function(result){	
					var jdata = JSON.parse(result);	
					
					var output="";
					
					for(var i in jdata.jlist){	
						output +="<div class='content_comment' id='content_comment'>"
						output += "<div class='commentMemberImg'>";
						output += "<img src='images/mypage_bananaimg.jpg' class='commentMemberImg'>";
						output += "</div>";
						output += "<div class='commentMemberSide'>";
						output += "<ul class='commentMemberSide'>";
						
						output += "<li>" + jdata.jlist[i].nickname + "</li>";
						output += "<li>" + jdata.jlist[i].maddr + "/" + jdata.jlist[i].brdate + "</li>";
						output += "<li id='bcomment_content" + jdata.jlist[i].rno +"'>" + jdata.jlist[i].bcomment + "</li>";
						output += "<li id='bcomment_area" + jdata.jlist[i].rno +"'>"+ "</li>";
						
						//세션아이디와 비교
						if(session_mid == jdata.jlist[i].mid) {
							output += "<li>";
							output += "<a onclick=" + "\"update_pro("+"\'"+ jdata.jlist[i].brid +"\'"+","+"\'"+ jdata.jlist[i].rno +"\'" +")\"><button type='button' id='update'>수정</button></a>";
							output += "<a href='comment_delete_proc.do?brid=" + jdata.jlist[i].brid + "'><button type='button'>삭제</button></a>";
							output += "</li>";
						}
						
						output += "</ul>";
						output += "</div>";
						output += "</div>";
					}
					
					$("#section5_dongneLife_content").append(output);
					
					//댓글 갯수
					$("#comment_count").text(jdata.comment_count);
					
				}//success
			});//ajax
		}//comment_list
		
		//수정 버튼 눌렸을 때
		$("#commentUpdate").click(function(){
			alert("fdlke");
			$("#section5_dongneLife_content").load("dongneLifeComment_update.do");
		});
		
		$("#comment_writeBtn").click(function(){
			if($("#bcomment").val() == ""){
				alert("댓글을 입력해주세요");
				$("#bcomment").focus();
				return false;
			}else {
				board_review_write_form.submit();
			}
		});
	});
</script>
<script>

	$(document).ready(function(){
		$(".comment_deleteBtn").click(function(){
			
			showConfirm();
		});
		
		 function showConfirm() {
			 if (confirm("정말 삭제하시겠습니가?"))
			  {
				 window.location.href="dongneLife_delete.do?bid=${vo.bid }"
			  } 
			 };
		 
	

			
			 
			 lightbox.option({
				    resizeDuration: 200,
				    wrapAround: true,
				    disableScrolling: false,
				    fitImagesInViewport:false
				})
		
				
	})
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_content">
		<section class="section1_dongneLife_content">
		<input type="hidden" id="bid" value="${vo.bid }">
		<input type="hidden" id="session_mid" value="${svo.mid }">
			<div class="content_nav">
				<ul>
					<li><a href="dongneLife.do"><img src="images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li>
						<button type="button" class="btn_unlike" id="btnLike">
  						<span class="img_emoti">좋아요</span></button>
  					</li>
					<li><a href="dongneLife_update.do?bid=${vo.bid }"><button class="comment_updateBtn">수정</button></a>
					<li><a href="dongneLife_delete.do?bid=${vo.bid }"><button class="comment_deleteBtn">삭제</button></a>
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
							<li>${vo.nickname }</li>
							<li>${vo.maddr } / ${vo.bdate }</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section class="section3_dongneLife_content">
			<div class="content_detail">
				
			<pre><c:out value="${vo.btopic}" /></pre>


			
			<div id ="img_div">
			<c:forEach var="list" items="${sfile_list }" >
			
					<a href="http://localhost:9000/banana/resources/upload/${list}"  data-lightbox="example-set"><img src="http://localhost:9000/banana/resources/upload/${list}" ></a> 
				
			</c:forEach>
			</div>	
			</div>
		</section>
		<section class="section4_dongneLife_content">
			<div class="content_response">
				<ul>
					<li>
						<a href="#"><img src="images/smile.png"><button type="button">공감하기</button></a>
						<img src="images/messenger.png"><button type="button">댓글 <span id="comment_count"></span></button>
					</li>
				</ul>
			</div>
		</section>
		<section class="section5_dongneLife_content" id="section5_dongneLife_content">
		
		</section>
		<section class="section6_dongneLife_content">
		<c:choose>
			<c:when test="${svo.mid ne null }">
			<form name="board_review_write_form" action="dongneLife_review_write_proc.do?bid=${vo.bid }" method=POST id="board_review_write_form"  enctype="multipart/form-data">
				<div class="content_comment_write">
					<ul>
						<li><textarea placeholder="따뜻한 댓글을 입력해주세요 :)" id="bcomment" name="bcomment"></textarea></li>
						<li><div><button type="button" class="comment_writeBtn" id="comment_writeBtn">등록</button></div></li>
					</ul>
				</div>
			</form>
			</c:when>
			<c:otherwise>
				<div><label>로그인 후 이용해주세요</label></div>
			</c:otherwise>
		</c:choose>
		</section>
		
		<section class="section7_dongneLife_content">
			
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
<script>
function update_pro(brid,rno) {
	$("#bcomment_content"+rno).remove();
	$("#bcomment_area"+rno).load("dongneLifeComment_update.do?brid=" + brid + "&rno=" + rno);
	$("button#update").hide();
}
</script>


</body>
</html>