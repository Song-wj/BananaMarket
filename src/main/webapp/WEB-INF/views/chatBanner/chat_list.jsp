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
	div.mainDiv_chatList {
		width:70%;
		margin:auto;
		padding-top:150px;
		padding-bottom:10%;
	}
	section.section1_chatList {
		border-bottom:1px solid lightgray;
		padding-bottom:30px;
	}
	section.section1_chatList div {
		padding-left:40px;
	}
	section.section1_chatList label {
		font-size:30px;
		font-weight:900;
	}
	section.section2_chatList {
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 16px rgb(221,221,221);
	}
	section.section2_chatList>div:hover {
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 26px rgb(221,221,221);
		cursor:pointer;
	}
	section.section2_chatList table.table_chatList {
		width:100%;
		height:200px;
	}
	section.section2_chatList tr:first-child td:first-child {
		width:100px;
		padding:0 50px;
	}
	section.section2_chatList tr:first-child td img {
		width:100px;
		heigth:100px;
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px #FEE500;
	}
	section.section2_chatList tr:first-child td:nth-child(2) {
		height:70px;
		margin-top:10px;
	}
	section.section2_chatList tr:first-child td:nth-child(2) ul li {
		display:inline-block;
	}
	section.section2_chatList tr:first-child td:nth-child(2) li:first-child span {
		font-size:20px;
		font-weight:700;
	}
	section.section2_chatList tr:first-child td:nth-child(2) li:nth-child(2) span,
	section.section2_chatList tr:first-child td:nth-child(2) li:nth-child(3) span {
		color:gray;
		padding-left:8px;
	}
	section.section2_chatList tr:nth-child(2) td span {
		font-size:20px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="mainDiv_chatList">
		<section class="section1_chatList">
			<div>
				<label>채팅</label>
			</div>
		</section>
		<section class="section2_chatList">
		   <c:forEach var="vo" items="${list }"> 
		    <c:if test="${vo.buy_mid ne svo.mid }">
			<div onclick="location.href='chat_list_content.do?cid=${vo.cid}'">
			
				<table class="table_chatList">
					<tr>
						<td rowspan="2"><img src="images/mypage_bananaimg.jpg"></td>
						<td>
							<ul>
								<li><span> ${vo.buy_mid }</span></li>
								<li><span> OO동</span></li>
								<li><span> ${vo.cdate }</span></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><span>${vo.chat_content }</span></td>
					</tr>
				</table>
			</div>
			</c:if>
	 </c:forEach>	
		</section>
	<!--  	<section class="section2_chatList">
			<div>
				<table class="table_chatList">
					<tr>
						<td rowspan="2"><img src="images/mypage_bananaimg.jpg"></td>
						<td>
							<ul>
								<li><span>당근이</span></li>
								<li><span>대부동</span></li>
								<li><span>어제</span></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><span>(수줍)흐흫님, 지금이 바로~ 집 정리할..</span></td>
					</tr>
				</table>
			</div>
		</section>
		<section class="section2_chatList">
			<div>
				<table class="table_chatList">
					<tr>
						<td rowspan="2"><img src="images/mypage_bananaimg.jpg"></td>
						<td>
							<ul>
								<li><span>당근이</span></li>
								<li><span>대부동</span></li>
								<li><span>어제</span></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><span>(수줍)흐흫님, 지금이 바로~ 집 정리할..</span></td>
					</tr>
				</table>
			</div>
		</section>
		<section class="section2_chatList">
			<div>
				<table class="table_chatList">
					<tr>
						<td rowspan="2"><img src="images/mypage_bananaimg.jpg"></td>
						<td>
							<ul>
								<li><span>당근이</span></li>
								<li><span>대부동</span></li>
								<li><span>어제</span></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td><span>(수줍)흐흫님, 지금이 바로~ 집 정리할..</span></td>
					</tr>
				</table>
			</div>
		</section> -->
	</div>
	
	
	<jsp:include page="../chatBanner/chat.jsp"/>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>