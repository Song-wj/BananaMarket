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
	$("#basic").val("${vo.btitle}");
	

	
	
	$("#board_update_btn").click(function(){

		if($("#basic").val() == "none"){
			alert("게시글의 주제를 선택해주세요");
			
		}else if($("#btopic").val() == ""){
            alert("게시글을 작성해주세요");
            $("#btopic").focus();  
         }else{

        	 dongneUpdateForm.submit();
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
	<form name="dongneUpdateForm" action="dongneLife_update_proc.do" method="post" id="dongneUpdateForm" enctype="multipart/form-data">
		<section class="section1_dongneLife_update">
			<div class="update_nav">
				<ul>
					<li><a href="dongneLife_content.do"><img src="images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li><label>동네생활 글수정</label></li>
					<li><button type="button" id="board_update_btn">완료</button></li>
				</ul>
			</div>
		</section>
		<section class="section2_dongneLife_update">
			<div class="update_topic">
				<input type="hidden" value="${vo.bid }" name="bid">
				<a href="#"><label>게시글의 주제를 선택해주세요.</label></a> <br>
				<select id="basic" name ="btitle" >
	               <option value="none" >=== 선택 ===</option>
	               <option value="none" style="color:blue;" disabled>동네 기본주제</option>
	               <option value="동네사건사고">동네사건사고</option>
	               <option value="분실/실종센터">분실/실종센터</option>
	               <option value="우리동네질문">우리동네질문</option>
	               <option value="none" style="color:blue;" disabled>관심주제</option>
	               <option value="일상">일상</option>
	               <option value="동네소식">동네소식</option>
	               <option value="동네맛집">동네맛집</option>
	               <option value="우리동네사진전">우리동네사진전</option>
	               <option value="취미/자기계발">취미/자기계발</option>
	               <option value="겨울간식대전">겨울간식대전</option>
	               <option value="강아지">강아지</option>
	               <option value="고양이">고양이</option>
	               <option value="건강">건강</option>
	               <option value="살림/청소/정리">살림/청소/정리</option>
	               <option value="집꾸미기">집꾸미기</option>
	               <option value="아이교육/학원">아이교육/학원</option>
	               <option value="동네카페">동네카페</option>
	               <option value="식물">식물</option>
	               <option value="임신/출산/육아">임신/출산/육아</option>
	               <option value="기타">기타</option>                        
            </select>
			</div>
		</section>
		<section class="section3_dongneLife_update">
			<div class="update_content">
				<textarea name="btopic" id="btopic">${vo.btopic }</textarea>
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