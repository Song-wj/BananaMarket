<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/banana//js/jqbar.js"></script>
<script>
	$(document).ready(function () {
		$('#mannerbar').jqbar({ 
			label: '', 
			value: 36.5, 
			barColor: '#3A1D1D' 
		});
		
		$("#mypage_purchasedBtn").click(function(){
			$("#contentSection").load("mypage_purchased.do");
		});
		
		$("#mypage_contractBtn").click(function(){
			$("#contentSection").load("mypage_contract.do");
		});
		
		$("#mypage_likeBtn").click(function(){
			$("#contentSection").load("mypage_like.do");
		});
		
		$("#mypage_setLocationBtn").click(function(){
			$("#contentSection").load("mypage_setLocation.do");
		});
		
	});
</script>
<style>
	div.mypage_mainDiv {
		width:70%;
		margin:auto;
		margin-bottom:50%;
	}
	section.section2_mypage,
	section.section3_mypage {
		background-color: rgb(251,247,242);
		border:6px solid #fff;
		box-shadow: 0 0 6px rgb(221,221,221);
		border:1px solid lightgray;
		margin: 15px 0;
	}
	section.section1_mypage {
		padding-top:150px;
	}
	section.section2_mypage label.mannerTemp {
		font-size:15px;
	}
	section.section2_mypage{
		border-radius:10px;
		padding:10px 30px;
	}
	section.section3_mypage {
		border-radius:10px;
		padding:10px 0;
	}
	section.section4_mypage,
	section.section5_mypage {
		float:left;
		width:17%;
		background-color: rgb(251,247,242);
		margin-bottom:80px;		
	}
	section.section4_mypage {
		margin-right:15px;
	}
	section.section5_mypage {
		width:81.47%;
		float:left;
		display:inline-block;
		overflow:auto;
	}
	img.mypageImg {
		magin-bottom:100px;
		width:100px;
		heigth:100px;
		border-radius:50%;
		border:6px solid #fff;
		box-shadow: 0 0 16px #FEE500;
	}
	div.mypageImg {
		float:left;
		display:inline-block;
		width:120px;
		height:120px;
	} 
	div.mypageSide {
		float:inherit; 
		display:inline-block;
	}
	ul.mypageSide {
		display:inline-block;
		list-style:none;
	}
	ul.mypageSide>li {
		margin-left:-30px;
	}
	ul.mypageSide>li:first-child {
		font-size:26px;
		font-weight:900;
	}
	ul.mypageSide>li:nth-child(2) {
		margin-top:-3px;
		font-size:20px;
		color:gray;
	}
	ul.mypageSide>li:nth-child(3) {
		padding-top:8px;
	}
	div.manner {
	}
	section.section2_mypage .jqbar {
	    position: relative;
	}
	section.section2_mypage .jqbar.vertical {
	    text-align: center;
	    display: inline-block;
	}
	section.section2_mypage .jqbar.vertical span {
	    display: block;
	    font-size: 11px;
	    font-weight: bold;
	}
	section.section2_mypage .jqbar.vertical .bar-percent {
	    font-size: 11px;
	    font-weight: bold;
	    position: absolute;
	    height: 20px;
	    margin-bottom: 5px;
	    width: 100%;
	}
	section.section2_mypage .jqbar.vertical .bar-level-wrapper {
	    position: relative;
	    display: inline-block;
	    overflow: hidden;
	}
	section.section2_mypage .jqbar.vertical .bar-level {
	    position: absolute;
	}
	div.sideMenu {
		width:-30%;
		text-align:center;
	}
	div.sideMenu li {
		list-style:none;
		display:inline-block;
		padding:0 60px;
	}
	div.sideMenu li img {
		width:50px;
		height:50px;
	}
	div.sideMenu li>a {
		text-decoration:none;
		font-size:18px;
		color:#3A1D1D;
		display:block;
		width:72px;
	}
	div.profileDetails,
	div.contentSection {
		height:800px;
		background-color: rgb(251,247,242);
		border:6px solid #fff;
		box-shadow: 0 0 6px rgb(221,221,221);
		border:1px solid lightgray;
		border-radius:10px;
	}
	div.profileDetails li {
		list-style:none;
		padding:45px 0; 
	}
	div.profileDetails li>a {
		color:#3A1D1D;
		text-decoration:none;
		font-size:18px;
	}
	/* Add an active class to the active dropdown button */
	section.section4_mypage .active {
		background-color: green;
		color: white;
	}
	
	/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
	section.section4_mypage .dropdown-container {
		display: none;
		padding-top:5px;
		padding-left: 8px;
		width:115px;
	}
	section.section4_mypage .dropdown-container a {
		color:#3A1D1D;
		font-size:18px;
		text-decoration:none;
	}
	/* Optional: Style the caret down icon */
	section.section4_mypage .fa-caret-down {
		font-size:27px;
		color:#3A1D1D;
		float: right;
		padding-right:80px;
	}
	section.section4_mypage .dropdown-btn {
		padding: 6px 0 6px 0;
		text-decoration: none;
		font-size: 18px;
		color: black;
		display: block;
		border: none;
		background: none;
		width: 100%;
		text-align: left;
		cursor: pointer;
		outline: none;
	}
	
</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>

	<div class="mypage_mainDiv">
		<section class="section1_mypage">
			<div class="mypageImg">
				<img src="images/mypage_bananaimg.jpg" class="mypageImg">
			</div>
			<div class="mypageSide">
				<ul class="mypageSide">
					<li>닉네임</li>
					<li>아이디</li>
					<li>
						<a href="mypage_update.do"><button type="button" id="mypage_updateBtn">프로필 수정</button></a>
					</li>
				</ul>
			</div>
		</section>
		<section class="section2_mypage">
			<div class="manner">
				<label class="mannerTemp">매너온도</label>
				<div id="mannerbar" class="mannerbar"></div>
			</div>
		</section>
		<section class="section3_mypage">
			<div class="sideMenu">
				<ul>
					<li>
						<a href="#" id="mypage_contractBtn">
						<img src="images/mypage_contract.png">
						<span>판매내역</span></a>
					</li>
					<li>
						<a href="#" id="mypage_purchasedBtn">
						<img src="images/mypage_purchased.png">
						<span>구매내역</span></a>
					</li>
					<li>
						<a href="#" id="mypage_likeBtn">
						<img src="images/mypage_like.png">
						<span>관심목록</span></a>
					</li>
				</ul>
			</div>
		</section>
		<section class="section4_mypage">
			<div class="profileDetails">
				<ul>
					<li>
						<a href="#" id="mypage_setLocationBtn">내 동네 설정</a>
					</li>
					<li>
						<button class="dropdown-btn">동네생활
							<i class="fa fa-caret-down"></i>
						</button>
						<div class="dropdown-container">
							<a href="#">동네생활 글</a>
							<a href="#">동네생활 댓글</a>
						</div>
					</li>
					<li>
						<a href="#">받은 매너 평가</a>
					</li>
					<li>
						<a href="#">받은 거래 후기</a>
					</li>
				</ul>
			</div>
		</section>
		<section class="section5_mypage">
			<div class="contentSection" id="contentSection">
				
			</div>
		</section>
	</div>
	<script>
	/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	  this.classList.toggle("active");
	  var dropdownContent = this.nextElementSibling;
	  if (dropdownContent.style.display === "block") {
	  dropdownContent.style.display = "none";
	  } else {
	  dropdownContent.style.display = "block";
	  }
	  });
	}
	</script>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>