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
	section.section_join>div>form.join>ul>li:nth-child(1)>label{
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
		margin-left:160px;
	}
	section.section_join>div>form.join>ul>li:nth-child(1)>input[type="file"]{
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
	section.section_join>div>form.join>ul>li:nth-child(14){
		margin-bottom:15px;
	}
	section.section_join>div>form.join>ul>li:nth-child(2),
	section.section_join>div>form.join>ul>li:nth-child(4),
	section.section_join>div>form.join>ul>li:nth-child(6),
	section.section_join>div>form.join>ul>li:nth-child(8),
	section.section_join>div>form.join>ul>li:nth-child(11),
	section.section_join>div>form.join>ul>li:nth-child(13),
	section.section_join>div>form.join>ul>li:nth-child(15){
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
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<div class="join">
		<section class="section_join">
			<div>
				<form name="joinForm" action="join_proc.do" method="post" class="join">
				<h1>동네업체 등록</h1>
				<ul>
					<li>
						<div class="img_wrap">
							<img src="http://localhost:9000/banana/images/bananamarket_logo.jpg" id="img" width="200px" height="200px">
						</div>
						<label for="input_img">업체 사진 변경</label>
						<input type="file" id="input_img">
					</li>
					<li>
						<label>상호명</label>
					</li>
					<li>
						<input type="text" name="storename" class="f1" id="nickname" placeholder="예) 바나나 슈퍼">
					</li>
					<li>
						<label>업종</label>
					</li>
					<li>
						<select name="storekind" class="storekind" id="storekind1">
							<option value="select">선택해주세요</option>
							<option value="medical">병원/의료</option>
							<option value="edu">교육/학원</option>
							<option value="cafe">빵집/카페</option>
							<option value="food">음식점/반찬</option>
							<option value="delivery">운송</option>
							<option value="beauty">뷰티/미용</option>
							<option value="land">부동산</option>
							<option value="interior">인테리어</option>
							<option value="wash">세탁/수선</option>
							<option value="kids">아동</option>
							<option value="clothes">의류판매점</option>
							<option value="sports">운동</option>
							<option value="law">법무/세무</option>
							<option value="communication">통신/렌탈</option>
							<option value="furniture">가전</option>
							<option value="car">자동차</option>
							<option value="pet">반려동물</option>
							<option value="farm">농수산물</option>
							<option value="etc">기타 동네업체</option>
						</select>
					</li>
					<li>
						<label>상세 업종</label>
					</li>
					<li>
						<input type="text" name="storekind2" class="f1" id="storekind2" placeholder="예) 카페, 한식전문점, 옷수선, 반찬가게 등">
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" name="addr_num" placeholder="우편번호" class="addr1" id="addr1">
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
						<textarea name="storeintro" rows="5" class="f1" id="storeintro"></textarea>
					</li>
					<li>
						<button type="button" class="join_btn_style" id="btnJoin">완료</button>
					</li>
				</ul>
				</form>
			</div>
		</section>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>