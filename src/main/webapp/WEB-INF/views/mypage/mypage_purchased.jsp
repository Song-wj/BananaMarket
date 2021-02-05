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
	
	div.mypage_purchased table.mypage_table td.tdimg {
		width:10px;
		padding-right:10px;
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
	div.mypage_purchased table.mypage_table button#write_btn{
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		border-radius:5px;
		padding:10px 10px;
		color:RGB(82,67,21);
		font-size:17px;
		font-weight:bold;
		width:100px;
	}
</style>
</head>
<body>
	<div class="mypage_purchased">
		<section class="section1_purchased">
			<div>
			<c:choose>
			<c:when test="${empty list }">
				<table class="mypage_table">
				   <tr>
						<td style="padding: 150px 0; color: #ccc; text-align:center;">구매 내역이 없습니다.</td>
					</tr> 
				</table>
			</c:when>
			<c:otherwise>
			 <c:forEach var="vo" items="${list }">
				<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}"></td>
					<td><span class="product">${vo.ptitle }</span></td>
					<td rowspan="3" rowspan="3" class="manner_grade">
						<!-- 매너점수를 주세요~~~<br>
						<select  name="mannerGrade" onchange="showConfirm()">
							<option value="none">선택</option>
							<option value="2">😮</option>
							<option value="1">😆</option>
							<option value="0">🙂</option>
							<option value="-1">😥</option>
							<option value="-2">😡</option>
						</select> -->
						<a href="mypage_purchase_review.do?pid=${vo.pid }"><button type ="button" id="write_btn">후기 작성</button></a>
					</td>
				</tr>
				<tr>
					<td><span class="locate">${vo.maddr}</span></td>
				</tr>
				<tr>
					<td><span class="price">${vo.pprice }</span></td>
				</tr>
			</table>
			<div></div>
			</c:forEach> 
			</c:otherwise>
			</c:choose>
			</div>
		</section>
		
	</div>
</body>
</html>