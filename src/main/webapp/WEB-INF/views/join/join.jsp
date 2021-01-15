<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	var sel_file;
	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;				
			}
			
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<style>
	div.join{
		width:25%;
		margin:auto;
	}
	div.img_wrap>img{
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px rgb(221,221,221);
	}
	div.img_wrap{
		margin-bottom:10px;
		text-align:center;
	}
	section.section_join>div>form.join>ul>li:first-child>label{
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
		margin-left:130px;
	}
	section.section_join>div>form.join>ul>li:first-child>input[type="file"]{
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
		margin-left:-42px;
		margin-top:3px;
	}
	section.section_join>div>form.join>ul>li:first-child,
	section.section_join>div>form.join>ul>li:nth-child(3),
	section.section_join>div>form.join>ul>li:nth-child(6),
	section.section_join>div>form.join>ul>li:nth-child(9),
	section.section_join>div>form.join>ul>li:nth-child(12),
	section.section_join>div>form.join>ul>li:nth-child(14),
	section.section_join>div>form.join>ul>li:nth-child(17){
		margin-bottom:15px;
	}
	section.section_join>div>form.join>ul>li:nth-child(2),
	section.section_join>div>form.join>ul>li:nth-child(4),
	section.section_join>div>form.join>ul>li:nth-child(7),
	section.section_join>div>form.join>ul>li:nth-child(10),
	section.section_join>div>form.join>ul>li:nth-child(13),
	section.section_join>div>form.join>ul>li:nth-child(15){
		font-weight:bold;
	}
	section.section_join>div>form.join input.f1,
	section.section_join>div>form.join select.hp,
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
	
</style>
</head>
<body>

	<div class="join">
		<section class="section_join">
			<div>
				<form name="joinForm" action="join_proc.do" method="post" class="join">
				<h1>회원가입</h1>
				<ul>
					<li>
						<div class="img_wrap">
							<img src="http://localhost:9000/banana/images/bananamarket_logo.jpg" id="img" width="200px" height="200px">
						</div>
						<label for="input_img">프로필 사진 변경</label>
						<input type="file" id="input_img">
					</li>
					<li>
						<label>닉네임</label>
					</li>
					<li>
						<input type="text" name="nickname" class="f1" id="nickname">
					</li>
					<li>
						<label>아이디</label>
					</li>
					<li>
						<input type="text" name="id" class="f1" id="id">
					</li>
					<li>
						<div>영문 소문자, 숫자로 6-16자리</div>
					</li>
					<li>
						<label>비밀번호</label>
					</li>
					<li>
						<input type="password" name="pass" class="f1" id="pass">
					</li>
					<li>
						<div>영문 대/소문자 구분주의, 숫자 조합으로 6-16자리</div>
					</li>
					<li>
						<label>비밀번호 확인</label>
					</li>
					<li>
						<input type="password" name="cpass" class="f1" id="cpass">
					</li>
					<li>
						<div>비밀번호 일치여부</div>
					</li>
					<li>
						<label>휴대폰</label>
					</li>
					<li>
						<select name="hp1" class="hp" id="hp1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
						</select>
						<span>-&nbsp;</span><input type="text" name="hp2" class="hp_number" id="hp2">
						<span>-&nbsp;</span><input type="text" name="hp3" class="hp_number" id="hp3">
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" name="addr_num" placeholder="우편번호" class="addr1" id="addr1">
						<button type="button" class="btn_style" onClick="goPopup();">찾기</button>
					<li>
						<input type="text" name="addr2" placeholder="도로명주소" class="addr2" id="addr2">
						<input type="text" name="addr3" placeholder="상세주소" class="addr2" id="addr3">
					</li>
					<li>
						<button type="button" class="btn_style" id="btnJoin">회원가입</button>
					</li>
				</ul>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>