<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		$("#section3_contract").hide();
		$("#section4_contract").hide();
		
		$("#contract_ing").click(function(){
			$("#section3_contract").hide();
			$("#section4_contract").hide();
			$("#section2_contract").toggle(1000);
		});
		
		$("#contract_end").click(function(){
			$("#section2_contract").hide();
			$("#section4_contract").hide();
			$("#section3_contract").toggle(1000);
		});
		
		$("#contract_hide").click(function(){
			$("#section2_contract").hide();
			$("#section3_contract").hide();
			$("#section4_contract").toggle(1000);
		});
	});
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
	div.mypage_contract table.mypage_table td.tdimg {
		width:10px;
	}
	div.mypage_contract table.mypage_table img {
		width:120px;
		height:120px;
		border-radius:10px;
	}
	div.mypage_contract table.mypage_table span.product {
		font-size:19px;
	}
	div.mypage_contract table.mypage_table span.locate {
		font-size:15px;
		color:gray;
	}
	div.mypage_contract table.mypage_table span.price {
		font-weight:900;
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
					<li><a href="#" id="contract_hide">숨김</a></li>
				</ul>
			</div>
		</section>
		<section class="section2_contract" id="section2_contract">
			<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="images/mypage_bananaimg.jpg"></td>
					<td><span class="product">이솝 핸드크림(새상품)</span></td>
				</tr>
				<tr>
					<td><span class="locate">논현1동  끌올 6시간 전</span></td>
				</tr>
				<tr>
					<td><span class="price">49,000원</span></td>
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
		<section class="section4_contract" id="section4_contract">
			<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="images/mypage_bananaimg.jpg"></td>
					<td><span class="product">슈콤마보니 부츠 235(365)</span></td>
				</tr>
				<tr>
					<td><span class="locate">서초1동  35초 전</span></td>
				</tr>
				<tr>
					<td><span class="price">85,000원</span></td>
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