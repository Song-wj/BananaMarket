<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.dongnelife_update {
		width: 70%;
		margin:auto;
		height: 1000px;
		padding-top:150px;
		border:1px solid green;
	}
	section.section2_dongneLife_update,
	section.section3_dongneLife_update,
	section.section4_dongneLife_update{
		width:45%;
		margin-left:25%;
		padding-left:4%;
		margin-bottom:40px;
	}
	section.section1_dongneLife_update div.update_nav {
		border-bottom:1px solid black;
		text-align:center;
		padding:10px 0;
	}
	section.section1_dongneLife_update li {
		display:inline-block;
		padding:0 100px;
		font-size:22px;
		font-weight:800;
	}
	section.section1_dongneLife_update li:nth-child(3) button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:7px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section1_dongneLife_update li:nth-child(3) button:hover{
		cursor:pointer;
		opacity:0.7;
	}
	section.section1_dongneLife_update li:first-child img {
		width:30px;
		height:30px;
		margin-bottom:-5px;
	}
	section.section2_dongneLife_update div.update_topic {
		padding-top:40px;
	}
	section.section2_dongneLife_update div.update_topic select{
		border:5px solid #FEE500;
		height:40px;
		width:160px;
		font-size:14px;
	}
	section.section2_dongneLife_update div.update_topic label {
		font-size:19px;
		font-weight:700;
	}
	section.section2_dongneLife_update div.update_topic label:hover {
		cursor:pointer;
	}
	section.section3_dongneLife_update div.update_content textarea {
		width:92%;
		height:600px;
		overflow:auto;
		resize: none;
		font-size:18px;
		padding:10px 10px;
	}
	section.section4_dongneLife_update a {		
		margin:auto;
	}
	section.section4_dongneLife_update img {
		width:30px;
		height:30px;
		margin-bottom:-7px;
	}
	
	form#dongneUpdateForm  section.section4_dongneLife_update label{
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
	form#dongneUpdateForm  section.section4_dongneLife_update input[type="file"]{
		position: absolute; 	
		padding: 0; 
		width:1px;
		height:1px;  
		margin-left: -80px;
		margin-top: 14px;  
	 	overflow: hidden;  
	 	clip:rect(0 180px 150px 75px);  
		border: 0; 
		
	} 
	
	form#dongneUpdateForm  section.section4_dongneLife_update span{
		display:inline-block;
		font-size:13.7px;
		width:100px;
		margin-left:-5px;
	}
	form#dongneUpdateForm  section.section4_dongneLife_update button#cancel_img{
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		border-radius:5px;
		padding:10px 15px;
		font-size:15px;
		position:absolute;
		left:1000px;

	}
</style>
<script>
$(document).ready(function(){
	$("#mannerGrade").val("${vo.score}");
	

	
	
	$("#update_myReview_btn").click(function(){

		if($("#mannerGrade").val() == "none"){
			alert("매너점수를 선택해주세요");
			
		}else if($("#preview").val() == ""){
            alert("리뷰를 작성해주세요");
            $("#breview").focus();  
         }else{
        	 update_myReivew_form.submit();
         }
      });
	
	
	   $("#cancel_img").click(function(){
		   		showConfirm();
	    	
	      })
	      
	      

})	
	
	      function showConfirm() {
			 if (confirm("사진을 삭제하시겠습니까?"))
			  {
			   alert("삭제되었습니다!");		
			   $("input[type='hidden']#cancel_img").val("cancel");
			   $("#update_img").val("")
		    	$("#fake_id").html("선택된 파일 없음");
			  } 
			 };
	
	function test(){
		
		
		var fileInput = document.getElementById("update_img");
        
        var files = fileInput.files;
        var file;
         
        if(files.length>5){
        	alert("이미지는 5장까지 업로드 가능합니다!");
        	$("#update_img").val("");
        }
        
       $("#fake_id").css("display","none");
       $("input[type='file']#update_img").css("width","400px").css("height","25px").css("font-size","13.7px"); 
	}
      
      
     
	

</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_update">
	<form name="update_myReivew_form" action="update_myReview_proc.do" method="post" id="dongneUpdateForm" enctype="multipart/form-data">
		<section class="section1_dongneLife_update">
			<input type="hidden" name="rid" value="${vo.rid }">	
			<div class="update_nav">
				<ul>
					<li><a href="mypage.do"><img src="images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li><label>리뷰 수정</label></li>
					<li><button type="button" id="update_myReview_btn">완료</button></li>
				</ul>
			</div>
		</section>
		<section class="section2_dongneLife_update">
			<div class="update_topic" id="update_topic">
			 	<label>매너점수를 주세요</label><br>
						<select  name="score"  id="mannerGrade" >
							<option value="none">선택</option>
							<option value="5">😆 (최고에요)</option>
							<option value="4">🙂 (좋아요)</option>
							<option value="3">😮 (보통이에요))</option>
							<option value="2">😥 (별로에요)</option>
							<option value="1">😡 (나빠요)</option>
						</select> 			
		</div>
		
		</section>
		<section class="section3_dongneLife_update">
			<div class="update_content">
				<textarea name="review" id="preview">${vo.review }</textarea>
			</div>
		</section>
		<section class="section4_dongneLife_update">
			<div>
				<label for="update_img"><img src="http://localhost:9000/banana/images/dongneLife_inputimg.png"></label>
				<input type="file" name="file1" id="update_img"  multiple  onchange='test()'>
				<c:choose >
					<c:when test="${count ne 0 }">
						<span id="fake_id">파일 ${count}개</span>
					</c:when>
					<c:otherwise><span id="fake_id">선택한 파일 없음</span></c:otherwise>
				</c:choose>
				<button type="button" id="cancel_img">사진 초기화</button> <input type="hidden" name="cancel_img" id="cancel_img"> 
				<br><br>
				<a href="#"><img src="http://localhost:9000/banana/images/dongneLife_locate.png">0/5</a>
			</div>
		</section>
		</form>
	</div>
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>