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
	div.mypage_purchased {
		width:98%;
		margin:auto;
	}
	div.mypage_purchased section.section1_purchased>div {
		padding-top:30px;
	}
	div.mypage_purchased table.mypage_table {
		width:100%; 
		padding:5px 0;
		border-bottom:1px solid gray;
	}
	div.mypage_purchased table.mypage_table td {
		width:800px;
	}
	div.mypage_purchased table.mypage_table td.tdimg {
		width:10px;
	}
	div.mypage_purchased table.mypage_table img {
		width:120px;
		height:120px;
		border-radius:10px;
	}
	div.mypage_purchased table.mypage_table span.product {
		font-size:19px;
	}
	div.mypage_purchased table.mypage_table span.locate {
		font-size:15px;
		color:gray;
	}
	div.mypage_purchased table.mypage_table span.price {
		font-weight:900;
	}
</style>
</head>
<body>
	<div class="mypage_purchased">
		<section class="section1_purchased">
			<div>
				<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="images/mypage_bananaimg.jpg"></td>
					<td><span class="product">미스치프 크롭 후드티 팝니다~</span></td>
				</tr>
				<tr>
					<td><span class="locate">역삼동  어제</span></td>
				</tr>
				<tr>
					<td><span class="price">20,000원</span></td>
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
			</div>
		</section>
		
	</div>
</body>
</html>