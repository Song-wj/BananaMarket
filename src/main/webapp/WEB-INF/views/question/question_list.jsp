<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "http://localhost:9000/banana/css/am-pagination.css">
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/banana/js/am-pagination.js"></script>  
<script>
	$(document).ready(function(){
		
		//페이지 번호 및 링크 		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,			
			totals:'${dbCount}',
			page : '${reqPage}',
			pageSize : '${pageSize}',
					
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo',
			prevTest : '&laquo;',
			nextTest : '&raquo;',
			
			btnSize : 'sm' 			
		}); 
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change',function(e){
			$(location).attr('href','http://localhost:9000/banana/question_list.do?rpage='+e.page);  
		});
		
	});
</script>
<style>
	div.notice_list{
		width:70%;
		margin:auto;
		margin-top:150px;
		margin-bottom:300px;
	}
	section.section_notice_list>div>form.notice_list>div{
		text-align:center;
		background-color:RGB(253,229,0);
	}
	section.section_notice_list>div>form.notice_list>table.notice_list{
		margin-top:50px;
		width:100%;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list,
	section.section_notice_list>div>form.notice_list>table.notice_list tr th,
	section.section_notice_list>div>form.notice_list>table.notice_list tr td{
		border:1px solid black;
		border-collapse:collapse; 
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr th,
	section.section_notice_list>div>form.notice_list>table.notice_list tr td{
		padding:8px 0;
		font-size:17px;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr th{
		border:1px solid white;
		border-bottom:3px solid RGB(82,67,21);
		border-top:3px solid RGB(82,67,21);
		padding:10px 0;
		font-size:20px;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td{
		border:2px solid white;
		background-color:rgb(251,247,242);
		text-align:center;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr.table_title{
		background-color:rgb(241,227,209);
		border:3px solid rgb(241,227,209);
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td.left:first-child{
		width:13%;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td>a.list{
		text-decoration:none;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td>a.list:hover{
		border-bottom:1px solid black;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td:nth-child(2){
		text-align:left;
		padding-left:30px;
		width:60%;
	}
	section.section_notice_list>div>form.notice_list button.noticelist_btn_style{
		pisition:relative;
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:13px 17px;
		font-size:17px;
		border-radius:5px;
		width:100px;
	}
	button.noticelist_btn_style:hover{
		opacity:0.7;
	}
	section.section_notice_list>div>form.notice_list input{
		padding:15px 0;
		border:1px solid lightgray;
		border-radius:5px;
		width:500px;
		text-indent:10px;
		font-size:17px;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td.page,
	section.section_notice_list>div>form.notice_list>table.notice_list tr td.search{
		background-color:white;
	}
	section.section_notice_list>div>form.notice_list>table.notice_list tr td.search{
		text-align:right;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="notice_list">
		<section class="section_notice_list">
			<div>
				<form name="notice_listForm" action="notice_list_proc.do" method="get" class="notice_list">
					<div>
						<img src="http://localhost:9000/banana/images/question.jpg" class="title">
					</div>
					<table class="notice_list">
			            <tr>
			            	<td colspan="4" class="search">
				            	<input type="text" placeholder="제목을 입력해주세요" id="svalue">
								<button type="button" class="noticelist_btn_style">검색</button>
							</td>
			            </tr>
			            <tr class="table_title">
			                <th>번호</th>
			                <th>제목</th>
			                <th>등록일</th>
			                <th>조회수</th>
			            </tr>
			            <c:forEach var="vo" items="${list }">
			            <tr>
			               	<td class="left">${vo.rno }</td>
			               	<td class="left"><a href="question_content.do?fid=${vo.fid }" class="list">${vo.ftitle }</a></td>
			               	<td class="left">${vo.fdate }</td>
			               	<td class="left">${vo.fhits }</td>
			            </tr>
			            </c:forEach>
			            <tr>
			            	<td colspan="4" class="page"><div id="ampaginationsm"></div></td>
			            </tr>
			        </table>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>