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



	/* $(document).ready(function(){
		$("#like-btn").mousedown(function(){
		
			$("#like-btn").css("background-color", "blue");
		}) */
		
		
		/* $("#like-btn1").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn1").text());
				$("#like-btn1").css("border-radius","100px")
				.css("background-color","#FEE500");
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","#FEE500");
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
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","#FEE500");
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
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","#FEE500");
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
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","#FEE500");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn5").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn5").text());
				$("#like-btn5").css("border-radius","100px")
				.css("background-color","#FEE500");
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","#FEE500");
				$("#like-btn6").css("background-color","white");
			}
		});
		$("#like-btn6").click(function(){
			if($(".display-like").text() == "") {
				$(".display-like").text($("#like-btn6").text());
				$("#like-btn6").css("border-radius","100px")
				.css("background-color","#FEE500");
				$(".like-list").toggle();
			} else {
				$(".display-like").text("");
				$("#like-btn1").css("background-color","white");
				$("#like-btn2").css("background-color","white");
				$("#like-btn3").css("background-color","white");
				$("#like-btn4").css("background-color","white");
				$("#like-btn5").css("background-color","white");
				$("#like-btn6").css("background-color","#FEE500");
			}
		}); */
		
/* 	}); */
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
   
    div.post-footer ul>li {
		display:inline-block;		
	}
	
   div.post-footer textarea {
		width:650px;
		height:30px;
		font-size:18px;
		padding:5px 5px;
		margin:0 10px;
		resize:none;	
	}
	div.post-footer img {
		width:23px;
		height:23px;
		margin-bottom:10px;
	}
	div.post-footer button#comment_writeBtn{
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:7px 17px;
		font-size:17px;
		border-radius:5px; 
		width:70px;
		height:30px;
		float:left;
		
	}
	 div.post-footer button.comment_writeBtn:hover{
	 	cursor:pointer;
		opacity:0.7;
	}
	
	div#subreview div.content_comment {
		margin-bottom:10px;
		margin-top:40px;
	}
	div#subreview img.commentMemberImg {
		magin-bottom:100px;
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 10px #FEE500;
		margin-left:60px;
	}
	div#subreview div.commentMemberImg {
		float:left;
		display:inline-block;
		width:80px;
		height:110px;
		
	} 
	div#subreview div.commentMemberSide {
		margin-top:-10px;
		padding-bottom:30px;
	}
	div#subreview ul.commentMemberSide {
		display:inline-block;
		list-style:none;
	}
	div#subreview ul.commentMemberSide>li {
		margin-left:15px;
	}
	div#subreview ul.commentMemberSide>li:first-child {
		margin-top:10px;
		font-size:16px;
		font-weight:900;
	}
	div#subreview ul.commentMemberSide>li:nth-child(2) {
		margin-top:3px; 
		font-size:15px;
		color:gray;
	}
	div#subreview ul.commentMemberSide>li:nth-child(3) {
		height:15%;
		margin-top:8px; 
		font-size:17px;
	}
	div#subreview ul.commentMemberSide>li:nth-child(4) {
		font-size:17px;
		display:block;
		margin-top:10px;
		padding-left:20px;
	}
	 div.commentMemberSide button#update,
	 div.commentMemberSide button#delete {
	 	all:unset;
	 	display:inline-block;
	 	margin-top:30px;
	 	margin-right:10px;
   
	}
	div.likecount{
		text-align:left;
		margin-bottom:-50px;
		padding-left:30px;
	}
	div.likecount >img{
		width:20px;
		height:20px;
	}
	div.likecount >span{
		vertical-align:2px;
	}
</style>
<script>

	
	function board_like(bid,blike,count){
		if($("#good"+count).attr("src") == 'images/normal.png'){
			$.ajax({
				url:"subjectBoardlike.do?bid="+bid,
				success:function(result){
					if(result == "1"){
						$("#good"+count).attr("src" ,"images/good.png");
						$("#like-btn"+count).css("color","rgb(5,107,225)");
						var plus = parseInt($("#a"+count).text());
						$("#a"+count).text(plus+1);
					}
				}
			})
		}else{
			$.ajax({
				url:"subjectBoardlikecancel.do?bid="+bid,
				success:function(result){
					if(result == "1"){
						$("#good"+count).attr("src" ,"images/normal.png");
						$("#like-btn"+count).css("color","black");
						var plus = parseInt($("#a"+count).text());
						$("#a"+count).text(plus-1);
					}
				}
			})
			
		}
		
	}
	
	function comment_list(bid,count){ 
	
		if($("#subreview"+count).css("display") =="none" ){
			
		$.ajax({
			url:"subjectContentReview.do?bid="+bid,
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
					
					output += "<li><input id='brid' type='hidden' value='"+ jdata.jlist[i].brid + "'>"
					output += "<li>" + jdata.jlist[i].nickname + "</li>";
					output += "<li>" + jdata.jlist[i].maddr + "/" + jdata.jlist[i].brdate + "</li>";
					output += "<li id='bcomment_content" + jdata.jlist[i].rno +"'>" + jdata.jlist[i].bcomment + "</li>";
					output += "<li id='bcomment_area" + jdata.jlist[i].rno +"'>"+ "</li>";
					
					if('${mid}' == jdata.jlist[i].mid) {
						output += "<li>";
						output += "<a onclick=" + "\"update_pro("+"\'"+ jdata.jlist[i].brid +"\'"+","+"\'"+ jdata.jlist[i].rno +"\'" +")\"><button type='button' id='update'>수정</button></a>";
						output += "<a href='subcomment_delete_proc.do?brid=" + jdata.jlist[i].brid + "&bstitle=${ vo.bstitle }'><button type='button' id='delete'>삭제</button></a>";
						output += "</li>";
					}
					
					output += "</ul>";
					output += "</div>";
					output += "</div>";
			    }
				$("#subreview"+count).css("display" ,"block");
				$("#subreview"+count).text("");
				$("#subreview"+count).append(output);
				
				
			}
				
		})
		}else {
			$("#subreview"+count).css("display" ,"none");
		}
			
		
	}//comment_list
	
	function test(count){
		$("#comment-btn"+count).click(function(){
			$("#subreview"+count).css("display","none");
		});
	}
	
	function update_pro(brid,rno) {
		$("#bcomment_content"+rno).remove();
		$("#bcomment_area"+rno).load("dongneLifeComment_update.do?brid=" + brid + "&rno=" + rno + "&bstitle=${ vo.bstitle }");
		$("button#update").hide();
	}
	
	
	
	
