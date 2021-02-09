<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.mainDiv_chatContent {
		width:70%;
		margin:auto;
		padding-top:150px;
		padding-bottom:10%;
	}
	section.section1_chatContent {
		border-bottom:1px solid lightgray;
		padding-bottom:30px;
	}
	section.section1_chatContent div {
		padding-left:60px;
	}
	section.section1_chatContent ul li {
		display:inline-block;
	}
	section.section1_chatContent ul>li:first-child img {
		width:30px;
		height:30px;
		margin-bottom:3px;
	}
	section.section1_chatContent ul>li:nth-child(2) {
		padding-left:41%;
	}
	section.section1_chatContent ul>li:nth-child(2) table td:first-child span {
		font-size:25px;
		font-weight:800;
	}
	section.section1_chatContent ul>li:nth-child(2) table td:nth-child(2) {
		padding-top:10px;
	}
	section.section1_chatContent ul>li:nth-child(2) table td:nth-child(2) span {
		padding-left:10px;
		font-size:16px;
		color:green;
	}
	section.section2_chatContent {
		padding-top:10px;
		padding-bottom:5px;
		border-bottom:1px solid lightgray;
	}
	section.section2_chatContent table.table_chatContent tr:first-child img {
		border-radius:20px;
		width:100px;
		height:100px;
	}
	section.section2_chatContent table.table_chatContent tr:first-child td:first-child {
		padding-left:20px;
	}
	section.section2_chatContent table.table_chatContent tr:first-child td:nth-child(2) span,
	section.section2_chatContent table.table_chatContent tr:nth-child(2) span {
		padding-left:20px;
	}
	section.section2_chatContent table.table_chatContent tr:nth-child(2) span {
		font-weight:600;
		font-size:19px;
	}
	section.section3_chatContent {
		padding-bottom:30px;
	}
	section.section3_chatContent>div.reply {
		position:relative;
		top:0px;
		left:0px;
		width:40%;
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 16px rgb(221,221,221);
		padding:50px 0;
		margin:20px 0;
	}
	section.section3_chatContent>div.reply p {
		padding:10px 10px;
	}
	section.section3_chatContent>div.request {
		position:relative;
		top:0px;
		left:800px;
		width:40%;
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 16px rgb(221,221,221);
		padding:50px 0;
	}
	section.section3_chatContent>div.request p {
		padding:10px 10px;
	}
	section.section4_chatContent {
		clear:both;
		border-top:1px solid lightgray;
		padding-top:20px;
		padding-left:130px;
	}
	section.section4_chatContent>div img {
		width:23px;
		height:23px;
		margin-bottom:10px;
	}
	section.section4_chatContent form div textarea {
		width:70%;
		height:30px;
		font-size:18px;
		padding:5px 5px;
		margin:0 10px;
		resize: none;
	}
	section.section4_chatContent button.chatBtn {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:8px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section4_chatContent button.chatBtn:hover {
		cursor:pointer;
		opacity:0.7;
	}
	section.section4_chatContent>div>div {
		margin-top:-50px;
		padding-top:3px;
		padding-left:80%;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="mainDiv_chatContent">
		<section class="section1_chatContent">
			<div>
				<ul>
					<li><a href="chat_list.do"><img src="images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li>
						<table>
							<tr>
								<td><span>${vo.nickname }</span></td>
								<td><span>${vo.score}˚C</span></td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</section>
		<section class="section2_chatContent">
			<div>
			
				<table class="table_chatContent">
					<tr>
						<td rowspan="2"><img src="images/card-photo2.jpg"></td>
						<td><span>${vo.ptitle }</span></td>
					</tr>
					<tr>
						<td><span>${vo.pprice }원</span></td>
					</tr>
				</table>
			</div>
		</section>
		<section class="section3_chatContent">
			<div class="reply">
				<p><span>${vo.buy_mid }</span>답장답장${vo.chat_content}</p>
			</div>
			<div class="request">
				<p>질문질문${vo.chat_content}</p>
			</div>
			<div class="reply">
				<p>답장답장</p>
			</div>
			<div class="reply">
				<p>답장답장</p>
			</div>
			<div class="request">
				<p>질문질문</p>
			</div>
		</section>
		<section class="section4_chatContent">
		  <c:choose>
			<c:when test="${svo.mid ne null }">
				<form name="chat_form" action="chat_write_proc.do?cid=${vo.cid}" method=POST id="chat_write_form"  enctype="multipart/form-data">
					<div>
						<!-- <a href="#"><img src="images/dongneLife_inputimg.png"><button type="button"></button></a> -->
						<textarea name="chat_content" placeholder="메세지를 입력하세요."></textarea>
						<div><a href="#"><button type="submit" class="chatBtn">전송</button></a></div>
						<input type="hidden" name="sell_mid" value="${mid}">
						<input type="hidden" name="pid" value="${pid}">  
						<%-- <input type="text" name="cid" value="${vo.cid}">  --%> 
						<input type="hidden" name="buy_mid" value="${svo.mid}">
						<input type="hidden" name="chk_read" value="x">
					</div>
				</form>
			</c:when>
			 <c:otherwise>
				<div><label>로그인 후 이용해주세요</label></div>
			</c:otherwise>
		  </c:choose>
		</section>
	</div>
	
	
	<jsp:include page="../chatBanner/chat.jsp"/>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>