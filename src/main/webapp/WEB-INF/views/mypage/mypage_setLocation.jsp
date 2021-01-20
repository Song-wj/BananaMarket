<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 설정</title>
<script>
 		dragElement(document.getElementById("circle"));

		function dragElement(elmnt) {
		  let clientX_gab = 0, clientX = 0;
		  elmnt.onmousedown = dragMouseDown;
		  elmnt.addEventListener('touchstart',dragMouseDown)
		  function dragMouseDown(e) {
		    e = e || window.event;
		    e.preventDefault();
		    if (e.changedTouches) {
		      e.clientX = e.changedTouches[0].clientX
		    }
		    clientX = e.clientX;
		    document.onmouseup = closeDragElement;
		    document.addEventListener('touchend',closeDragElement);
		    document.onmousemove = elementDrag;
		    document.addEventListener('touchmove',elementDrag);
		  }

		  function elementDrag(e) {
		    e = e || window.event;
		    e.preventDefault(); 
		    if (e.changedTouches) {
		      e.clientX = e.changedTouches[0].clientX
		    }
		    clientX_gab = e.clientX - clientX;
		    clientX = e.clientX;
		    let leftVal = 0;
		    let parentElmnt = elmnt.parentNode;
		    if (
		      (elmnt.offsetLeft + clientX_gab) < 0 ||
		      clientX < parentElmnt.offsetLeft) 
		      {
		      leftVal = 0;
		    } else if(
		      (elmnt.offsetLeft + clientX_gab) > parentElmnt.clientWidth ||
		      clientX > (parentElmnt.offsetLeft+parentElmnt.clientWidth))
		      {
		      leftVal = parentElmnt.clientWidth;
		    } else {
		      leftVal = (elmnt.offsetLeft + clientX_gab);
		    }
		    elmnt.querySelector('span').innerText = Math.round((leftVal /parentElmnt.clientWidth)*30);
		    
		    elmnt.style.left = leftVal + "px";
		  }

		  function closeDragElement() {
		    document.onmouseup = null;
		    document.removeEventListener('touchend', closeDragElement);
		    document.onmousemove = null;
		    document.removeEventListener('touchmove', elementDrag);
		  }
		}
</script>
<style>
	div.mypage_setLocation {
		width:98%;
		height:700px;
		margin:auto;
	}
	.setLocation_title {
		border-bottom : 2px solid lightgray;
	}
	.setLocation_title h1{	
		font-size: 28px;
		margin: 30px 43%;
	}
	.setLocation_title h3{
		margin: 10px 30%;
		color:gray;
	}
	.setLocation_title button {
		color:RGB(82,67,21);
		background-color:RGB(254,229,0);
		border:1px solid RGB(254,229,0);
		font-size:17px;
		font-weight:bold;
		width: 200px;
		height: 60px;
		margin: 0 20px; 
		padding:15px 17px;
		border-radius:5px;
	}
	.setLocation_title button:hover {
		opacity:0.7;
	}
	.setLocation_title button:nth-child(4) {
		margin-left:290px;
	}
	.setLocation_content h1{
		font-size: 28px;
		margin: 30px 37%;
	}
	.setLocation_content h3{
		margin: 10px 35%;
		color:gray;
	}
	.setLocation_content img {
		width: 400px;
		height: 300px;
		margin: 5px 325px;
	}
	.seek-bar{
		margin:50px auto;
		position:relative;
		width:calc(100% - 600px);
		height:10px;
		background:#FEE500;
		border-radius:5px;
	}
	.seek-bar>.circle{
		cursor:grab;
		position:absolute;
		left:0;
		top:50%;
		width:30px;
		height:30px;
		transform:translate(-50%,-50%);
	}
	.seek-bar>.circle>span{
		position:absolute;
		display:block;
		width:30px;
		line-height:30px;
		left:50%;
		top:50%;
		transform:translate(-50%,-50%);
		background:white;
		border-radius:100%;
		text-align:center;
	}
</style>
</head>
<body>
	<div class="mypage_setLocation">
		<section class="section1_setLocation">
			<div class="setLocation_title">
				<h1>동네 선택</h1>
				<h3>지역은 최소 1개 이상 최대 2개까지 설정 가능해요.</h3><br>
				<button type="button">이의동</button>
				<button type="button">+</button>
				<br><br>
			</div>
			<div class="setLocation_content">
				<h1>이의동 근처 동네 10개</h1>
				<h3>선택한 범위의 게시글만 볼 수 있어요.</h3>
				<div class="seek-bar">
	  				<div class="circle" id="circle">
	    				<span>0</span>
	  				</div>
				</div>
				<img src="images/location1.png">
				<!-- if(지역 설정 10이상 20미만이면 ) 
				<img src="images/location2.png">
				else if(지역 설정 20이상 30이하면 ) 
				<img src="images/location3.png"> -->
			</div>
		</section>
	</div>
</body>
</html>