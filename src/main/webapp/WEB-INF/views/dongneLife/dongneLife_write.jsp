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
	section.section1_dongneLife_write li:nth-child(2) img {
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
			if($("#basic").val() == "none"){
				alert("게시글의 주제를 선택해주세요");
				
			}else if($("#btopic").val() == ""){
	            alert("게시글을 작성해주세요");
	            $("#btopic").focus();  
	         }else{
	        	 board_write_form.submit();
	         }
	      });
	      
	      
	      
	      $("#btitle").click(function(){
	         $("#basic").css("display","inline-block");
	      });
	      
	   
		
	})
		
		function test(){
			
			
			var fileInput = document.getElementById("input_img");
            
            var files = fileInput.files;
            var file;
             
            if(files.length>5){
            	alert("이미지는 5장까지 업로드 가능합니다!");
            	$("#input_img").val("");
            }
           /*  for (var i = 0; i < files.length; i++) {
                 
                file = files[i];
 
                alert(file.name);
            } */
	      
		}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_write">
		<form name="board_write_form" action="dongneLife_write_proc.do" method=POST id="board_write_form"  enctype="multipart/form-data">
		<section class="section1_dongneLife_write">
			<div class="write_nav">
				<ul>
					<li><input type="hidden" name="mid" value="test12345"></li>				
					<li><a href="dongneLife.do"><img src="http://localhost:9000/banana/images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li><label>동네생활 글쓰기</label></li>
					<li><button type="submit" id="board_write_btn">완료</button></li>
				</ul>
			</div>    
		</section>
		<section class="section2_dongneLife_write">
			<div class="write_topic" id="write_topic">
			
				<a href="#"><label id="btitle" >게시글의 주제를 선택해주세요.</label></a><br>
				<select id="basic" name ="btitle" style="display:none;">
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
		<section class="section3_dongneLife_write">
			<div class="write_content">
				<textarea placeholder="서초4동 우리 동네 관련된 질문이나 이야기를 해보세요." name="btopic" id="btopic"></textarea>
			</div>
		</section>
		<section class="section4_dongneLife_write">
			<div>
				<label for="input_img"><img src="http://localhost:9000/banana/images/dongneLife_inputimg.png"></label>
				<input type="file" name="file1" id="input_img"  multiple  onchange='test()'><br><br>
				
				<a href="#"><img src="http://localhost:9000/banana/images/dongneLife_locate.png">0/5</a>
			</div>
		</section>
		</form>
	</div>
	
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>