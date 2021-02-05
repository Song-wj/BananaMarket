<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.join{
		width:25%;
		margin:auto;
		margin-top:150px;
		margin-bottom:300px;
	}
	div.img_wrap>img{
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px yellow;
		margin-bottom:10px;
		margin-left:-16px;
	}
	div.img_wrap{
		margin-bottom:10px;
		text-align:center;
	}
	section.section_join>div>form.join>h1{
		font-size:28px;
		margin-bottom:40px;
		margin-left:-10px;
	}
	section.section_join>div>form.join>ul>li:nth-child(1)>div:first-child>label,
	section.section_join>div>form.join>ul>li:nth-child(15)>div:first-child>label{
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em;
		/* margin-left:130px; */ /* 75%일때 */
		margin-bottom:20px;
	}
	section.section_join>div>form.join>ul>li:nth-child(1)>div:first-child>input[type="file"],
	section.section_join>div>form.join>ul>li:nth-child(15)>div:first-child>input[type="file"] {
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0;
	}
	section.section_join>div>form.join>ul>li{
		list-style-type:none;
		margin-left:-7px;
		margin-top:3px;
	}
	section.section_join>div>form.join>ul>li:nth-child(3),
	section.section_join>div>form.join>ul>li:nth-child(5),
	section.section_join>div>form.join>ul>li:nth-child(7),
	section.section_join>div>form.join>ul>li:nth-child(10),
	section.section_join>div>form.join>ul>li:nth-child(12),
	section.section_join>div>form.join>ul>li:nth-child(14),
	section.section_join>div>form.join>ul>li:nth-child(15) {
		margin-bottom:15px;
	}
	section.section_join>div>form.join>ul>li:nth-child(2),
	section.section_join>div>form.join>ul>li:nth-child(4),
	section.section_join>div>form.join>ul>li:nth-child(6),
	section.section_join>div>form.join>ul>li:nth-child(8),
	section.section_join>div>form.join>ul>li:nth-child(11),
	section.section_join>div>form.join>ul>li:nth-child(13),
	section.section_join>div>form.join>ul>li:nth-child(16){
		font-weight:bold;
	}	
	section.section_join>div>form.join textarea.f1,
	section.section_join>div>form.join input.f1,
	section.section_join>div>form.join select.hp,
	section.section_join>div>form.join select.storekind,
	section.section_join>div>form.join input.hp_number,
	section.section_join>div>form.join input.addr1,
	section.section_join>div>form.join input.addr2{
		padding:15px 0;
		border:1px solid lightgray;
		border-radius:5px;
		width:100%;
		text-indent:10px;
		font-size:17px;
	}
	section.section_join>div>form.join select.storekind{
		width:30%;
	}
	section.section_join>div>form.join select.hp,
	section.section_join>div>form.join input.hp_number{
		width:20%;
	}
	section.section_join>div>form.join input.addr1{
		width:30%
	}
	section.section_join>div>form.join input.addr2{
		width:48.8%
	}
	section.section_join>div>form.join button.join_btn_style{
		position:relative;
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:15px 17px;
		font-size:17px;
		border-radius:5px;
	}
	section.section_join>div>form.join button.join_btn_style:hover{
		opacity:0.7;
	}
	section.section_join>div>form.join button.join_btn_style:nth-child(2){
		position: relative;
	}
	section.section_join>div>form.join button.join_btn_style:first-child{
		margin-top:30px;
		width:100%;
	}
	
	.subject-list table{
		border-top: 2px solid #FEE500;
		border-bottom: 2px solid #FEE500;
		width: 100%;
		font-size: 20px;
		border-spacing: 0 20px;
	}
	
	.subject-list table tr td button {
		all: unset;
		padding: 5px;
		background-color: #666;
		color: #FEE500;
		font-size: 20px;
		border-radius: 10px;
	}
	
	.subject-list table tr td button:active {
		opacity: 0.6;
	}
	
	.subject-list-head th{
		border-bottom: 2px solid #FEE500;
		padding-bottom: 20px;
	}
	
	.subject-list-body td {
		border-bottom: 1px solid #ccc;
		padding-bottom: 10px;
	}
	
	.modal {
         box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         height: 100%;
         display: flex;
         justify-content: center;
         align-items: center;
     }

     .modal_overlay {
         background-color: rgba(0, 0, 0, 0.6);
         width: 100%;
         height: 100%;
         position: absolute;
     }

     .modal_content {
         position: relative;
         background-color: white;
         padding: 30px 0;
         text-align: center;
         top: 125px;
         left: 35%;
         box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
         border-radius: 10px;
         width: 30%;
         height: 650px;
         font-size: 20px;
     }
     
     .modal_content label:active {
     	opacity: 0.6;
     }
     
     .modal_content ul {
     	list-style: none;
     }
     
     .hidden {
         display: none;
     }
     
     .modal_content #subjectUpdateBtn {
     	all:unset; width:400px; height: 50px; background-color: #FEE500; color: #666;
		font-size: 20px; font-weight: bold;
     }
     
     .modal_content #subjectUpdateBtn:active {
     	opacity: 0.6;
     }
</style>
<script>
	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
		
		$("#subjectEnrollBtn").click(function() {
			if($("#bstitle").val() == "") {
				alert("동네생활 주제를 입력해주세요.");
				$("#bstitle").focus();
				return false;
			}else if($("#bstopic").val() == 'select') {
				alert("주제 분류를 선택해주세요.");
				return false;
			}else {
				dongne_subject_update.submit();
			} 
		});
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="join">
		<section class="section_join">
			<div>
				<form name="dongne_subject_update" action="dongne_subject_update_proc.do" method="post" 
				class="join" enctype="multipart/form-data">
				<input type="hidden" name="bsid" value="${ vo.bsid }">
				<h1>동네생활 주제 관리</h1>
				<ul>
					<li>
						<div id="inputMain" style="text-align: center;">
							<img src="http://localhost:9000/banana/resources/upload/${ vo.bssfile }"
									id="img" width="400px" height="300px" style="border:2px solid #FFE500;
									padding: 30px; border-radius: 10px"><br>
							<label for="input_img">이미지 추가</label>
							<input type="file" id="input_img" name="file1">
						</div>
		    		</li>	
					<li>
						<label>동네생활 주제</label>
					</li>
					<li>
						<input type="text" name="bstitle" class="f1" id="bstitle" value="${ vo.bstitle }">
					</li>
					<li>
						<label>주제 분류</label>
					</li>
					<li>
						<select name="bstopic" class="storekind" id="bstopic">
							<option style="color:blue;"value="${ vo.bstopic }">${ vo.bstopic }</option>
							<option value="select">선택해주세요</option>
							<option value="동네 기본주제">동네 기본주제</option>
							<option value="관심주제">관심주제</option>
						</select>
					</li>
					<li>
						<button type="button" class="join_btn_style" id="subjectEnrollBtn">수정</button>
					</li>
				</ul>
				</form>
			</div>
		</section>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>