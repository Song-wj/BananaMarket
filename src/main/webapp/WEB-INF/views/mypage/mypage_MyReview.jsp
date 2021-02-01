<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		
	});
		
	function review_delete(rid){
		if (confirm("정말 삭제하시겠습니가?"))
		  {
			 window.location.href="myReview_delete_proc.do?rid="+rid;
		  } 
	}
	
	
	
	function showReview(rid ,rsfile ,showImg){
		
		$("."+rid).css("display","block");
		$("#"+showImg).text("");
		var output="";
		 if(rsfile != "") {
			var sfile_list =rsfile.split(','); 
			for(var i in sfile_list){
				output = "<a href='http://localhost:9000/banana/resources/upload/"+sfile_list[i]+"' data-lightbox='example-set'><img src='http://localhost:9000/banana/resources/upload/"+sfile_list[i] +"'>"
				$("#"+showImg).append( output);
				$("#mw .fg").css("height" , "600px");
			} 
		 } 
	}
	function closeReview(rid){
		$("."+rid).css("display","none");
	}
</script>
<style>
	.mypage_review {
		text-align: center;
	}
	
	.review_change_area .review_title {
		text-align: left;
		margin-top: 50px;
		margin-left: 50px;
		font-size: 2rem;
		font-weight: bold;
	}
	
	.review_change_area div button {
		all: unset;
		font-size: 2rem;
		margin-top: 50px;
		width: 13.5rem;
		height: 7rem;
		color: #ccc;
		border-bottom: 1px solid #ccc;
		font-weight: bold;
	}
	
	.review_change_area div .review_all {
		color: black;
		border-bottom: 4px solid black;
	}
	
	.review_change_area div .review_all:active {
		background-color: #FEE500;
		opacity: 0.7;
	}
	
	.review_change_area div .review_seller {
		margin-left: -5px;
	}
	
	.mypage_review .review_all_table_area{
		display: flex;
		justify-content: center;
	}
	
	.mypage_review .review_all_table_area .review_all_table{
		border-bottom: 1px solid #ccc;
		width: 650px;
	}
	
	.mypage_review .review_all_table_area .review_all_table tr td {
		font-size: 2.1rem;
		
	}
	td.review{
		margin-top:10px;
		float:left;
	}
	td.review>img,
	#mw .fg div:nth-child(2) div:nth-child(1) img{
		width:35px;
		height:35px;
		margin-left:10px;
		border-radius:50%;
     	border:2px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
	}
	#mw .fg div:nth-child(2) div:nth-child(3) img{
	 	width:100px;
		height:100px;
		margin-left:10px;
		border:2px solid #fff;
		margin-top:10px;
	}
	td.review>label,
	#mw .fg label{
		position: relative;
        top: -11px;
        color: rgb(98,71,24);
        font-weight:550;
        font-size:20px;
	}
	td.review>pre{
		font-weight:normal;
		width:650px;
        display: -webkit-box;
   	 	-webkit-line-clamp: 3; /* 라인수 */
        -webkit-box-orient: vertical;
        word-wrap:break-word; 
        line-height: 1.2em;
        height: 3.6em; 
		overflow:hidden;
      	text-overflow:ellipsis;
		text-align:left;
		font-size: 20px;	
	}
	
	td.review>label.date{
		font-size:15px;
		color:lightgray;
		margin-right:30px;	
	}
	section.review_all_table_area{
		height:700px;
		overflow:auto;
	}
	section.review_all_table_area td.review button.review_update_btn,
	section.review_all_table_area td.review button.review_delete_btn{
		width:70px;
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		border-radius:5px;
		color:RGB(82,67,21);
		padding:10px 10px;
		font-size:13px;
		font-weight:bold;
		display:inline-block;
		vertical-align:text-top;
	}

	#mw {
		 position:fixed;
		_position:absolute;
		top:0;
		left:0;
		width:100%;
		height:100%;
		display:none;
		z-index:1;
	}
	#mw .bg {
		position:absolute;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:#000;
		opacity:.5;
		filter:alpha(opacity=50);
		z-index:2;
		}
	#mw .fg {
		position:absolute;
		top:30%;
		left:50%;
		width:450px;
		height:450px;
		margin:-100px 0 0 -200px;
		padding:20px;
		border:3px solid #ccc;
		background:#fff;
		z-index:3;
		}
	#mw .fg button{
		float:right;
		background-color:white;
		border:1px solid white;
		outline:none;
	}
	
	#mw .fg div:nth-child(2){
		margin-top:30px;
		text-align:left;
		clear:both;
	
	}
	#mw .fg div:nth-child(2) label.date{
		color:lightgray;
		margin-left:10px;
		font-size:13px;
	}
	#mw .fg pre{
		height:300px;
		border:0.5px solid black;
	}
	
</style>
</head>
<body>
	<div class="mypage_review">
		<section class="review_change_area">
			<div class="review_title">나의 후기</div>
			<div>
				<button type="button" class="review_all">내가 쓴 후기</button>
				
			</div>
		</section>
		<section class="review_all_table_area">
			<div>
			<table class="review_all_table"> 
			<c:choose >
			<c:when test="${empty list }">
					<tr>
						<td style="padding: 230px 0; color: #ccc;">내 후기가 없습니다.</td>
					</tr> 
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td class="review">
							<img src="images/banana.jpg">
							<label>${vo.mid }</label>
							<label>${vo.maddr }</label>
						</td>
					</tr>
					<tr onclick="showReview('${vo.rid}','${vo.rsfile }' ,'showImg')">
						<td class="review" colspan="3" >
							<pre><c:out value="${vo.review}" /></pre>
						</td>
					</tr>
					<tr>
						<td class="review" colspan="3">	
							<label class="date">${vo.rdate }</label>
					
							<a href="myReview_update.do?rid=${vo.rid }"><button type="button" class="review_update_btn">수정</button></a>
							<button type="button" class="review_delete_btn" onclick="review_delete('${vo.rid}')">삭제</button>
						</td>
					</tr>	
					<div class="${vo.rid }" id="mw"> 
		    		<div class="bg"><!--이란에는 내용을 넣지 마십시오.--></div>
		    		<div class="fg">
			    		<div>
			    			<button onclick="closeReview('${vo.rid}')" type="button">x</button>
			    		</div>
			    		<div>
			    			<div>
				    		   <img src="images/banana.jpg">
								<label>${vo.mid }</label>
								 <label class="date">${vo.rdate }</label>
			    			</div>
			    			<div>
			       			   <pre><c:out value="${vo.review}" /></pre>	    			
			    			</div>
			    		    <div id="showImg">
			    		    	
			    		    </div>
			    		</div>
		   			 </div>
					</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</table> 
			</div>
		</section>

	</div>
</body>
</html>