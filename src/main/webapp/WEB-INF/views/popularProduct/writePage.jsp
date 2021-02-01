<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.content{
		width:50%;
		margin:auto;
		margin-top:150px;
		margin-bottom:150px;
		text-align:center;
	}
	div.content form.pwriteForm ul li{
		list-style:none;
		margin-top:30px;
	}
	div.content form.pwriteForm ul li:first-child>label{
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
		margin-left:20px;
	}
	div.content form.pwriteForm ul li:first-child>input[type="file"]{
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0;
	}
	div.content form.pwriteForm ul li:first-child div{

		margin-top:20px;
		margin-bottom:20px;
	}
	div.content form.pwriteForm ul li input[type='text'],
	div.content form.pwriteForm ul li select,
	div.content form.pwriteForm ul li textarea{
		padding:15px 0;
		border:1px solid lightgray;
		border-radius:5px;
		width:500px;
		text-indent:10px;
		font-size:17px;
	}
	div.content form.pwriteForm ul li:nth-child(4){
		margin-left:170px;
	}
	div.content form.pwriteForm ul li input[type='checkbox']{
		margin-left:70px;
	}
	div.content form.pwriteForm ul li textarea{
		text-indent:0px;
	}
	div.content form.pwriteForm ul li button{
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		font-weight:bold;
		border:1px solid RGB(254,229,0);
		padding:13px 17px;
		font-size:17px;
		border-radius:5px; 
		cursor:pointer;
	}
</style>
<script>

$(document).ready(function(){
	
	var sel_files = [];
	$(document).ready(function(){
		//$("#input_img").on("change", handleImgFileSelect);
		$("#input_img1").on("change", handleImgFileSelect);
		//$("#input_img2").on("change", handleImgFileSelect);
		//$("#input_img3").on("change", handleImgFileSelect);
		//$("#input_img4").on("change", handleImgFileSelect);
		//$("#input_img5").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
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
			}
			reader.readAsDataURL(f);
		});
	};
	
	$('#pwrite_btn').click(function(){
		if($("#ptitle").val() ==""){
			alert("제목을 적어주세요");
			$("#ptitle").focus();
		}else if($("#pcategory").val() =="none"){
			alert("카테고리를 선택해주세요");
			$("#pcategory").focus();
		}else if( $("#pprice").val()=="" && $("#bargin").is(":checked") == false) {
			alert("상품 가격을 적어주세요");
			$("#pprice").focus();
			
		}else if($("#pcontent").val() ==""){
			alert("상품 내용을 적어주세요");
			$("#pcontent").focus();
		}else
			pwriteForm.submit();
		
	});
	
	
	$("#bargin").change(function(){
        if($("#bargin").is(":checked")){
        	$("#pprice").attr("disabled",true);
        }else{
        	$("#pprice").attr("disabled",false);
        }
    });
	
	
	/* $("#input_img").change(function(){
		if(window.FileReader){
			var fileName= $(this)[0].length;
			alert(fileName);
		
								
		}
	});  */
	
	
});
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class= "content">
		<h1>상품 등록하기</h1>
		<form name="pwriteForm" action="writePage_proc.do" method="post"
								 class="pwriteForm" enctype="multipart/form-data">
		<ul>
			<li><label for="input_img1">이미지 추가</label>
				<!-- <label for="input_img2">이미지 추가</label>
				<label for="input_img3">이미지 추가</label>
				<label for="input_img4">이미지 추가</label>
				<label for="input_img5">이미지 추가</label>
				<input type="file" id="input_img1"  name="file_list">
				<input type="file" id="input_img2"  name="file_list">
				<input type="file" id="input_img3"  name="file_list">
				<input type="file" id="input_img4"  name="file_list"> -->
				<input type="file" id="input_img1"  name="file_list">
				<div id="img_list"></div>
    		</li>
			<li><input type="text" name="ptitle" placeholder="제목" id="ptitle" ></li>
			<li><select name="pcategory" id="pcategory">
				<option value="none">카테고리</option>
				<option value="디지털/가전">디지털/가전</option>
				<option value="가구/인테리어">가구/인테리어</option>
				<option value="유아동/유아도서">유아동/유아도서</option>
				<option value="생활/가공식품">생활/가공식품</option>
				<option value="스포츠/레저">스포츠/레저</option>
				<option value="여성잡화">여성잡화</option>
				<option value="여성의류">여성의류</option>
				<option value="남성패션/잡화">남성패션/잡화</option>
				<option value="게임/취미">게임/취미</option>
				<option value="뷰티/미용">뷰티/미용</option>
				<option value="반려동물용품">반려동물용품</option>
				<option value="도서/티켓/음반">도서/티켓/음반</option>
				<option value="식물">식물</option>
				<option value="기타 중고물품">기타 중고물품</option>
				<option value="삽니다">삽니다.</option>
			</select></li>
			<li><input type="text" name="pprice" placeholder="₩가격 (선택사항)" id="pprice"><input type ="checkbox" name ="bargin"  id="bargin"><span>가격제안받기</span> </li>
			<li><textarea cols=10 rows=10 name="pcontent" placeholder="게시글 내용을 작성해주세요. 가품 및 판매금지품목은 게시가 제한될 수 있어요." id="pcontent" style="resize:none;"></textarea></li>
			<li><input type="hidden" name="mid" value="whtjdrnr010"></li>
			<li><input type="hidden" name="pchk" value="x"></li>s
			<li><button type="button" id="pwrite_btn">완료</button></li>	
		</ul>
		</form>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>