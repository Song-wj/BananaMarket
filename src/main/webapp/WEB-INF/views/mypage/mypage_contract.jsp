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
			showConfirm(pid);
		});
		
		/* $("#btn_sellcomplete").click(function(){
			ConfirmSell(pid);
		}); */
		
	});
	
	function showConfirm(pid) {
		var doDelete = confirm("정말로 삭제하시겠습니까?");
			if(doDelete) {
				$.ajax({
					url : 'deletePage.do?pid='+pid,
					success: function(result){
						if(result) {
							console.log("delete success");
						} else {
							console.log("delete fail");
						}
					}
				 });
				alert("삭제가 완료되었습니다.");
				location.href='mypage.do?'
			} else {
				alert("삭제를 취소했습니다.");
			}
		}
	
	function ConfirmSell(pid) {
		var doConfirm = confirm("해당 상품을 정말로 판매 완료했습니까?");
			if(doConfirm) {
				alert("리뷰 작성 페이지로 넘어갑니다.");		
				$(location).attr('href','mypage_contract_review.do?pid='+pid);
			} else {
				alert("취소했습니다.");
			}
		}
	
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
		padding-right:10px;
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
	div.mypage_contract table.mypage_table button#write_btn{
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		border-radius:5px;
		padding:10px 10px;
		color:RGB(82,67,21);
		font-size:17px;
		font-weight:bold;
		width:100px;
		margin-left:350px;
	}
</style>
</head>
<body>
	<div class="mypage_contract">
		<section class="section1_contract">
			<div>
				<ul class="contract_nav">
					<li><a href="#" id="contract_ing">판매중</a></li>
					<li><a href="#" id="contract_end">판매 완료</a></li>
				</ul>
			</div>
		</section>
		<section class="section2_contract" id="section2_contract">
		<div>
			<c:choose>
			<c:when test="${empty list }">
				<table class="mypage_table">
				   <tr>
						<td style="padding: 150px 0; color: #ccc; text-align:center;">판매 내역이 없습니다.</td>
					</tr> 
				</table>
			</c:when>
			<c:otherwise>
			<c:forEach var="vo"  items="${list}">
			   <c:if test="${vo.pchk eq 'x' && vo.mid eq svo.mid}">
				  <div class="contract_content">
						<table class="mypage_table">
							<tr onclick="location.href='productContent.do?pid=${vo.pid}'">
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
									<button type="button" id="btn_delete" onclick="showConfirm('${vo.pid}')">삭 제</button>
									<button type="button" id="btn_sellcomplete" onclick="ConfirmSell('${vo.pid}')">판매 완료</button>
								</td>
							</tr> 
						</table>
				  </div> 
			   </c:if>
			</c:forEach>
			  </c:otherwise>
			   </c:choose>
		</div> 
		</section>
		<section class="section3_contract" id="section3_contract">
		  <div>
		  	<c:forEach var="vo"  items="${list}">
		  		<c:if test="${vo.pchk eq 'o' && vo.mid eq svo.mid}">
					<table class="mypage_table">
						<tr>
							<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}"></td>
							<td><span class="product">${vo.ptitle} </span></td>
							<td rowspan="3" rowspan="3" class="manner_grade">
								<a href="mypage_contract_review.do"><button type ="button" id="write_btn">후기 작성</button></a>
							</td>
						</tr>
						<tr>
							<td><span class="category">${vo.pcategory}</span></td>
						</tr>
						<tr>
							<td><span class="price">${vo.pprice } 원</span></td>
						</tr> 
					</table>
				</c:if>
			</c:forEach>
		  </div>
		</section>
	</div>
</body>
</html>