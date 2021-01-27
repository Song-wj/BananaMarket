<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnQuestionUpdate").click(function(){
			if($("#ftitle").val() ==""){
				alert("제목을 입력해주세요");
				$("#ftitle").focus();
			}else{
				question_updateForm.submit();
			}
		});
	});
</script>
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
	li.ubutton{
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
				<form name="notice_updateForm" action="admin_question_update_proc.do" method="post" class="admin_notice_update">
					<div>
						<img src="http://localhost:9000/banana/images/question.jpg" class="title">
					</div>
					<h1>자주 묻는 질문 수정</h1>
					<input type="hidden" name="fid" value="${vo.fid }">
					<ul>
						<li>
							<label class="utitle">제목</label>
							<input type="text" name="ftitle" value="${vo.ftitle }">
						</li>
						<li>
							<label class="utitle">내용</label>
							<textarea name="fcontent" rows="20" cols="100">${vo.fcontent }</textarea>
						</li>
						<li class="ubutton">
							<button class="noticelist_btn_style" id="btnQuestionUpdate">수정</button>
							<a href="admin_question_list.do"><button type="button" class="noticelist_btn_style">목록</button></a>
							<a href="admin_question_content.do?fid=${vo.fid }"><button type="button" class="noticelist_btn_style2">이전페이지</button></a>
						</li>
					</ul>
				</form>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>