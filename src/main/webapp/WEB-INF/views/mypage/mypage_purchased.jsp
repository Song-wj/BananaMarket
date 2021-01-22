<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		/* $("select").change(function(){
			showConfirm(); */
			
		});
		
		
		 function showConfirm() {
			 if (confirm("매너점수를 입력하시겠습니까??(수정이 불가합니다)"))
			  {
			   alert("매너 점수가 입력되었습니다!");
			   $("select").attr("disabled",true);
			  } else {
			   alert("다음에 꼭 입력해주세요~");
			   $("select option:eq(0)").prop("selected", true);
			  }
			 };
		 
		 
		 
		 

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
	div.mypage_purchased table.mypage_table td.manner_grade{
		text-align:center;
	}
	div.mypage_purchased table.mypage_table td.manner_grade select{
		width:70px;
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
					<td rowspan="3" rowspan="3" class="manner_grade">
						매너점수를 주세요~~~<br>
						<select  name="mannerGrade" onchange="showConfirm()">
							<option value="none">선택</option>
							<option value="3">😮</option>
							<option value="5">😆</option>
							<option value="4">🙂</option>
							<option value="2">😥</option>
							<option value="1">😡</option>
						</select>
					</td>
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
					<td rowspan="3" rowspan="3" class="manner_grade">
						매너점수를 주세요~~~<br>
						<select name="mannerGrade" onchange="showConfirm()">
							<option value="none">선택</option>
							<option value="3">😮</option>
							<option value="5">😆</option>
							<option value="4">🙂</option>
							<option value="2">😥</option>
							<option value="1">😡</option>
						</select>
					</td>
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