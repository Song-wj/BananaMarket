<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키워드 알림설정</title>
</head>
<script>
$(document).ready(function(){
	
	$("#keywordplus").click(function(){
		if($("#keyword").val() == ""){
			alert("키워드를 입력해주세요");
			$("#keyword").focus();
		}else{
			var keyword = $("#keyword").val();
			ajax_keywordplus(keyword);
			
		}
		
	});
});
function ajax_keywordplus(keyword){
	var confirmflag = confirm("키워드로 등록하시겠습니까?");
	 if(confirmflag){
		$.ajax({
			url:"keywordplus.do?keyword="+keyword,
			success:function(result){
			}
		});
				$("#keyword").val("");
				alert("키워드를 등록하였습니다");
	}
}
	
</script>
<style>
	div.mypage_keyword {
		width:98%;
		height:700px;
		margin:auto;
	}
	.keyword_title h1 {
		font-size:28px;
		margin:60px 40px;
	}
	.keyword_title span {
		font-size: 25px;
		font-weight:400;
		margin-left: 50px;
	}
	.mypage_keyword label {
		font-size:20px;
		color:rgb(98,71,24);
		margin-left: 40px;
	}
	.mypage_keyword label:hover{
		font-size:20px;
		color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
		margin-left: 40px;
	}
	.mypage_keyword input[type="text"] {
		width: 400px;
		height: 40px;
		color:rgb(98,71,24);
		margin: 30px 10px 30px 40px;
		font-size:20px;
		padding:10px 0;
		border:1px solid lightgray;
		border-radius:5px;
		text-indent:10px;
		font-size:17px;
	}
	.mypage_keyword button {
		pisition:relative;
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		padding:17px 17px;
		font-size:17px;
		font-weight:bold;
		border-radius:5px;
		width:90px;
	}
	.mypage_keyword button:hover{
		opacity:0.7;
	}
</style>
<body>
	<div class="mypage_keyword">
		<section class="section1_keyword">
			<div class="keyword_title"><h1>알림 받을 키워드<span>0/30</span></h1></div>
			<label>혹시 키워드 알림이 오지 않나요?</label><br>
				<input type="text" id="keyword" placeholder=" 키워드를 입력해주세요. (ex : 자전거)">
				<button type="button" id="keywordplus">등록</button>
				<div id="output"></div>
		</section>
		<c:forEach var="vo" items="${ list1 }">
				<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}" onclick="location.href='productContent.do?pid=${vo.pid}'"></td>
					<td><span class="product" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.ptitle }</span></td>
					<td rowspan="3">
					<button type="button" class="btn_like" id="btnLike" onclick="delProductLike('${vo.pid}')">
  							<span class="img_emoti">좋아요취소</span></button>
  					</td>
				</tr>
				<tr>
					<td><span class="locate" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.maddr }</span></td>
				</tr>
				<tr>
					<td><span class="price" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.pprice }</span></td>
				</tr>
			</table>
			</c:forEach> 
	</div>	
</body>
</html>