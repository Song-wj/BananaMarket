<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.notice_update{
		width:70%;
		margin:auto;
		margin-top:150px;
		margin-bottom:300px;
	}
	div.notice_update>section.section_notice_content>div{
		width:100%;
	}
	div.notice_update>section.section_notice_content>div>form>ul>li{
		list-style-type:none;
	}
	div.notice_update>section.section_notice_content>div>form>h1{
		font-size:35px;
		margin-top:50px;
		margin-bottom:50px;
	}
	div.notice_update>section.section_notice_content>div>form>ul{
		text-align:center;
	}
	div.notice_update>section.section_notice_content>div>form>ul>li>label{
		float:left;
		margin-left:150px;
		padding-bottom:10px;
		font-size:20px;
		font-weight:bold;
	}
	div.notice_update>section.section_notice_content>div>form>ul>li>input,
	div.notice_update>section.section_notice_content>div>form>ul>li>textarea{
		margin-left:-130px;
		width:60%;
		margin-bottom:15px;
		padding:15px 0;
		border:1px solid lightgray;
		border-radius:5px;
		text-indent:10px;
		font-size:17px;
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
	li.wbutton{
		text-align:right;
		margin-right:236px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="notice_update">
		<section class="section_notice_content">
			<div>
				<form name="notice_updateForm" action="#" method="get" class="admin_notice_update">
					<div>
						<img src="http://localhost:9000/banana/images/question.jpg" class="title">
					</div>
					<h1>자주 묻는 질문 글쓰기</h1>
					<ul>
						<li>
							<label class="utitle">제목</label>
							<input type="text" name="ntitle">
						</li>
						<li>
							<label class="utitle">내용</label>
							<textarea name="ncontent" rows="20" cols="100"></textarea>
						</li>
						<li class="wbutton">
							<button class="noticelist_btn_style">등록</button>
							<a href="admin_question_list.do"><button type="button" class="noticelist_btn_style">목록</button></a>
						</li>
					</ul>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>