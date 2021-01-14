<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.dongnelife {
		width: 70%;
		margin:auto;
		border:1px solid blue;
	}
	.dl_title > img{
		border: 1px solid green;
		
	}
	.dl_title > label{
		:center;
		border:1px solid red;
	}
	.dl_content {
		width: 60%;
		margin:auto;
		background-color: rgb(251,247,242); 
		/* background-color: rgb(255,249,176); */
		
	}
	.dl_content ul{
		list-style-type:none;
	}
	.dl_content ul li {
		
	}
	.dl_content ul li button{
		all:unset;
	}
	
	
</style>
<body>
	<div class="dongnelife">
		<section class="section1">
			<div class="dl_title"><h1>동네 생활</h1><hr>
				<img src=""><label>히흫(닉네임)님 오늘 이의동(지역)의 이야기를 들려주세요!</label>
				<button type="button">글쓰기</button>
			</div>	
			<div class="dl_content">
				<ul>	
					<li>
						<label>주제</label>
						<label>시간(몇분전)</label>
					</li>
					<li>
						<img src=""><label>닉네임</label>
						<label>지역</label>
					</li>	
					<li><label>내용</label></li>
					<li>
						<img src=""><button type="button">공감하기</button>
						<img src=""><button type="button">댓글쓰기</button>
					</li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>