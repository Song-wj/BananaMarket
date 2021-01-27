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
	var nickChkNum = 0;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);

		var id_chk = /(?=.*[a-zA-z])(?=.*[0-9]).{6,16}$/;
		var pass_chk = /(?=.*\d{1,15})(?=.*[~`!@#$%\^&*()-+=]{1,15})(?=.*[a-zA-Z]{2,15}).{6,16}$/;
		var idChkNum = 0;
		var passChkNum = 0;
		$("#btnJoin").click(function() {
			if (!nicknameCheck($("#nickname").val())) {
				return false;
			} else if (!idCheck($("#mid").val(), id_chk)) {
				return false;
			} else if (!passCheck($("#pass").val(), pass_chk)) {
				return false;
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인을 입력해주세요.");
				return false;
			} else if (!phoneCheck()) {
				return false;
			} else if ($("#addr1").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#addr1").focus();
				return false;
			} else if ($("#addr2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#addr2").focus();
				return false;
			} else if ($("#addr3").val() == "") {
				alert("주소를 입력해주세요.");
				$("#addr3").focus();
				return false;
			} else {
				if(passChkNum == 0) 
					alert("환영합니다! "+$("#nickname").val()+"님, 회원가입을 축하합니다.");
					joinForm.submit();
			}

	});

		$("#pass").change(function() {
			if ($("#cpass").val() != "") {
				if ($(this).val() != $("#cpass").val()) {
						$("#pass-chk-msg").text("비밀번호가 다릅니다.").css("font-size",	"16px").css("color","rgb(200, 10, 30)");
						$("#cpass").focus();
						passChkNum = 1;
				}
			}
		});

		$("#cpass").focusout(function() {
			if ($("#pass").val() != "") {
				if ($("#pass").val() == $(this).val()) {
					$("#pass-chk-msg").text("사용가능합니다.").css("font-size","16px").css("color","blue");													$("#hp1").focus();
				} else {
					$("#pass-chk-msg").text("비밀번호가 다릅니다.").css("font-size","16px").css("color","rgb(200, 10, 30)");
					$(this).val("");
					$("#pass").focus();
				}
			}
		});
		
 		$("#nickname").focusout(function(){
 			if ($("#nickname").val() != "") {
 				nick_repetition_chk($("#nickname").val());
 			}
		}); 	  
		
 		$("#mid").focusout(function(){
 			if(nickChkNum != 0) {
	 			if(idCheck($("#mid").val(), id_chk)) {
	 				id_repetition_chk($("#mid").val());
	 			} 
 			} else {
 				$("#nickname").focus();
 			}
 		});  
 		
	});//ready

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

 	function idCheck(id, chk) {
		if (id == "") {
			alert("아이디를 입력해주세요.");
			$("#mid").focus();
			return false;
		}  else {
			if(chk.test(id)) {
				return true;
			} else {
				alert("6-16자리의 영문, 숫자 조합으로 구성해주세요.");
				$("#mid").focus();
				return false;
			} 
		}
	}  
 	
 	function id_repetition_chk(id) {
 		$.ajax({
			url:"idCheck_proc.do?id="+id,
			type: "POST",
			success:function(cnt) {
				if(cnt == 0) {
					$("#id-chk-msg").text("사용가능한 아이디입니다.").css("font-size","16px").css("color","blue");
				} else {
					$("#id-chk-msg").text("이미 사용중인 아이디입니다.").css("font-size","16px").css("color","rgb(200, 10, 30)");
				}
			}
		});
 	} 
 	
 	function nicknameCheck(nick) {
 		if(nick == "") {
 			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
 			return false;
 		} else {
			return true;
 		}
 	}
 	
 	function nick_repetition_chk(nick) {
 		$.ajax({
				url: "nickCheck_proc.do?nickname="+nick,
				type: "POST",
				success: function(cnt) {
					if(cnt == 0) {
					$("#nickname-chk-msg").text("사용가능한 닉네임입니다.").css("font-size","16px").css("color","blue");
					nickChkNum = 1;
				} else {
					$("#nickname-chk-msg").text("이미 사용중인 닉네임입니다.").css("font-size","16px").css("color","rgb(200, 10, 30)");
					$("#nickname").focus();
				}
			}
		}); 
 		return nickChkNum;
 	} 
 	
 	function passCheck(pass, chk) {
		if (pass == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").val();
			return false;
		} else {
			if (chk.test(pass)) {
				return true;
			} else {
				alert("6-16자리의 영문, 숫자, 특수문자 조합으로 구성해주세요.");
				$("#pass").focus();
			}
		}
	}

	function phoneCheck() {
		var ph1 = $("#hp1").val();
		var ph2 = $("#hp2").val();
		var ph3 = $("#hp3").val();
		var ph = ph1 + "-" + ph2 + "-" + ph3;
		var phrgx = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		if (ph1 = "") {
			alert("휴대번호를 입력해주세요.");
			$("#ph1").focus();
			return false;
		} else if (ph2 == "") {
			alert("휴대번호를 입력해주세요.");
			$("#ph2").focus();
			return false;
		} else if (ph3 == "") {
			alert("휴대번호를 입력해주세요.");
			$("#ph3").focus();
			return false;
		} else {
			if (phrgx.test(ph)) {
				return true;
			} else {
				alert("휴대번호를 다시 입력해주세요.");
				$("#ph1").val("");
				$("#ph2").val("");
				$("#ph3").val("");
				$("#ph1").focus();
				return false;
			}
		}
	}

	var goPopup = function() {
		var pop = window.open("jusoPopup.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	var jusoCallBack = function(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo) {
		document.getElementById("addr1").value = zipNo;
		document.getElementById("addr2").value = roadAddrPart1;
		if (addrDetail.length > 30) {
			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
			return;
		}
		document.getElementById("addr3").value = addrDetail;
	}
</script>
<style>
div.join {
	width: 25%;
	margin: auto;
	margin-top: 150px;
	margin-bottom: 300px;
}

div.img_wrap>img {
	border-radius: 50%;
	border: 6px solid #fff;
	box-shadow: 0 0 16px yellow;
	margin-bottom: 10px;
	margin-left: -16px;
}

div.img_wrap {
	margin-bottom: 10px;
	text-align: center;
}

section.section_join>div>form.join>h1 {
	font-size: 28px;
	margin-bottom: 40px;
	margin-left: -10px;
}

section.section_join>div>form.join>ul>li:first-child>label {
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
	margin-left: 160px;
}

section.section_join>div>form.join>ul>li:first-child>input[type="file"]
	{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

section.section_join>div>form.join>ul>li {
	list-style-type: none;
	margin-left: -7px;
	margin-top: 3px;
}

section.section_join>div>form.join>ul>li:first-child, section.section_join>div>form.join>ul>li:nth-child(3),
	section.section_join>div>form.join>ul>li:nth-child(6), section.section_join>div>form.join>ul>li:nth-child(9),
	section.section_join>div>form.join>ul>li:nth-child(12), section.section_join>div>form.join>ul>li:nth-child(14),
	section.section_join>div>form.join>ul>li:nth-child(17) {
	margin-bottom: 15px;
}

section.section_join>div>form.join>ul>li:nth-child(2), section.section_join>div>form.join>ul>li:nth-child(4),
	section.section_join>div>form.join>ul>li:nth-child(7), section.section_join>div>form.join>ul>li:nth-child(10),
	section.section_join>div>form.join>ul>li:nth-child(13), section.section_join>div>form.join>ul>li:nth-child(15)
	{
	font-weight: bold;
}

section.section_join>div>form.join input.f1, section.section_join>div>form.join select.hp,
	section.section_join>div>form.join input.hp_number, section.section_join>div>form.join input.addr1,
	section.section_join>div>form.join input.addr2 {
	padding: 15px 0;
	border: 1px solid lightgray;
	border-radius: 5px;
	width: 100%;
	text-indent: 10px;
	font-size: 17px;
}

section.section_join>div>form.join select.hp, section.section_join>div>form.join input.hp_number
	{
	width: 20%;
}

section.section_join>div>form.join input.addr1 {
	width: 30%
}

section.section_join>div>form.join input.addr2 {
	width: 48.8%
}

section.section_join>div>form.join button.join_btn_style {
	position: relative;
	color: RGB(82, 67, 21);
	background-color: RGB(254, 229, 0);
	font-weight: bold;
	border: 1px solid RGB(254, 229, 0);
	padding: 15px 17px;
	font-size: 17px;
	border-radius: 5px;
}

section.section_join>div>form.join button.join_btn_style:hover {
	opacity: 0.7;
}

section.section_join>div>form.join button.join_btn_style:nth-child(2) {
	position: relative;
}

section.section_join>div>form.join button.join_btn_style:first-child {
	margin-top: 30px;
	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="join">
		<section class="section_join">
			<div>
				<form id="joinForm" name="joinForm" action="join_proc.do" method="post"
					class="join" enctype="multipart/form-data">
					<h1>회원가입</h1>
					<ul>
						<li>
							<div class="img_wrap">
								<img
									src="http://localhost:9000/banana/images/bananamarket_logo.jpg"
									id="img" width="200px" height="200px">
							</div> <label for="input_img">프로필 사진 변경</label> <input type="file"
							id="input_img" name="file1">
						</li>
						<li><label>닉네임</label></li>
						<li><input type="text" name="nickname" class="f1"
							id="nickname"><br> <span id="nickname-chk-msg"></span>
						</li>
						<li><label>아이디</label></li>
						<li><input type="text" name="mid" class="f1" id="mid"><br>
							<span id="id-chk-msg"></span></li>
						<li>
							<div>6-16자리의 영문, 숫자 조합</div>
						</li>
						<li><label>비밀번호</label></li>
						<li><input type="password" name="pw" class="f1" id="pass">
						</li>
						<li>
							<div>6-16자리의 영문, 숫자, 특수문자 조합</div>
						</li>
						<li><label>비밀번호 확인</label></li>
						<li><input type="password" name="cpass" class="f1" id="cpass">
						</li>
						<li><span id="pass-chk-msg"></span></li>
						<li><label>휴대폰</label></li>
						<li><select name="ph1" class="hp" id="hp1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
						</select> <span>-&nbsp;</span><input type="text" name="ph2"
							class="hp_number" id="hp2"> <span>-&nbsp;</span><input
							type="text" name="ph3" class="hp_number" id="hp3"></li>
						<li><label>주소</label></li>
						<li><input type="text" name="maddr_num" placeholder="우편번호"
							class="addr1" id="addr1">
							<button type="button" class="join_btn_style" onClick="goPopup();">찾기</button>
						<li><input type="text" name="maddr1" placeholder="도로명주소"
							class="addr2" id="addr2"> <input type="text"
							name="maddr2" placeholder="상세주소" class="addr2" id="addr3">
						</li>
						<li>
							<button type="button" class="join_btn_style" id="btnJoin">회원가입</button>
						</li>
					</ul>
				</form>
			</div>
		</section>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>