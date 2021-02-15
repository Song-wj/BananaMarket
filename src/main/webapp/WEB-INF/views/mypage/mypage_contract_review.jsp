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
	div.dongnelife_write {
		width: 70%;
		margin:auto;
		height: 1200px;
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
	section.section1_dongneLife_write li:nth-child(3) button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:7px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section1_dongneLife_write li:nth-child(3) button:hover{
		cursor:pointer;
		opacity:0.7;
	}
	section.section1_dongneLife_write li:nth-child(1) img {
		width:30px;
		height:30px;
		margin-bottom:-5px;
	}
	section.section2_dongneLife_write div.write_topic, 
	section.section2_dongneLife_write div.write_buyer {
		padding:30px 0;
		display:inline-block;
		float:left;
		padding-right:80px;
	}
	section.section2_dongneLife_write div.write_buyer{
		
	}
	
	section.section2_dongneLife_write div.write_topic select,
	section.section2_dongneLife_write div.write_buyer select{
		border:5px solid #FEE500;
		height:40px;
		width:160px;
		font-size:14px;
	}
	section.section2_dongneLife_write div.write_topic label,
	section.section2_dongneLife_write div.write_buyer label {
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
		
		$("#contract_review_btn").click(function(){
			if($("#mannerGrade").val() == "none"){
				alert("매너점수를 선택해주세요");
				
			}else if($("#preview").val() == ""){
	            alert("리뷰를 작성해주세요");
	            $("#breview").focus();  
	         }else{
	        	 contract_reivew_form.submit();
	         }
	      });
	      
	      
	      
	     
	   
		
	})
		
		function test(){
			
			
			var fileInput = document.getElementById("review_img");
            
            var files = fileInput.files;
            var file;
             
            if(files.length>5){
            	alert("이미지는 5장까지 업로드 가능합니다!");
            	$("#review_img").val("");
            }
          
          
	      
		}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="dongnelife_write">
		<form name="contract_reivew_form" action="contract_reivew_write_proc.do" method=POST id="board_write_form"  enctype="multipart/form-data">
		<section class="section1_dongneLife_write">
			<input type="hidden" name="pid" value="${pid }"> 	
			<!-- <input type="hidden" name="mid" value="test12"> -->
			<div class="write_nav">
				<ul>				
					<li><a href="mypage.do"><img src="http://localhost:9000/banana/images/dongneLife_backword.png"><button type="button"></button></a></li>
					<li><label>판매상품 리뷰</label></li>
					<li><button type="submit" id="contact_review_btn">완료</button></li>
				</ul>
			</div>    
		</section>
		<section class="section2_dongneLife_write">
			<div class="write_buyer" id="write_buyer">
			 	<label>구매자를 선택해주세요</label><br>
						<select  name="mid" onchange="showConfirm()" id="mid">
							<option value="none">선택</option>
							<c:forEach var="vo" items="${ list}">
								<c:if test="${svo.mid ne vo.buy_mid}">
									<option  value="${ vo.buy_mid }">${ vo.buy_mid }</option>
								</c:if>
							</c:forEach>  
						</select>
			</div>
			<div class="write_topic" id="write_topic">
			 	<label>매너점수를 주세요</label><br>
						<select  name="score" onchange="showConfirm()" id="mannerGrade">
							<option value="none">선택</option>
							<option value="5">😆 (최고에요)</option>
							<option value="4">🙂 (좋아요)</option>
							<option value="3">😮 (보통이에요))</option>
							<option value="2">😥 (별로에요)</option>
							<option value="1">😡 (나빠요)</option>
						</select> 			
			</div>
		</section>
		<section class="section3_dongneLife_write">
			<div class="write_content">
				<textarea placeholder="판매상품에 대한 리뷰를 남겨주세요." name="review" id="preview"></textarea>
			</div>
		</section>
		<section class="section4_dongneLife_write">
			<div>
				<label for="input_img"><img src="http://localhost:9000/banana/images/dongneLife_inputimg.png"></label>
				<input type="file" name="file1" id="reivew_img"  multiple  onchange='test()'><br><br>
				
				<!--<a href="#"><img src="http://localhost:9000/banana/images/dongneLife_locate.png">0/5</a> -->
			</div>
		</section>
		</form>
	</div>
	
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>