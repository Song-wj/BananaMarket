<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	div.recommand_store>div {
		margin-bottom:50px;
	}
	div.recommand_store>div span.review_count{
		color:green;
		font-weight:550;
		margin-bottom:20px;
	}
	div.recommand_store div.store_review{
		position:relative;
		top:30px;
		left:0px;
		bottom:30px;
		width:260px;
		height:50px;
		border-radius:17px;
		margin-left:-300px;
		margin-right:50px;
		background-color:lightgray;
	}
	div.recommand_store div.store_review span{
		font-weight:550;
	}
	div.recommand_store div.store_review label {
		padding-left:10px;
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
		margin-bottom:30px;
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
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=병원/의료">병원/의료</a></li>
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=빵집/카페">빵집/카페</a></li>
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=뷰티/미용">뷰티/미용</a></li>
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=인테리어">인테리어</a></li>
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=운동">운동</a></li>
				<li><a href="http://localhost:9000/banana/neighborhood_search.do?search=의류판매점">의류판매점</a></li>
			</ul>		
		</nav>
		<div class="category">
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=일자리">			
					<img src="images/work1.png">
				    <label>일자리</label>
				</a>
			</div>
			<div>	
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=법무/세무">						
					<img src="images/manager.png">
					<label>법무/세무</label>
				</a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=교육/학원">	
					<img src="images/notebook.png">			
					<label>교육/학원</label>
				</a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=음식점/반찬">	
					<img src="images/harvest.png">		
				    <label>음식점/반찬</label>
				</a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=부동산">	
					<img src="images/home.png">	
				    <label>부동산</label>
				</a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=자동차">			
					<img src="images/car1.png">
					<label>자동차</label>
				</a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=전시/행사">					
					<img src="images/diplay.png">			
			    	<label>전시/행사</label>			
			    </a>
			</div>
			<div>
				<a href="http://localhost:9000/banana/neighborhood_search.do?search=세탁/수선">	
					<img src="images/fashion.png">		
					<label>세탁/수선</label>
				</a>
			</div>		
		</div> <!-- category -->
		<div class="recommand_store">
			<a href="enrollstore.do"><button type="button">업체 등록</button></a>
			<label>이웃들의 추천 가게</label>
			<c:forEach var="vo" items="${list2 }">
			<div class="store_recommand">
				<div>				
					<img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg}"><img src="http://localhost:9000/banana/resources/upload/${vo.scaro_simg1}">
				</div>
				<a href="neighborhoodStore.do?sid=${vo.sid }"><label class="store_name">${vo.sname }</label></a>
				<label class="store_info">${vo.sintro }</label>
				<span class="review_count">후기 ${vo.review_count }</span><span class="interest_count">관심 ${vo.like_count }</span>
			</div>	
			<c:choose>
				<c:when test="${vo.srcontent ne '등록된 업체리뷰 없음' }">
					<div class="store_review" onclick="location.href='neighborStoreReview_content.do?srid=${vo.srid}'">
					<label>${vo.srcontent }</label>
				</div>	
				</c:when>
				<c:otherwise>
					<div class="store_review">
					<label>${vo.srcontent }</label>
				</div>	
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>  <!-- recommand_store -->
		<div class="recommand_store">
			<label>새로운 가게 소식</label>
			<c:forEach var="vo" items="${list }">
			<div class="store_recommand">
				<div>				
					<img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg}"><img src="http://localhost:9000/banana/resources/upload/${vo.scaro_simg1}">
				</div>
				<a href="neighborhoodStore.do?sid=${vo.sid }"><label class="store_name">${vo.sname }</label></a>
				<label class="store_info">${vo.sintro }</label>
				<span class="review_count">후기 ${vo.review_count }</span><span class="interest_count">관심 ${vo.like_count }</span>
			</div>	
			<c:choose>
				<c:when test="${vo.srcontent ne '등록된 업체리뷰 없음' }">
					<div class="store_review" onclick="location.href='neighborStoreReview_content.do?srid=${vo.srid}'">
					<label>${vo.srcontent }</label>
				</div>	
				</c:when>
				<c:otherwise>
					<div class="store_review">
					<label>${vo.srcontent }</label>
				</div>	
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<!-- <button type="button">가게 소식 전체 보기 > </button> -->
		</div><!-- store_news -->
		
	</div> <!-- content -->
	<jsp:include page="../footer.jsp" />
</body>
</html>