<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.dongnelife_write {
		width: 70%;
		margin:auto;
		height: 1000px;
		padding-top:150px;
		border:1px solid green;
	}
	section.section2_dongneLife_write,
	section.section3_dongneLife_write,
	section.section4_dongneLife_write{
		width:45%;
		margin-left:25%;
		padding-left:4%;
		margin-bottom:40px;
	}
	section.section1_dongneLife_write div.write_nav {
		border-bottom:1px solid black;
		text-align:center;
		padding:10px 0;
		margin-bottom:80px;
	}
	section.section1_dongneLife_write li {
		display:inline-block;
		padding:0 100px;
		font-size:22px;
		font-weight:800;
	}
	section.section1_dongneLife_write li:nth-child(4) button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:7px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section1_dongneLife_write li:nth-child(4) button:hover{
		cursor:pointer;
		opacity:0.7;
	}
	img.backword {
		width:30px;
		height:30px;
		margin-bottom:-5px;
	}
	section.section2_dongneLife_write div.write_topic {
		padding-top:40px;
	
	}
	section.section2_dongneLife_write div.write_topic select{
		border:5px solid #FEE500;
		height:40px;
		width:160px;
		font-size:14px;
	}
	section.section2_dongneLife_write div.write_topic label {
		font-size:19px;
		font-weight:700;
	}
	section.section2_dongneLife_write div.write_topic label:hover {
		cursor:pointer;
	}
	section.section3_dongneLife_write div.write_content textarea {
		width:92%;
		height:600px;
		overflow:auto;
		resize: none;
		font-size:18px;
		padding:10px 10px;
	}
	section.section4_dongneLife_write a {
		margin:auto;
	}
	section.section4_dongneLife_write img {
		width:30px;
		height:30px;
		margin-bottom:-7px;
	}form#board_write_form  section.section4_dongneLife_write label{
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em;
		margin-right:10px;
	}
	form#board_write_form  section.section4_dongneLife_write input[type="file"]{
		position: absolute; 
	   /*  width: 1px; 
		height: 1px;  */
		padding: 0; 
		margin-left: -80px;
		margin-top: 10px;  
	 	overflow: hidden;  
	 	clip:rect(0 180px 150px 75px);  
		border: 0; 
	} 
</style>

<script>
	$(document).ready(function(){
		$("#board_write_btn").click(function(){
			if($("#srcontent").val() == ""){
	            alert("후기를 작성해주세요");
	            $("#srcontent").focus();  
	         }else{
	        	 review_write_form.submit();
	         }
	      });
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_write">
		<form name="review_write_form" action="neighborStoreReview_write_proc.do?sid=${sid }&mid=${mid }" method=POST id="board_write_form"  enctype="multipart/form-data">
		<section class="section1_dongneLife_write">
			<div class="write_nav">
				<ul>
					<li><a href="neighborhoodStore.do?sid=${sid }"><img src="http://localhost:9000/banana/images/dongneLife_backword.png" class="backword"><button type="button"></button></a></li>
					<li><label>추천 후기 작성하기</label></li>
					<li><button type="button" id="board_write_btn">완료</button></li>
				</ul>
			</div>    
		</section>
		<section class="section3_dongneLife_write">
			<div class="write_content">
				<textarea placeholder="여기에 후기를 남겨주세요." name="srcontent" id="srcontent"></textarea>
			</div>
		</section>
		</form>
	</div>
	
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>