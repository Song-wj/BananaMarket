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
		$(".mycomment_table_area").hide();
		$(".mypost").click(function(){
			$(".mypost_table_area").show();
			$(".mycomment_table_area").hide();
			$(".mypost").css("color","black").css("border-bottom","4px solid black");
			$(".mycomment").css("color","#ccc").css("border-bottom","1px solid #ccc");
		});
		
		$(".mycomment").click(function(){
			$(".mypost_table_area").hide();
			$(".mycomment_table_area").show();
			$(".mypost").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".mycomment").css("color","black").css("border-bottom","4px solid black");
		})
	});
</script>
<style>
	.mypage_mypost {
		text-align: center;
	}
	
	.mypost_change_area .mypost_title {
		text-align: left;
		margin-top: 50px;
		margin-left: 50px;
		font-size: 2rem;
		font-weight: bold;
	}
	
	.mypost_change_area div button {
		all: unset;
		font-size: 2rem;
		margin-top: 50px;
		width: 20rem;
		height: 7rem;
		color: #ccc;
		border-bottom: 1px solid #ccc;
		font-weight: bold;
	}
	
	.mypost_change_area div .mypost {
		color: black;
		border-bottom: 4px solid black;
	}
	
	.mypost_change_area div .mypost:active,
	.mypost_change_area div .mycomment:active {
		background-color: #FEE500;
		opacity: 0.7;
	}
	
	.mypost_change_area div .mycomment {
		margin-left: -5px;
	}
	
	.mypage_mypost .mypost_table_area,
	.mypage_mypost .mycomment_table_area {
		display: flex;
		justify-content: center;
	}
	
	.mypage_mypost .mypost_table_area .mypost_table,
	.mypage_mypost .mycomment_table_area .mycomment_table {
		border-bottom: 1px solid #ccc;
		width: 650px;
	}
	
	.mypage_mypost .mypost_table_area .mypost_table tr td,
	.mypage_mypost .mycomment_table_area .mycomment_table tr td {
		font-size: 2.1rem;
	}
	.mypost_table_area table.mypost_table,
	.mycomment_table_area table.mycomment_table{
		text-align:left;
	}
	.mycomment_table_area table.mycomment_table tr:nth-child(1) td.post,
	.mypost_table_area table.mypost_table tr:nth-child(1) td.post{
		padding-top:20px;
	}
	.mypost_table_area table.mypost_table tr:first-child label:first-child{
		padding: 3px 30px;
		color: rgb(98,71,24);
		background-color:rgb(255,249,176);
		font-size:17px;
		margin-left:30px;
	}
	.mypost_table_area table.mypost_table tr:nth-child(2) img,
	.mycomment_table_area table.mycomment_table tr:nth-child(1) img{
		width:35px;
		height:35px;
		margin-left:5px;
		border-radius:50%;
     	border:2px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
      	margin-left:50px;
	}
	.mypost_table_area table.mypost_table tr:nth-child(2) label,
	.mycomment_table_area table.mycomment_table tr:nth-child(1) label{
		position: relative;
        top: -11px;
        color: rgb(98,71,24);
        font-weight:550;
        font-size:17px;
	}
	.mypost_table_area table.mypost_table tr:nth-child(2) label:last-child,
	.mycomment_table_area table.mycomment_table tr:nth-child(1) label:last-child{
        margin-left:6px;
        font-size:12px;
        font-weight:500;
	}
	.mypost_table_area table.mypost_table tr:nth-child(3) td pre,
	.mycomment_table_area table.mycomment_table tr:nth-child(2) td pre{
		width:92%;
		height:90px;
		overflow:hidden;
      	text-overflow:ellipsis;
      	display: -webkit-box;
   	 	-webkit-line-clamp: 5; /* 라인수 */
        -webkit-box-orient: vertical;
        word-wrap:break-word; 
        line-height: 1.2em;
        height: 6em;
        font-size:15px;
        text-indent:70px;
	}
	table.mypost_table:hover,
	table.mycomment_table:hover {
		cursor:pointer;
		box-shadow: 0 0 22px #FEE500;
	}
	
</style>
</head>
<body>
	<div class="mypage_mypost">
		<section class="mypost_change_area">
			<div class="mypost_title">동네생활 글</div>
			<div>
				<button type="button" class="mypost">내 게시글</button>
				<button type="button" class="mycomment">내 댓글</button>
			</div>
		</section>
		<section class="mypost_table_area">
			<div>
				
			<c:choose >
			<c:when test="${empty list }">
			<table class="mypost_table">
					<tr>
						<td style="padding: 230px 0; color: #ccc; text-align:center;">내 게시글이 없습니다.</td>
					</tr> 
			</table>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
				<table class="mypost_table">
					<tr>
						<td class="post">
							<label>${vo.btitle }</label>
						</td>
					</tr>
					<tr>
						<td class="post" colspan="3" >
							<img src="images/banana.jpg">
							<label>${vo.nickname }</label>
							<label>${vo.bdate }</label>					
						</td>
					</tr>
					<tr onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">
						<td class="post" colspan="3">	
							<pre><c:out value="${vo.btopic}" /></pre>
						
						</td>
					</tr>	
				
			</table>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
		</section>
		<section class="mycomment_table_area">
			<div>
				<c:choose >
			<c:when test="${empty clist }">
				<table class="mycomment_table">
					<tr>
						<td style="padding: 230px 0; color: #ccc; text-align:center;">댓글이 없습니다.</td>
					</tr> 
				</table>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${clist }">
				  <table class="mycomment_table">	
					<tr>
						<td class="post" colspan="3" >
							<img src="images/banana.jpg">
							<label>${vo.nickname }</label>
							<label>${vo.brdate }</label>					
						</td>
					</tr>
					<tr onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">
						<td class="post" colspan="3">	
							<pre><c:out value="${vo.bcomment}" /></pre>
						
						</td>
					</tr>	
				</table>
				
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
		</section>
	</div>
</body>
</html>