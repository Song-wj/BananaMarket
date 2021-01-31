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
		
		$("#section3_contract").hide();
		
		$("#contract_ing").click(function(){
			$("#section3_contract").hide();
			$("#section2_contract").toggle(1000);
			$("#contract_ing").css("color", "rgb(98,71,24)");
			$("#contract_ing").css("text-shadow", "-0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500");
			$("#contract_end").css("color", "rgb(98,71,24)");
			$("#contract_end").css("text-shadow", "none");
		});
		
		$("#contract_end").click(function(){
			$("#section2_contract").hide();
			$("#section3_contract").toggle(1000);
			$("#contract_ing").css("color", "rgb(98,71,24)");
			$("#contract_ing").css("text-shadow", "none");
			$("#contract_end").css("color", "rgb(98,71,24)");
			$("#contract_end").css("text-shadow", "-0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500");
			
		});
		

		$("#btn_delete").click(function(){
			showConfirm();
		});
		
	});
	
	function showConfirm() {
		if(confirm("정말 삭제하시겠습니까?")){
				 window.location.href="deletePage.do?pid=${vo.pid}"
		} 
	};
	
</script>
<style>
	div.mypage_contract {
		width:98%;
		margin:auto;
	}
	div.mypage_contract section.section1_contract>div {
		padding-top:20px;
		text-align:center;
	}
	div.mypage_contract section.section1_contract li a#contract_ing{
		color:rgb(98,71,24);
		text-shadow :-0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500;
	}
	
	div.mypage_contract ul.contract_nav {
		border-bottom:1px solid gray;
		padding-bottom:10px;
	}
	div.mypage_contract ul.contract_nav li {
		display:inline-block;
		padding:0 10%;
		list-style:none;
	}
	div.mypage_contract ul.contract_nav li>a {
		text-decoration:none;
	}
	div.mypage_contract table.mypage_table {
		width:100%; 
		padding:5px 0;
		border-bottom:1px solid gray;
	}
	div.mypage_contract table.mypage_table td {
		width:800px;
	}
	div.mypage_contract table.mypage_table td button {
		pisition:relative;
		background-color:rgb(251,247,242);
		border:2px solid RGB(254,229,0);
		border-radius:5px;
		padding:5px 7px;
		color:RGB(82,67,21);
		font-size:17px;
		font-weight:bold;
		width:88px;
	}
	div.mypage_contract table.mypage_table td button:hover{
		background-color:RGB(254,229,0);
	}
	div.mypage_contract table.mypage_table td button#btn_update{
		margin-left:610px;
	}
	div.mypage_contract table.mypage_table td.tdimg {
		width:10px;
		padding-left:10px;
	}
	div.mypage_contract table.mypage_table img {
		width:120px;
		height:120px;
		border-radius:10px;
	}
	div.mypage_contract table.mypage_table span.product {
		font-size:19px;
	}
	div.mypage_contract table.mypage_table span.category {
		font-size:15px;
		color:gray;
	}
	div.mypage_contract table.mypage_table span.price {
		font-weight:700;
	}
</style>
</head>
<body>
	<div class="mypage_contract">
		<section class="section1_contract">
			<div>
				<ul class="contract_nav">
					<li><a href="#" id="contract_ing">판매중</a></li>
					<li><a href="#" id="contract_end">거래완료</a></li>
				</ul>
			</div>
		</section>
		<section class="section2_contract" id="section2_contract">
		<div>
			<c:forEach var="vo"  items="${list}">
			  <div class="contract_content" onclick="location.href='productContent.do?pid=${vo.pid}'">
					<table class="mypage_table">
						<tr>
							<td rowspan="4" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}"></td>
							<td><span class="product">${vo.ptitle}</span></td>
						</tr>
						<tr>
							<td><span class="category">${vo.pcategory}</span></td> 
						</tr>
						<tr>
							<td><span class="price"> ${vo.pprice} 원</span></td>
						</tr>
						<tr>
							<td>
								<a href="updatePage.do?pid=${vo.pid}"><button type="button" id="btn_update">수 정</button></a>
								<a href="deletePage.do?pid=${vo.pid}"><button type="button" id="btn_delete">삭 제</button></a>
								<a href="#" id="sell_complete"><button type="button">판매 완료</button></a>
							</td>
						</tr> 
					</table>
			  </div> 
			</c:forEach>
		</div> 
		</section>
		<section class="section3_contract" id="section3_contract">
			<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="images/mypage_bananaimg.jpg"></td>
					<td><span class="product">칙스라벨 제이에스뉴욕 무스탕코트</span></td>
				</tr>
				<tr>
					<td><span class="locate">반포1동  끌올 49초 전</span></td>
				</tr>
				<tr>
					<td><span class="price">350,000원</span></td>
				</tr> 
			</table>
			<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="images/mypage_bananaimg.jpg"></td>
					<td>상품명</td>
				</tr>
				<tr>
					<td>지역</td>
				</tr>
				<tr>
					<td>가격</td>
				</tr> 
			</table>
		</section>
	</div>
</body>
</html>