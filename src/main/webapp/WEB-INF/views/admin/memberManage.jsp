<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.member-list-content {
		width: 70%;
		margin-top: 150px;
		margin-left: 280px;
		text-align: center;
	}
	
	.table-title {
		font-size: 40px;
		color: #FEE500;
		background-color: #666;
	}
	
	.member-list-content div.table-content {
		height: 500px;
	}
	
	.member-list-content div table {
		width: 100%;
		font-size: 20px;
		border-spacing: 0 20px;
	}
	
	.member-list-content div table th {
		border-top: 2px solid #666;
		border-bottom: 2px solid #666;
		padding: 20px 0;
	}
	
	.member-list-content div table td {
		border-bottom: 1px solid #ccc;
		padding: 20px 0;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section class="member-list-content">
		<div class="table-title">회원 관리</div>		
		<div class="table-content">
			<table>
				<tr class="table-header">
					<th>회원 아이디</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>주소</th>
					<th>가입날짜</th>
				</tr>
				<c:forEach var="vo" items="${ list }">
				<tr class="table-body">
					<td>${ vo.mid }</td>
					<td>${ vo.nickname }</td>
					<td>${ vo.ph }</td>
					<td>${ vo.maddr }</td>
					<td>${ vo.mdate }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>