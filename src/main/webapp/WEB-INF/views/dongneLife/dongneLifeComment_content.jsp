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
		$("#updateBtn").click(function(){
			if($("#bcomment").val() == "") {
				alert("댓글을 입력해주세요");
				return false;
			}else {
				comment_update_form.submit();
			}
		});
	});
</script>
<style>
	textarea {
		width:700px;
		height:50px;
		resize:none;
		overflow:auto;
	}
</style>
</head>
<body>
	<form name="comment_update_form" action="comment_update_proc.do?bstitle=${bstitle }" method=POST id="comment_update_form" enctype="multipart/form-data">
		<input type="hidden" name="brid" value="${vo.brid }">
		<div><textarea name="bcomment" id="bcomment">${vo.bcomment }</textarea></div>
		<div><button type="button" id="updateBtn">수정완료</button></div>
	</form>
</body>
</html>