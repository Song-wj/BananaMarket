<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	section.section_notice_content>div>form.notice_deleteForm>div{
		text-align:center;
		background-color:RGB(253,229,0);
	}
	table.admin_notice_delete{
		margin-top:10px;
		width:100%;
	}
	td.real>h1{
		text-align:center;
		font-size:28px;
	}
	td.button{
		text-align:center;
	}
	td.trash{
		text-align:center;
		padding:30px 0;
	}
	button.noticelist_btn_style,
	button.noticelist_btn_style2{
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
	button.noticelist_btn_style2{
		width:140px;
	}
	button.noticelist_btn_style:hover,
	button.noticelist_btn_style2:hover{
		opacity:0.7;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="notice_content">
		<section class="section_notice_content">
			<div>
				<form name="notice_deleteForm" action="admin_notice_delete_proc.do" method="get" class="admin_notice_delete">
					<div>
						<img src="http://localhost:9000/banana/images/notice.jpg" class="title">
					</div>
					<table class="admin_notice_delete">
						<tr>
							<td class="real"><h1>이 공지사항을 삭제하시겠습니까?</h1></td>
						</tr>
						<tr>
							<td class="trash">
								<img src="http://localhost:9000/banana/images/trash.png" class="trash">
							</td>
						</tr>
						<tr>
							<td class="button">
								<a href="admin_notice_delete_proc.do?nid=${nid }"><button type="button" class="noticelist_btn_style">삭제</button></a>
								<a href="admin_notice_list.do"><button type="button" class="noticelist_btn_style">목록</button></a>
								<a href="admin_notice_content.do?nid=${nid }"><button type="button" class="noticelist_btn_style2">이전페이지</button></a>
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