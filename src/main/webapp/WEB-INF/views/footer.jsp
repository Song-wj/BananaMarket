<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/banana//js/jqbar.js"></script>
<title>Insert title here</title>
<style>
div.footer{
	width:100%;
	background-color:rgb(73,80,87);
	height:460px;
	border:1px solid rgb(73,80,87);
}
div.footer div.fcontent1,
div.footer div.fcontent2{
    width:60%;
    margin:auto;
}
div.footer div.fcontent2{
	border-top:0.5px solid rgb(173,181,189);
}
div.footer div.fcontent1 div.flogo{
	margin-top:35px;
	display:inline-block;
	float:left;
}
div.footer div.fcontent1 img{
	margin-left:10px;
	width:200px;
	height:60px;
	margin-top:18px;
}	
div.footer div.fcontent1 ul{
	display:inline-block;	
	list-style:none;
	float:left;
	margin-right:80px;
	margin-top:50px;
	font-size:17px;
}
div.footer div.fcontent1 ul li{
	margin-bottom:20px;
	color:rgb(173,181,189);
}
div.footer div.fcontent1 ul.nav1{
	margin-left:50px;
}
div.footer div.fcontent1 ul.nav2 li:nth-child(2),
div.footer div.fcontent1 ul.nav1 li{
	color: white;
	font-weight:bold;
}
div.footer div.fcontent2{
	clear:left;
	padding-top:30px;
}
div.footer div.fcontent2 div:first-child{
	float:right;
}
div.footer div.fcontent2 div:first-child img{
	width:30px;
	height:30px;
	margin-left:20px;
}
div.footer div.fcontent2 span{
	margin-left:80px;
	color:rgb(134,142,150)
}
div.footer div.fcontent2 div:nth-child(2)>label{
	margin-left:60px;
}
div.footer div.fcontent2 span>label,
div.footer div.fcontent2 label{
	color:rgb(173,181,189);
}
div.footer div.fcontent1 ul.nav1>li>a{
	text-decoration:none;
	color: white;
	font-weight:bold;
}
</style>
</head>
<body>
<div class="footer">
	<div class="fcontent1">
		<div class="flogo">
			<img src="http://localhost:9000/banana/images/logo1.png">
		</div>
			<ul class="nav1">
				<li>믿을 수 있는 중고거래</li>
				<li><a href="http://localhost:9000/banana/question_list.do">자주 묻는 질문</a></li>
				<li><a href="http://localhost:9000/banana/notice_list.do">공지사항</a></li>
			</ul>
			<ul class="nav2">
				<li>회사 소개</li>
				<li>광고주 센터</li>
				<li>동네가게</li>
			</ul>
			<ul class="nav3">
				<li>이용약관</li>
				<li>개인정보처리방침</li>
				<li>위치기반서비스 이용약관</li>
			</ul>	
	</div>
	<div class="fcontent2">
		<div>
			<img src="http://localhost:9000/banana/images/facebook.png">
			<img src="http://localhost:9000/banana/images/instagram.png">
			<img src="http://localhost:9000/banana/images/blog.png">
		</div>
		<div>
			<span><label>고객문의</label> cs@daangnservice.com</span>&nbsp;&nbsp;
			<span><label>제휴문의</label> contact@daangn.com</span> <br><br>
			<span><label>지역광고</label> ad@daangn.com</span>&nbsp;&nbsp;
			<span><label>PR문의</label> pr@daangn.com</span> <br><br>
			<span>사업자 등록번호: 375-87-00088</span>&nbsp;&nbsp;
			<span>서울특별시 구로구 디지털로 30길 28 609호 pr@daangn.com</span> <br>
			<label>©Danggeun Market Inc.</label>
		</div>
	</div>
</div>
</body>
</html>