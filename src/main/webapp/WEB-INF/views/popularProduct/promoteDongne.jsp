<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.content{
		width:50%;
		margin:auto;
		margin-top:150px;
		margin-bottom:150px;
		text-align:center;
	}
	div.category>div{
		display:inline-block;
		margin-right:15px;
		margin-top:50px;
		margin-bottom:50px;	
	}
	div.category>div img{
		width:50px;
		height:50px;
		display: block; 
		margin: 0px auto;
	}
	div.category>div a{
		text-decoration:none;
		cursor:pointer;
	}
	div.category>div a label{
		cursor:pointer;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content">
		<h1>이웃들에게 홍보하고 싶은</h1>
		<h1>카테고리를 선택해 주세요</h1>
		<div class="category">
			<div>
				<a href="">			
					<img src="images/work1.png">
				    <label>일자리</label>
				</a>
			</div>
			<div>	
				<a href="">						
					<img src="images/manager.png">
					<label>동네 구인구직</label>
				</a>
			</div>
			<div>
				<a href="">	
					<img src="images/notebook.png">			
					<label>과외/클래스</label>
				</a>
			</div>
			<div>
				<a href="">	
					<img src="images/harvest.png">		
				    <label>농수산물</label>
				</a>
			</div>
			<div>
				<a href="">	
					<img src="images/home.png">	
				    <label>부동산</label>
				</a>
			</div>
			<div>
				<a href="">			
					<img src="images/car1.png">
					<label>중고차</label>
				</a>
			</div>
			<div>
				<a href="">					
					<img src="images/diplay.png">			
			    	<label>전시/행사</label>			
			    </a>
			</div>
			<div>
				<a href="">	
					<img src="images/fashion.png">		
					<label>세탁</label>
				</a>
			</div>		
		</div> <!-- category -->
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>