$(document).ready(function(){
	
	$("#comment_writeBtn").click(function(){

		if($("#bcomment").val() == ""){
			alert("댓글을 입력해주세요");
			$("#bcomment").focus();
			return false;
		}else {
			board_review_write_form.submit();
			
		}
	});
})


</script>
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
			

			<c:forEach var="xvo" items="${ list }" varStatus="status">

			    <a href="#"><div class="post-list">
				
				<div class="post-header">
					<img class="userImg" src="http://localhost:9000/banana/images/mypage_bananaimg.jpg">
					<ul>
						<li class="userName">${ xvo.nickname }</li>
						<li class="userAddr">${ xvo.maddr }</li>
						<li class="regit-date">${ xvo.bdate }</li>
					</ul>
				</div>
				<div class="box">
					<div class="post-body">
						<pre><c:out value="${ xvo.btopic}" /></pre>
					</div>
				</div>
				</a>
			<!-- 	<div class="like-list" style="display: none;">
					<button type="button" id="like-btn1">👍</button>
					<button type="button" id="like-btn2">💛</button>
					<button type="button" id="like-btn3">😆</button>
					<button type="button" id="like-btn4">😮</button>
					<button type="button" id="like-btn5">😥</button>
					<button type="button" id="like-btn6">😡</button>
				</div> -->
					<div class="likecount">
						<img src="images/good.png" class="blue_img" > <span id="a${status.count }">${xvo.likecount }</span>
					</div>
				<div class="post-footer">
					<c:choose>
						<c:when test="${xvo.blike eq 'o'}">						
							<c:choose>
							<c:when test="${mid ne xvo.mid }"> 
								<img src="images/smile.png"><button type="button" id="like-btn${status.count }" onclick="board_like('${xvo.bid}','${xvo.blike }','${status.count }')"><img src="images/normal.png" id="good${status.count }" style="display:inline-block;vertical-align:middle;">공감하기</button>						
						 	</c:when>
						 	<c:otherwise>
								<img src="images/smile.png"><button type="button" id="like-btn${status.count }" onclick="board_like('${xvo.bid}','${xvo.blike }','${status.count }')" style="color:rgb(5,107,225);"><img src="images/good.png" id="good${status.count }" style="display:inline-block;vertical-align:middle;">공감하기</button>
						 	</c:otherwise> 
							</c:choose>
						</c:when>
						<c:otherwise>
							<img src="images/smile.png"><button type="button" id="like-btn${status.count }" onclick="board_like('${xvo.bid}','${xvo.blike }','${status.count }')"><img src="images/normal.png" id="good${status.count }" style="display:inline-block;vertical-align:middle;">공감하기</button>						
						</c:otherwise>
					</c:choose>
					
					<img src="images/messenger.png"><button type="button"  id="comment-btn${status.count }" onclick="comment_list('${xvo.bid}','${status.count }')">댓글 ${xvo.reviewcount }</button>
						<div class="display-like"></div>
						<div id="subreview">
							<div id="subreview${status.count }" style="display:none;">
							
							</div>
						</div>
						 <div >				
							<form name="board_review_write_form" action="dongneLife_review_write_proc.do?bid=${xvo.bid }&loc=subcontent&bstitle=${ vo.bstitle }" method=POST id="board_review_write_form"  >
								<div class="content_comment_write">
									<ul>
										<li><textarea placeholder="따뜻한 댓글을 입력해주세요 :)" id="bcomment" name="bcomment"></textarea></li>
										<li><div><button type="button" class="comment_writeBtn" id="comment_writeBtn">등록</button></div></li>
									</ul>
								</div>
							</form>
								
						</div> 
					
				    </div>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>