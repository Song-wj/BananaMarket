<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.content{
		width:50%;
		margin:auto;
		margin-top:150px;
		margin-bottom:150px;
		text-align:center;
	}
	div.content img.delete_img{
		width:250px;
		height:250px;
		margin-top:50px;
		margin-bottom:50px;
	}
	div.content button.pdelete_btn,
	div.content button.plist_btn{
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:13px 17px;
		font-size:17px;
		border-radius:5px; 
		cursor:pointer;
	}
</style>
<script>
	$(document).ready(function(){
		$("#btn_delete").click(function(){
			showConfirm();
		});
	
		function showConfirm() {
		if(confirm("정말 삭제하시겠습니까?")){
				 window.location.href="mypage.do"
			} 
		};
	
});	
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content">
		<form name="product_deleteForm" action="mypage.do" method="get" class="product_delete">
			<h1>등록 상품 삭제하기</h1>
			<img src="images/deleteimg.png" class="delete_img"><br>
			<button type="submit" class="pdelete_btn" id="pdelete_btn">삭제하기</button>
			<a href="mypage.do"><button type="button" class="plist_btn">목록으로</button></a>
		</form>	
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>