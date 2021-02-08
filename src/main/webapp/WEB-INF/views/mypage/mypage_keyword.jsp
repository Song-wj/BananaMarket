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
function delkeyword(keyword) {
	var confirmflag = confirm(keyword+"키워드를 삭제하시겠습니까?");
	 if(confirmflag){
		 $.ajax({
			  url:"delkeyword.do?keyword="+keyword, //mid는 로그인한사람id
			  success:function(result){
				alert('삭제가 완료되었습니다.');
				location.reload();
			  }
			});
	 }
}
/* function clickkeyword(keyword) {
	var confirmflag = confirm(keyword+"보시겠습니까");
	 if(confirmflag){
		 $.ajax({
			  url:"mypage_keywordclick.do?keyword="+keyword, //mid는 로그인한사람id
			  success:function(result){
			  }
			});
	 }
} */
	
var goPopup = function() {
	var _width = '400';
    var _height = '330';

	var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.width - _height )/2); 

	var pop = window.open("whyPopup.do", "pop",
			"width=400,height=330, scrollbars=yes, resizable=yes") 

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
	.mypage_keyword button.keywordplus {
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
	.mypage_keyword button.keywordplus:hover{
		opacity:0.7;
	}
	div.mypage_keyword table.mypage_table {
		width:100%; 
		padding:5px 0;
		border-bottom:1px solid gray;
	}
	div.mypage_keyword table.mypage_table td {
		width:800px;
	}
	div.mypage_keyword table.mypage_table td.tdimg {
		width:10px;
		padding-right:15px;
	}
	div.mypage_keyword table.mypage_table img {
		width:120px;
		height:120px;
		border-radius:10px;
	}
	div.mypage_keyword table.mypage_table span.product {
		font-size:19px;
	}
	div.mypage_keyword table.mypage_table span.locate {
		font-size:15px;
		color:gray;
	}
	div.mypage_keyword table.mypage_table span.price {
		font-weight:900;
	}
	button.btn_like{
		pisition:relative;
		color:RGB(82,67,21);
		background-color:RGB(251,247,242);
		border:1px solid RGB(251,247,242);
		padding:3px 5px;
		font-size:17px;
		border-radius:5px;
		text-decoration:underline
	}
	button.btn_like:hover{
		font-weight:bold;
	}
</style>
<body>
	<div class="mypage_keyword">
		<section class="section1_keyword" id="section1_keyword">
			<div class="keyword_title"><h1>알림 받을 키워드</h1></div>
			<label onclick="goPopup()">혹시 키워드 알림이 오지 않나요?</label><br>
				<input type="text" id="keyword" placeholder=" 키워드를 입력해주세요. (ex : 자전거)">
				<button type="button" id="keywordplus" class="keywordplus">등록</button>
				<div id="output">등록된 키워드(클릭하여 삭제) : 
				<c:forEach var="vo" items="${list2 }">
					<button type="button" class="btn_like" id="keyword" onclick="delkeyword('${vo.keyword }')">
	  							<span class="img_emoti">#${vo.keyword }</span></button>
				</c:forEach>
				</div>
		</section>
		<section class="section2_keyword" id="section2_keyword">
			<table class="mypage_table">
				<c:choose >
					<c:when test="${empty list1 }">
						<tr>
							<td style="padding: 50px 0; text-align:center;"><h3>검색된 키워드가 없습니다</h3></td>
						</tr> 
					</c:when>
				<c:otherwise>
					<c:forEach var="vo" items="${ list1 }">
					<tr>
						<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}" onclick="location.href='productContent.do?pid=${vo.pid}'"></td>
						<td><span class="product" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.ptitle }</span></td>
					</tr>
					<tr>
						<td><span class="locate" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.maddr }</span></td>
					</tr>
					<tr>
						<td><span class="price" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.pprice }</span></td>
					</tr>
					</c:forEach> 
				</c:otherwise>
				</c:choose>
				</table>
		</section>
	</div>	
</body>
</html>