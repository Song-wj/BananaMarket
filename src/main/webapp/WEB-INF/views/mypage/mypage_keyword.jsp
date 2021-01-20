<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키워드 알림설정</title>
</head>
<style>
	div.mypage_keyword {
		width:98%;
		height:700px;
		margin:auto;
	}
	.keyword_title h1 {
		font-size:28px;
		margin:60px 40px;
	}
	.keyword_title span {
		font-size: 25px;
		font-weight:400;
		margin-left: 50px;
	}
	.mypage_keyword label {
		font-size:20px;
		color:rgb(98,71,24);
		margin-left: 40px;
	}
	.mypage_keyword label:hover{
		font-size:20px;
		color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
		margin-left: 40px;
	}
	.mypage_keyword input[type="text"] {
		width: 400px;
		height: 40px;
		color:rgb(98,71,24);
		margin: 30px 10px 30px 40px;
		font-size:20px;
		padding:10px 0;
		border:1px solid lightgray;
		border-radius:5px;
		text-indent:10px;
		font-size:17px;
	}
	.mypage_keyword button {
		pisition:relative;
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		padding:17px 17px;
		font-size:17px;
		font-weight:bold;
		border-radius:5px;
		width:90px;
	}
	.mypage_keyword button:hover{
		opacity:0.7;
	}
</style>
<body>
	<div class="mypage_keyword">
		<section class="section1_keyword">
			<div class="keyword_title"><h1>알림 받을 키워드<span>0/30</span></h1></div>
			<label>혹시 키워드 알림이 오지 않나요?</label><br>
			<input type="text" placeholder=" 키워드를 입력해주세요. (ex : 자전거)">
			<button>등록</button>
		</section>
	</div>	
</body>
</html>