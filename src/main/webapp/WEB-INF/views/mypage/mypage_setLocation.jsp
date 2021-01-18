<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
	});
</script>
<style>
	div.mypage_setLocation {
		width:98%;
		height:750px;
		margin:auto;
		border:1px solid yellow;
	}
	.setLocation_title h1{
		font-size: 28px;
		margin: 50px 43%;
	}
	.setLocation_title h3{
		margin: 10px 30%;
		color:gray;
	}
	.setLocation_title button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		font-size:17px;
		font-weight:bold;
		width: 200px;
		height: 60px;
		margin: 0 20px; 
		padding:15px 17px;
		border-radius:5px;
	}
	.setLocation_title button:nth-child(4) {
		margin-left:290px;
	}
</style>
</head>
<body>
	<div class="mypage_setLocation">
		<section class="section1_setLocation">
			<div class="setLocation_title">
				<h1>동네 선택</h1>
				<h3>지역은 최소 1개 이상 최대 2개까지 설정 가능해요.</h3><br>
				<button type="button">이의동</button>
				<button type="button">+</button>
			</div>
			
		</section>
	</div>
</body>
</html>