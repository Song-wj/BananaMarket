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
		$("#like-btn").click(function(){
			$(".like-list").toggle();
		});
		
		$("#like-btn1").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn1").text());
				$("#like-btn1").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn2").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn2").text());
				$("#like-btn2").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn3").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn3").text());
				$("#like-btn3").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn4").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn4").text());
				$("#like-btn4").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn5").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn5").text());
				$("#like-btn5").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn6").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn6").text());
				$("#like-btn6").css("border-radius","100px")
				.css("background-color","#FEE500");
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		
	});
</script>
<script >
    $(document).ready(function(){

		 $('.box').each(function(){
		     var content = $(this).children('.post-body');
		     var content_txt = content.text();
		     var content_txt_short = content_txt.substring(0,105)+"...";
		     var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
		     
		     $(this).append(btn_more);
		     
		     if(content_txt.length >= 105){
		         content.html(content_txt_short)
		         
		     }else{
		         btn_more.hide()
		     }
		     
		     btn_more.click(toggle_content);
 
		     
            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }else{
                    // 더보기 상태
                    $(this).html('접기');
                    content.html(content_txt);
                    $(this).addClass('short');

                }
            }
            
        });
    });
  </script>
<style>
	.mypage_subjectContent {
		margin-top: 6.5rem;
		text-align: center;
	}
	
	.subjectContent_photo_area img {
		width: 70%;
		height: 500px;
	} 
	
	.subjectContent-write-area h2 {
		text-align: left;
		margin-top: 20px;
		margin-left: 280px;
		font-size: 2rem;
		font-weight: bold;
		padding-bottom: 40px;
		width: 90%;
	}
	
	.subjectContent-write-area .subjectContent-body {
		text-align: left;
		margin-left: 280px;
		margin-top: -20px;
		font-size: 20px;
	}
	
	.subjectContent-write-area .subjectContent-goSubjectList {
		text-align: left;
		margin-left: 280px;
		margin-top: 20px;
	}
	
	.subjectContent-write-area .subjectContent-goSubjectList a{
		margin-top: -30px;
		color: #808080;
		text-decoration: none;
		font-size: 20px;
	}
	
	.subjectContent-write-area .subjectContent-write {
		margin-top: 30px;
		margin-left: 280px;
		width: 70%;
		padding: 20px 0;
		background-color: #666
	}
	
	.subjectContent-write-area .subjectContent-write a {
		font-size: 30px;
		color: #FEE500;
		font-weight: bold;
		text-decoration: none;
	}
	
	.subjectContent-write-area .subjectContent-write a:active {
		opacity: 0.6;
	}
	
	.subjectContent-post {
		margin: 30px 0;
		margin-left: 280px;
		width: 70%;
	}
	
	.subjectContent-post .post-list {
		border-top: 10px solid #e9e9e9;
		border-bottom: 10px solid #e9e9e9;
	}
	
	.subjectContent-post .post-list .post-header{
		text-align: left;
	}
	
	.subjectContent-post .post-list .post-header .userImg{
		margin-left: 30px;
		margin-top: 30px;
		width: 80px;
		height: 80px;
		border-radius: 50%;
		border: 6px solid #FEE500;
	}
	
	.subjectContent-post .post-list .post-header ul {
		list-style-type: none;
		margin-left: 140px;
		margin-top: -65px;
	}
	
	.subjectContent-post .post-list .post-header ul li {
		display: inline-block;
		font-size: 25px;
		margin-right: 5px;
	}
	
	.subjectContent-post .post-list .post-header .userName {
		font-weight: bold;
	}
	.subjectContent-post .post-list .post-header .userAddr,
	.subjectContent-post .post-list .post-header .regit-date {
		color: #bdbebd;
	}	
	.subjectContent-post .post-list .post-header .regit-date {
		float: right;
		margin-right: 20px;
	}
	
	a {
		text-decoration:none;
	}
	.subjectContent-post .post-list .post-body{
		text-align: left;
		margin-top: 50px;
		margin-left: 30px;
	}
	
	.subjectContent-post .post-list .post-body p {
		font-size: 25px;
	}
	
	.subjectContent-post .post-list .post-body img{
		margin-top: 20px;
		margin-left: 140px;
		width: 1024px;
		height: 600px;
	}
	
	.subjectContent-post .post-list .post-footer{
		text-align: left;
		margin-top: 50px;
		border-top: 1px solid #ccc;
		padding: 30px;
	}
	
	.subjectContent-post .post-list .post-footer button {
		all: unset;
		font-size: 30px;
		width: 200px;
		height: 70px;
		text-align: center;
	}
	
	.subjectContent-post .post-list .post-footer button:active {
		background-color: #e9e9e9;
		border-radius: 5px;
	}
	.subjectContent-post .post-list .like-list {
		border: 1px solid red;
		width: 450px;
		height: 60px;
		border: 1px solid #ccc;
		border-radius: 50px;
		box-shadow: 0 4px 4px -4px #ccc;
		margin-top: 20px;
		margin-bottom: -30px;
	}
	
	.subjectContent-post .post-list .like-list button {
		all: unset;
		font-size: 30px;
		margin: 0 7.5px;
		margin-top: 5px;
		padding: 3px;
	}
	
	.subjectContent-post .post-list .like-list button:hover {
		opacity: 0.5;
	}
	
	.subjectContent-post .post-footer a img {
		width:30px;
		height:30px;
	}
	
	.display-like {
		font-size: 30px;
		float: right;
		margin-right: 20px;
		margin-top: 18px;
	}
	
	/** text ...더보기  **/
	.box {
		margin:30px;
	}
    .post-body{
        width:90%;
        padding:10px;
        /* border:1px solid #ddd;  */
        font: 400 1rem/1.5rem 'NotoSansKR';
    }
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="mypage_subjectContent">
		<section class="subjectContent_photo_area">
			<div class="subjectContent_photo">
				<img src="http://localhost:9000/banana/resources/upload/${ vo.bssfile }">
			</div>
		</section>
		<section class="subjectContent-write-area">
			<h2>${ vo.bstitle }</h2>
			<div class="subjectContent-body">
				<p>흑석동 근처 이웃들과<br>${ vo.bstitle }를 주제로 이야기해보세요.</p>
			</div>
			<div class="subjectContent-goSubjectList">
				<a href="http://localhost:9000/banana/mypage_subjectList2.do">다른 관심주제 보기 ></a>
			</div>
			<div class="subjectContent-write">
				<a href="http://localhost:9000/banana/mypage_subjectList_write.do">${ vo.bstitle } 주제로 글쓰기</a>
			</div>
		</section>
		<section class="subjectContent-post">
		<c:choose >
			<c:when test="${empty list}">
			<table class="review_all_table"> 
					<tr>
						<td style="padding: 230px 0; color: #ccc;">관련 게시글이 없습니다.</td>
					</tr> 
			</table>
			</c:when>
			<c:otherwise>
			
			<c:forEach var="vo" items="${list }">
			    <a href="http://localhost:9000/banana/mypage_subjectList_update.do"><div class="post-list">
				
				<div class="post-header">
					<img class="userImg" src="http://localhost:9000/banana/images/mypage_bananaimg.jpg">
					<ul>
						<li class="userName">${vo.nickname }</li>
						<li class="userAddr">${vo.maddr }</li>
						<li class="regit-date">${vo.bdate }</li>
					</ul>
				</div>
				<div class="box">
					<div class="post-body">
						<pre><c:out value="${vo.btopic}" /></pre>
					</div>
				</div>
				</a>
				<div class="like-list" style="display: none;">
					<button type="button" id="like-btn1">👍</button>
					<button type="button" id="like-btn2">💛</button>
					<button type="button" id="like-btn3">😆</button>
					<button type="button" id="like-btn4">😮</button>
					<button type="button" id="like-btn5">😥</button>
					<button type="button" id="like-btn6">😡</button>
				</div>
				<div class="post-footer">
					<a href="#"><img src="images/smile.png"><button type="button" id="like-btn">공감하기</button></a>
					<a href="#"><img src="images/messenger.png"><button type="button" id="comment-btn">댓글 16</button></a>
					<div class="display-like"></div>
				</div>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>