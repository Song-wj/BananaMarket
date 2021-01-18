<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.dongnelife_write {
		width: 70%;
		margin:auto;
		height: 1000px;
		padding-top:150px;
		border:1px solid green;
	}
	section.section1_dongneLife_write div.write_nav {
		border:1px solid black;
		text-align:center;
		padding:10px 0;
	}
	section.section1_dongneLife_write li {
		display:inline-block;
		padding:0 100px;
		font-size:22px;
		font-weight:800;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_write">
		<section class="section1_dongneLife_write">
			<div class="write_nav">
				<ul>
					<li><a href="dongneLife.do"><button type="button">글쓰기 취소</button></a></li>
					<li><label>동네생활 글쓰기</label></li>
					<li><a href="dongneLife_write_proc.do"><button>완료</button></a></li>
				</ul>
			</div>
		</section>
		<section class="section2_dongneLife_write">
			<div class="write_topic">
				<a href="#"><label>게시글의 주제를 선택해주세요.</label></a>
			</div>
		</section>
		<section class="section3_dongneLife_write">
			<div class="write_content">
				<textarea placeholder="서초4동 우리 동네 관련된 질문이나 이야기를 해보세요.">
				
				</textarea>
			</div>
		</section>
		<section class="section4_dongneLife_write">
			<div>
				<a href="#"><button>사진첨부</button></a>
				<a href="#"><button>동네업체 검색</button></a>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>