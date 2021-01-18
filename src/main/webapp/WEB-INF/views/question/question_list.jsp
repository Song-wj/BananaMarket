<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			            <tr>
			               	<td class="left">1</td>
			               	<td class="left"><a href="question_content.do">질문</a></td>
			               	<td class="left">2021.01.15</td>
			               	<td class="left">3134</td>
			            </tr>
			            <tr>
			               	<td class="left">1</td>
			               	<td class="left">질문</td>
			               	<td class="left">2021.01.15</td>
			               	<td class="left">3134</td>
			            </tr><tr>
			               	<td class="left">1</td>
			               	<td class="left">질문</td>
			               	<td class="left">2021.01.15</td>
			               	<td class="left">3134</td>
			            </tr><tr>
			               	<td class="left">1</td>
			               	<td class="left">질문</td>
			               	<td class="left">2021.01.15</td>
			               	<td class="left">3134</td>
			            </tr><tr>
			               	<td class="left">1</td>
			               	<td class="left">질문</td>
			               	<td class="left">2021.01.15</td>
			               	<td class="left">3134</td>
			            </tr>
			            <tr>
			            	<td colspan="4" class="page">1 2 3 4 5</td>
			            </tr>
			        </table>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>