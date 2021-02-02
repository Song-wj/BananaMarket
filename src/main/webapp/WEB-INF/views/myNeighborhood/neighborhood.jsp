<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.content{
		width:70%;
		margin:auto;		
		text-align:center;		
		margin-bottom:200px;
		margin-top:200px;
	}

	div.content nav.recommad_list ul li{
		display:inline;
		border:1px solid lightgray;
		border-radius:15px;
		margin-right:5px;
		padding: 5px 10px;
	}
	div.content nav.recommad_list{
		border-bottom:5px solid #FEE500;
		margin-bottom:50px;
		height:70px;
	}
	div.category>div{
		display:inline-block;
		margin-right:15px;
		text-align:center;
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
	div.recommand_store,
	div.store_news{
		margin-top:80px;
		text-align:left;
	}
	div.recommand_store>label,
	div.store_news>label{
		display:block;
		text-align:left;
		margin-left:10px;
		font-size:25px;
		font-weight:550;
		margin-bottom:20px;
	}
	div.recommand_store>div,
	div.store_news>div{
		display:inline-block;
		margin-left:10px;
		width:300px;
	}
	div.recommand_store>div div img{
		width:140px;
		height:70px;
	}
	div.recommand_store>div label.store_name{
		margin-left:10px;
		font-size:17px;
		font-weight:550;
		display:block;
	}
	div.recommand_store>div label.store_info{
		display:block;
		margin-left:10px;
		font-size:15px;
		overflow: hidden;
	    text-overflow: ellipsis;
	}
	div.recommand_store>div span{
		margin-left:10px;
		font-size:13px;
	}
	div.recommand_store>div span.review_count{
		color:green;
		font-weight:550;
	}
	div.recommand_store div.store_review{
		width:260px;
		height:50px;
		border-radius:17px;
		margin-left:10px;
		background-color:lightgray;
	}
	div.recommand_store div.store_review span{
		font-weight:550;
	}
	div.recommand_store button{
		margin-top:30px;
		margin-left:1200px;
		height:40px;
		background-color:white;
		outline:none;
		border-radius:15px;
	}
	div.store_recommand {
		margin-bottom:10px;
	}
	div.store_news img{
		width:290px;
		height:70px;
	}
	div.store_news label.news_title{
		display:block;
		margin-left:10px;
		font-size:20px;
		font-weight:550;
		overflow: hidden;
	    text-overflow: ellipsis;
 	   
	}
	div.store_news span.nickname{
		margin-left:10px;
		color:green;
		font-weight:550;
	}
	div.store_news button{
		width:700px;
		margin-top:60px;
		height:40px;
		background-color:white;
		outline:none;
		border-radius:15px;
		margin-left:270px;
		
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content">
		<nav class="recommad_list">
			<ul>
				<li>이사</li>
				<li>자동차</li>
				<li>용달</li>
				<li>공방</li>
				<li>영어</li>
				<li>피부관리</li>
			</ul>		
		</nav>
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
		<div class="recommand_store">
			<a href="enrollstore.do"><button type="button">업체 등록</button></a>
			<label>이웃들의 추천 가게</label>
			<c:forEach var="vo" items="${list }">
			<div class="store_recommand">
				<div>				
					<img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg}"><img src="http://localhost:9000/banana/resources/upload/${vo.scaro_simg1}">
				</div>
				<a href="neighborhoodStore.do?sid=${vo.sid }"><label class="store_name">${vo.sname }</label></a>
				<label class="store_info">${vo.sintro }</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>호호호호</label>
				</div>	
			</div>	
			</c:forEach>
			<button type="button">더 보러가기</button>				
		</div>  <!-- recommand_store -->
		<div class="recommand_store">
			<label>내 근처 가게 소식</label>
			<c:forEach var="vo" items="${list }">
			<div class="store_recommand">
				<div>				
					<img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg}"><img src="http://localhost:9000/banana/resources/upload/${vo.scaro_simg1}">
				</div>
				<a href="neighborhoodStore.do?sid=${vo.sid }"><label class="store_name">${vo.sname }</label></a>
				<label class="store_info">${vo.sintro }</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>호호호호</label>
				</div>	
			</div>	
			</c:forEach>
			<button type="button">가게 소식 전체 보기 > </button>
		</div><!-- store_news -->
		
	</div> <!-- content -->
	<jsp:include page="../footer.jsp" />
</body>
</html>