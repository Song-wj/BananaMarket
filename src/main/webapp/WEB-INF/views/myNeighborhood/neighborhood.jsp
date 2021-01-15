<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	div.category>div{
		display:inline-block;
		margin-right:15px;
		text-align:center;
	}
	div.category>div img{
		width:50px;
		height:50px;
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
				<div>				
					<img src="images/work1.png">
				</div>
				<label>일자리</label>
			</div>
			<div>
				<div>				
					<img src="images/manager.png">
				</div>
				<label>동네 구인구직</label>
			</div>
			<div>
				<div>
					<img src="images/notebook.png">
				</div>
				<label>과외/클래스</label>
			</div>
			<div>
				<div>
					<img src="images/harvest.png">
				</div>
				<label>농수산물</label>
			</div>
			<div>
				<div>
					<img src="images/home.png">
				</div>
				<label>부동산</label>
			</div>
			<div>
				<div>				
					<img src="images/car1.png">
				</div>
				<label>중고차</label>
			</div>
			<div>
				<div>				
					<img src="images/diplay.png">
				</div>
				<label>전시/행사</label>			
			</div>
			<div>
				<div>
					<img src="images/fashion.png">
				</div>
				<label>세탁</label>
			</div>		
		</div> <!-- category -->
		<div class="recommand_store">
			<label>이웃들의 추천 가게</label>
			<div>
				<div>				
					<img src="images/clothes.png"><img src="images/clothes.png">
				</div>
				<label class="store_name">소문난반찬가게</label>
				<label class="store_info">~~~~~</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>호호호호</label>
				</div>	
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png"><img src="images/clothes.png">
				</div>
				<label class="store_name">소문난반찬가게</label>
				<label class="store_info">~~~~~</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>~~~~</label>
				</div>	
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png"><img src="images/clothes.png">
				</div>
				<label class="store_name">소문난반찬가게</label>
				<label class="store_info">~~~~~</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>~~~~</label>
				</div>	
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png"><img src="images/clothes.png">
				</div>
				<label class="store_name">소문난반찬가게</label>
				<label class="store_info">~~~~~</label>
				<span class="review_count">후기 5</span><span class="interest_count">관심 3</span>
				<div class="store_review">
					<span>oo님</span>
					<label>~~~~</label>
				</div>	
			</div>	
			<button type="button">더 보러가기</button>				
		</div>  <!-- recommand_store -->
		<div class="store_news">
			<label>내 근처 가게 소식</label>
			<div>
				<div>				
					<img src="images/clothes.png">
				</div>
				<label class="news_title">맛난 고기 팔아요~~~~~~~~~~~~~~~~~~~~~~~~~~~</label>
				<span class="nickname">한우파는 카우보이</span>
				
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png">
				</div>
				<label class="news_title">맛난 고기 팔아요~~~~~~~~~~~~~~~~~~~~~~~~~~~</label>
				<span class="nickname">한우파는 카우보이</span>
				
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png">
				</div>
				<label class="news_title">맛난 고기 팔아요~~~~~~~~~~~~~~~~~~~~~~~~~~~</label>
				<span class="nickname">한우파는 카우보이</span>
				
			</div>	
			<div>
				<div>				
					<img src="images/clothes.png">
				</div>
				<label class="news_title">맛난 고기 팔아요~~~~~~~~~~~~~~~~~~~~~~~~~~~</label>
				<span class="nickname">한우파는 카우보이</span>	
			</div>	
			<button type="button">가게 소식 전체 보기 > </button>
		</div><!-- store_news -->
		
	</div> <!-- content -->
	<jsp:include page="../footer.jsp" />
</body>
</html>