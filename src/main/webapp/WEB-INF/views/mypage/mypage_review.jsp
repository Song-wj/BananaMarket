<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(".review_all").click(function(){
			$(".review_all_table_area").show();
			$(".review_seller_table_area").hide();
			$(".review_buyer_table_area").hide();
			$(".review_all").css("color","black").css("border-bottom","4px solid black");
			$(".review_seller").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".review_buyer").css("color","#ccc").css("border-bottom","1px solid #ccc");
		});
		
		$(".review_seller").click(function(){
			$(".review_all_table_area").hide();
			$(".review_seller_table_area").show();
			$(".review_buyer_table_area").hide();
			$(".review_all").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".review_seller").css("color","black").css("border-bottom","4px solid black");
			$(".review_buyer").css("color","#ccc").css("border-bottom","1px solid #ccc");
		});
		
		$(".review_buyer").click(function(){
			$(".review_all_table_area").hide();
			$(".review_seller_table_area").hide();
			$(".review_buyer_table_area").show();
			$(".review_all").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".review_seller").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".review_buyer").css("color","black").css("border-bottom","4px solid black");
		});
	});
</script>
<style>
	.mypage_review {
		text-align: center;
	}
	
	.review_change_area .review_title {
		text-align: left;
		margin-top: 50px;
		margin-left: 50px;
		font-size: 2rem;
		font-weight: bold;
	}
	
	.review_change_area div button {
		all: unset;
		font-size: 2rem;
		margin-top: 50px;
		width: 13.5rem;
		height: 7rem;
		color: #ccc;
		border-bottom: 1px solid #ccc;
		font-weight: bold;
	}
	
	.review_change_area div .review_all {
		color: black;
		border-bottom: 4px solid black;
	}
	
	.review_change_area div .review_all:active,
	.review_change_area div .review_seller:active,
	.review_change_area div .review_buyer:active {
		background-color: #FEE500;
		opacity: 0.7;
	}
	
	.review_change_area div .review_seller {
		margin-left: -5px;
	}
	
	.mypage_review .review_all_table_area,
	.mypage_review .review_seller_table_area,
	.mypage_review .review_buyer_table_area {
		display: flex;
		justify-content: center;
	}
	
	.mypage_review .review_all_table_area .review_all_table,
	.mypage_review .review_seller_table_area .review_seller_table, 
	.mypage_review .review_buyer_table_area .review_buyer_table {
		border-bottom: 1px solid #ccc;
		width: 650px;
	}
	
	.mypage_review .review_all_table_area .review_all_table tr td,
	.mypage_review .review_seller_table_area .review_seller_table tr td,
	.mypage_review .review_buyer_table_area .review_buyer_table tr td {
		font-size: 2.1rem;
		
	}
	td.review{
		margin-top:10px;
		float:left;
	}
	td.review>img{
		width:35px;
		height:35px;
		margin-left:10px;
		border-radius:50%;
     	border:2px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
	}
	td.review>label{
		position: relative;
        top: -11px;
        color: rgb(98,71,24);
        font-weight:550;
        font-size:20px;
	}
	td.review>pre{
		font-weight:normal;
		width:650px;
        display: -webkit-box;
   	 	-webkit-line-clamp: 3; /* 라인수 */
        -webkit-box-orient: vertical;
        word-wrap:break-word; 
        line-height: 1.2em;
        height: 3.6em; 
		overflow:hidden;
      	text-overflow:ellipsis;
		border:1px solid red;
		text-align:left;
		font-size: 20px;
		
	}
	td.review>label.date{
		font-size:15px;
		color:lightgray;
	}
	section.review_all_table_area{
		height:700px;
		overflow:auto;
	}
</style>
</head>
<body>
	<div class="mypage_review">
		<section class="review_change_area">
			<div class="review_title">받은 거래 후기</div>
			<div>
				<button type="button" class="review_all">전체후기</button>
				<button type="button" class="review_seller">판매자 후기</button>
				<button type="button" class="review_buyer">구매자 후기</button>
			</div>
		</section>
		<section class="review_all_table_area">
			<div>
			<table class="review_all_table">
				<!-- <tr>
					<td style="padding: 230px 0; color: #ccc;">전체후기가 없습니다.</td>
				</tr> -->
				<c:forEach var="vo" items="${list }">
				<tr>
					<td class="review">
						<img src="images/banana.jpg">
						<label>${vo.mid }</label>
						<label>${vo.maddr }</label>
					</td>
				</tr>
				<tr>
					<td class="review" colspan="3">
						<pre><c:out value="${vo.review}" /></pre>
					</td>
				</tr>
				<tr>
					<td class="review">	
						<label class="date">${vo.rdate }</label>
					</td>
				</tr>	
				</c:forEach>
			</table>
			</div>
		</section>
		<section class="review_seller_table_area" style="display: none;">
			<div>
			<table class="review_seller_table">
				<c:choose >
					<c:when test="${list ne null }">
						<tr>
							<td style="padding: 230px 0; color: #ccc;">판매자 후기가 없습니다.</td>
						</tr> 
					</c:when>
				    <c:otherwise>
						<c:forEach var ="vo" items="${list}">
						 	<tr>
								<td class="review">
									<img src="images/banana.jpg">
									<label>${vo.mid }</label>
									<label>${vo.maddr }</label>
								</td>
							</tr>
							<tr>							
								<td class="review" colspan="3">
									<pre><c:out value="${vo.review}" /></pre>
								</td>
							</tr>
							<tr>
								<td class="review">	
									<label class="date">${vo.rdate }</label>
								</td>
							</tr>	
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
		</section>
		<section class="review_buyer_table_area" style="display: none;">
			<div>
			<table class="review_buyer_table">
				<c:choose >
					<c:when test="${list ne null }">
						<tr>
							<td style="padding: 230px 0; color: #ccc;">구매자 후기가 없습니다.</td>
						</tr> 
					</c:when>
				    <c:otherwise>
						<c:forEach var ="vo" items="${list}">
						 	<tr>
								<td class="review">
									<img src="images/banana.jpg">
									<label>${vo.mid }</label>
									<label>${vo.maddr }</label>
								</td>
							</tr>
							<tr>							
								<td class="review" colspan="3">
									<pre><c:out value="${vo.review}" /></pre>
								</td>
							</tr>
							<tr>
								<td class="review">	
									<label class="date">${vo.rdate }</label>
								</td>
							</tr>	
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
		</section>
	</div>
</body>
</html>