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
						<label>프로필 사진</label>
					</li>
					<li>
						<input type="file" id="input_img" />
						<div class="img_wrap">
							<img id="img"/>
						</div>
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
						<span>-</span><input type="text" name="hp2" class="hp_number" id="hp2">
						<span>-</span><input type="text" name="hp3" class="hp_number" id="hp3">
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" name="addr_num" placeholder="우편번호" id="addr1">
						<button type="button" class="btn_style" onClick="goPopup();">찾기</button>
					<li>
						<input type="text" name="addr2" placeholder="도로명주소" id="addr2">
						<input type="text" name="addr3" placeholder="상세주소" id="addr3">
					</li>
					<li>
						<button type="button" class="btn_style" id="btnJoin">회원가입하기</button>
					</li>
				</ul>
				</form>
			</div>
		</section>
	</div>
	
</body>
</html>