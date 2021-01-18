<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모아보기</title>
</head>
<style>
	.mypage_collectView {
		width:98%;
		height:700px;
		margin:auto;
	}
	.collectView_content img{
		width: 350px;
		height: 350px;
		margin:70px 300px;
	}
	.collectView_content label{
		font-size:20px;
		color:rgb(98,71,24);
		margin: 50px 0 40px 330px;
	}
	.collectView_content button{
		all:unset;
		font-size:20px;
		color:rgb(98,71,24);
		text-shadow: -0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500;
		margin: 30px 0 40px 400px;
	}
	.collectView_content button:hover{
		color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
	}
</style>
<body>
	<div class="mypage_collectView">
		<section class="section1_collectView">
			<div class="collectView_content">
				<img src="images/collect.png"><br>
				<label>모아보기 중인 사용자가 없습니다.</label><br>
				<button type="button">모아보기 알아보기</button>
			</div>
		</section>
	</div>	
</body>
</html>