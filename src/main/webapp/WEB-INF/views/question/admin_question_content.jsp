<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.notice_content{
		width:70%;
		margin:auto;
		margin-top:150px;
		margin-bottom:300px;
	}
	section.section_notice_content>div>form.notice_content>div{
		text-align:center;
		background-color:RGB(253,229,0);
	}
	section.section_notice_content>div>form.notice_content>table.notice_content{
		margin-top:50px;
		width:100%;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content,
	section.section_notice_content>div>form.notice_content>table.notice_content tr th,
	section.section_notice_content>div>form.notice_content>table.notice_content tr td{
		border:1px solid black;
		border-collapse:collapse; 
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr th,
	section.section_notice_content>div>form.notice_content>table.notice_content tr td{
		padding:8px 0;
		font-size:17px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr th{
		border:1px solid white;
		border-bottom:3px solid RGB(82,67,21);
		border-top:3px solid RGB(82,67,21);
		padding:10px 0;
		font-size:35px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td{
		border:2px solid white;
		background-color:rgb(251,247,242);
		text-align:center;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.right{
		text-align:right;
		padding-right:80px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr.table_title{
		background-color:rgb(241,227,209);
		border:3px solid rgb(241,227,209);
		height:120px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.button,
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.up,
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.down{
		background-color:white;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.up,
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.down{
		text-align:left;
		padding-left:50px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.up{
		border-bottom:2px solid lightgray;
		border-top:3px solid lightgray;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.down{
		border-bottom:3px solid lightgray;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.button{
		text-align:right;
		padding-bottom:100px;
	}
	section.section_notice_content>div>form.notice_content>table.notice_content tr td.content{
		text-align:left;
		font-size:23px;
		padding-left:50px;
		padding-right:50px;
		padding-top:30px;
		padding-bottom:50px;
	}
	section.section_notice_content>div>form.notice_content button.noticelist_btn_style{
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
	a.list{
		text-decoration:none;
	}
	span.none{
		opacity:0.7;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="notice_content">
		<section class="section_notice_content">
			<div>
				<form name="notice_contentForm" action="notice_content_proc.do" method="post" class="notice_content">
					<div>
						<img src="http://localhost:9000/banana/images/question.jpg" class="title">
					</div>
					<table class="notice_content">
						<tr class="table_title">
							<th>${vo.ftitle }</th>
						</tr>
						<tr>
							<td class="right">
								<img src="http://localhost:9000/banana/images/eye_icon.png">&nbsp;${vo.fhits } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img src="http://localhost:9000/banana/images/date_icon.png">&nbsp;${vo.fdate }
							</td>
						</tr>
						<tr>
							<td class="content">
								${vo.fcontent }
							</td>
						</tr>
						<tr>
							<td class="button">
								<a href="admin_question_update.do?fid=${vo.fid }"><button type="button" class="noticelist_btn_style">수정</button></a>
								<a href="admin_question_delete.do?fid=${vo.fid }"><button type="button" class="noticelist_btn_style">삭제</button></a>
								<a href="admin_question_list.do"><button type="button" class="noticelist_btn_style">목록</button></a>
							</td>
						</tr>
						<tr>
							<td class="up">
								<img src="http://localhost:9000/banana/images/page_up.png">&nbsp;이전글&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${ pre.ftitle eq null}">
										<span class="none">이전글이 없습니다.</span>
									</c:when>
									<c:otherwise>
										<a href="admin_question_content.do?fid=${pre.fid }" class="list">${pre.ftitle }</a>
									</c:otherwise>
								</c:choose>
								
							</td>
						</tr>
						<tr>
							<td class="down">
								<img src="http://localhost:9000/banana/images/page_down.png">&nbsp;다음글&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${ next.ftitle eq null}">
										<span class="none">다음글이 없습니다.</span>
									</c:when>
									<c:otherwise>
										<a href="admin_question_content.do?fid=${next.fid }" class="list">${next.ftitle }</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>