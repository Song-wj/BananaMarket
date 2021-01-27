<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script>

$(document).ready(function(){
	
	var sel_files = [];
	var sel_files2 = [];
	
	//메인이미지
	$("#input_img").on("change", function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;				
			}
			
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html ="<img src=\"" + e.target.result + "\"  style='width:100px;height:100px;margin-right:20px;'/>";
				$("#img_list").append(img_html);
				sel_files.add(f);
			}
			reader.readAsDataURL(f);
		});
		
		if(sel_files.length == 1) {
			$("#inputMain").hide();
			$("#storename").focus();
		}
		alert("sel_files"+sel_files);
		
	});
	
	//광고이미지
	$("#input_carousel_img").on("change", function handleImgFileSelect(e2){
		var files2 = e2.target.files;
		var filesArr2 = Array.prototype.slice.call(files2);
		
		filesArr2.forEach(function(f2){
			if(!f2.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;				
			}
			
			sel_files2.push(f2);
			var reader = new FileReader();
			reader.onload = function(e2){
				var img_html ="<img src=\"" + e2.target.result + "\"  style='width:100px;height:100px;margin-right:20px;'/>";
				$("#img_carousel_list").append(img_html);
				sel_files2.add(f2);
			}
			reader.readAsDataURL(f2);
		});
		
		if(sel_files2.length == 3) {
			$("#inputCarousel").hide();
			$("#btnEnroll").focus();
		}
		
		alert(sel_files2);
		
	});
	
	$('#btnEnroll').click(function(){
		if($("#input_img").val() ==""){
			alert("업체이미지를 등록해주세요");
			$("#input_img").focus();
		}else if($("#storename").val() ==""){
			alert("상호명을 입력해주세요");
			$("#storename").focus();
		}else if($("#storekind1").val() =="select"){
			alert("업종을 선택해주세요");
			$("#storekind1").focus();
		}else if($("#storekind2").val() =="select"){
			alert("상세업종 입력해주세요");
			$("#storekind2").focus();
		}else if($("#addr1").val() ==""){
			alert("주소를 입력해주세요");
			$("#addr1").focus();
		}else if($("#addr2").val() ==""){
			alert("주소를 입력해주세요");
			$("#addr2").focus();
		}else if($("#addr3").val() ==""){
			alert("주소를 입력해주세요");
			$("#addr3").focus();
		}else if($("#hp1").val() ==""){
			alert("전화번호를 입력해주세요");
			$("#hp1").focus();
		}else if($("#hp2").val() ==""){
			alert("전화번호를 입력해주세요");
			$("#hp2").focus();
		}else if($("#hp3").val() ==""){
			alert("전화번호를 입력해주세요");
			$("#hp3").focus();
		}else if($("#storeintro").val() ==""){
			alert("업체 소개를 입력해주세요");
			$("#storeintro").focus();
		/* }else if($("#input_carousel_img").val() ==""){
			alert("광고사진을 등록해주세요");
			$("#input_carousel_img").focus(); */
		}else
			EnrollForm.submit();
		
	});
	
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="join">
		<section class="section_join">
			<div>
				<form name="EnrollForm" action="enrollstore_write_proc.do" method="post" 
				class="join" enctype="multipart/form-data">
				<input type="hidden" name="mid" value="test12"> <!-- mid 임의로 설정  -->
				<h1>동네업체 등록</h1>
				<ul>
					<li><div id="inputMain"><label for="input_img">메인 이미지 추가</label>
						<input type="file" id="input_img" name="file1" multiple>
						</div>
						<div class="img_list" id="img_list"></div>
		    		</li>	
					<li>
						<label>상호명</label>
					</li>
					<li>
						<input type="text" name="sname" class="f1" id="storename" placeholder="예) 바나나 슈퍼">
					</li>
					<li>
						<label>업종</label>
					</li>
					<li>
						<select name="skinds" class="storekind" id="storekind1">
							<option value="select">선택해주세요</option>
							<option value="병원/의료">병원/의료</option>
							<option value="교육/학원">교육/학원</option>
							<option value="빵집/카페">빵집/카페</option>
							<option value="음식점/반찬">음식점/반찬</option>
							<option value="운송">운송</option>
							<option value="뷰티/미용">뷰티/미용</option>
							<option value="부동산">부동산</option>
							<option value="인테리어">인테리어</option>
							<option value="세탁/수선">세탁/수선</option>
							<option value="아동">아동</option>
							<option value="의류판매점">의류판매점</option>
							<option value="운동">운동</option>
							<option value="법무/세무">법무/세무</option>
							<option value="통신/렌탈">통신/렌탈</option>
							<option value="가전">가전</option>
							<option value="자동차">자동차</option>
							<option value="반려동물">반려동물</option>
							<option value="농수산물">농수산물</option>
							<option value="기타 동네업체">기타 동네업체</option>
						</select>
					</li>
					<li>
						<label>상세 업종</label>
					</li>
					<li>
						<input type="text" name="skinds2" class="f1" id="storekind2" placeholder="예) 카페, 한식전문점, 옷수선, 반찬가게 등">
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" name="saddr_num" placeholder="우편번호" class="addr1" id="addr1">
						<button type="button" class="join_btn_style" onClick="goPopup();">찾기</button>
					<li>
						<input type="text" name="addr2" placeholder="도로명주소" class="addr2" id="addr2">
						<input type="text" name="addr3" placeholder="상세주소" class="addr2" id="addr3">
					</li>
					<li>
						<label>전화번호</label>
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
						<label>업체 소개</label>
					</li>
					<li>
						<textarea name="sintro" rows="5" class="f1" id="storeintro"></textarea>
					</li>
					<li><div id="inputCarousel"><label for="input_carousel_img">광고 이미지 추가</label>
						<input type="file" id="input_carousel_img" name="" multiple>
						</div>
						<div class="img_list" id="img_carousel_list"></div>
		    		</li>	
					<li>
						<button type="button" class="join_btn_style" id="btnEnroll">완료</button>
					</li>
				</ul>
				</form>
			</div>
		</section>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>