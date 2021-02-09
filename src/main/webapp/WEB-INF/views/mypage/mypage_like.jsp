<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		
		$("#section3_like").hide();
		$("#section4_like").hide();
		
		$("#like_secondhand").click(function(){
			$("#section3_like").hide();
			$("#section4_like").hide();
			$("#section2_like").toggle(1000);
		});
		
		$("#like_dongnaelife").click(function(){
			$("#section2_like").hide();
			$("#section4_like").hide();
			$("#section3_like").toggle(1000);
		});
		
		$("#like_neighborhoodstore").click(function(){
			$("#section2_like").hide();
			$("#section3_like").hide();
			$("#section4_like").toggle(1000);
		});
		
		/* $("#btnLike").click(function(){
			 var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
			 if(confirmflag){
				 $.ajax({
					  url:"product_unlike.do?pid=${vo.pid}", //mid는 로그인한사람id
					  success:function(result){
						alert(result);
					  }
					});
					 location.reload();
			 }
		}); */
		
		/* $("#btnLike2").click(function(){
			 var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
			 if(confirmflag){
				 $.ajax({
					  url:"dongnelife_unlike.do?mid=${svo.mid}&bid=${vo.bid}", //mid는 로그인한사람id
					  success:function(result){
						  }
					});
				 location.reload();
			 }
		}); */
		
		/* $("#btnLike3").click(function(){
			 var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
			 if(confirmflag){
				 $.ajax({
					  url:"shop_unlike.do?mid=${svo.mid}&sid=${vo.sid}", //mid는 로그인한사람id
					  success:function(result){
						  }
					});
				 location.reload();
			 }
		}); */
	});
	
	function delProductLike(pid) {
		var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
		 if(confirmflag){
			 $.ajax({
				  url:"product_unlike.do?pid="+pid, //mid는 로그인한사람id
				  success:function(result){
					alert('삭제가 완료되었습니다.');
				  }
				});
				 location.reload();
		 }
	}
	function delDongnelifeLike(bid) {
		var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
		 if(confirmflag){
			 $.ajax({
				  url:"dongnelife_unlike.do?bid=" + bid, //mid는 로그인한사람id
				  success:function(result){
					  }
				});
			 location.reload();
		 }
	}
	function delShopLike(sid) {
		var confirmflag = confirm("관심목록에서 삭제하시겠습니까?");
			 if(confirmflag){
				 $.ajax({
					  url:"shop_unlike.do?sid="+sid, //mid는 로그인한사람id
					  success:function(result){
						  }
					});
				 location.reload();
			 }
	}
</script>
<style>
	div.mypage_like {
		width:98%;
		margin:auto;
	}
	div.mypage_like section.section1_like>div {
		padding-top:20px;
		text-align:center;
	}
	div.mypage_like ul.like_nav {
		border-bottom:1px solid gray;
		padding-bottom:10px;
	}
	div.mypage_like ul.like_nav li {
		display:inline-block;
		padding:0 10%;
		list-style:none;
	}
	div.mypage_like ul.like_nav li>a {
		text-decoration:none;
	}
	div.mypage_like table.mypage_table {
		width:100%; 
		padding:5px 0;
		border-bottom:1px solid gray;
	}
	div.mypage_like table.mypage_table td {
		width:800px;
	}
	div.mypage_like table.mypage_table td.tdimg {
		width:10px;
		padding-right:15px;
	}
	div.mypage_like table.mypage_table img {
		width:120px;
		height:120px;
		border-radius:10px;
	}
	div.mypage_like table.mypage_table span.product {
		font-size:19px;
	}
	div.mypage_like table.mypage_table span.locate {
		font-size:15px;
		color:gray;
	}
	div.mypage_like table.mypage_table span.price {
		font-weight:900;
	}
	.btn_like,.btn_like2 {
		float:right;
	  	position: relative;
	 	margin:2px 10px;
	 	margin-right:224px;
	  	width: 50px;
	  	height: 50px;
	  	border: 1px solid #e8e8e8;
	  	border-radius: 44px;
	  	font-family: notokr-bold,sans-serif;
	  	font-size: 14px;
	  	line-height: 16px;
	  	background-color: #fff;
	  	color: #DD5D54;
	  	box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
	  	transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	  	cursor: pointer;
	}
	.btn_like:hover,.btn_like2:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
	}
	.btn_like .img_emoti ,.btn_like2 .img_emoti{
	    background-position: -30px -120px;
	}
	.img_emoti {
	    display: inline-block;
	    overflow: hidden;
	    font-size: 0;
	    line-height: 0;
	    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
	    text-indent: -9999px;
	    vertical-align: top;
	    width: 20px;
	    height: 17px;
	    margin-top: 1px;
	    background-position: 0px -120px;
	    text-indent: 0;
	}
	.btn_like2{
		margin-top:-5px;
		maring-left:-15px;
	}
	div.skinds{
		font-size:14px;
	}
	.dl_content2 {
		background-color: rgb(251,247,242); 
		box-shadow: 0 0 16px rgb(221,221,221);
		margin-bottom:30px;
		z-index:-1;
	}
	.dl_content2 ul{
		list-style-type:none;
	}
	.dl_content2 ul li {
		margin: 15px 0 0 35px;
	}
	.dl_content2 ul li:first-child {
		padding-top: 20px;
	}
	.dl_content2 ul li:first-child label:first-child{
		padding: 3px 30px;
		color: rgb(98,71,24);
		background-color:rgb(255,249,176);
	}
	.dl_content2 ul li:first-child label:nth-child(2){
		color: rgb(98,71,24);
		font-size:14px;
		margin-left:460px;
	}
	.dl_content2 ul li:nth-child(2) img{
		width:35px;
		height:35px;
		margin-left:5px;
		border-radius:50%;
     	border:2px solid #fff;
      	box-shadow: 0 0 16px rgb(221,221,221);
	}
	.dl_content2 ul li:nth-child(2) label{
		position: relative;
        top: -11px;
        color: rgb(98,71,24);
        font-weight:550;
	}
	.dl_content2 ul li:nth-child(2) label:last-child{
        margin-left:6px;
        font-size:12px;
        font-weight:500;
	}
	.dl_content2 ul li:last-child pre{
		padding-bottom:15px;
	}
	div.dl_content2:hover {
		cursor:pointer;
		box-shadow: 0 0 22px #FEE500;
	}
</style>
</head>
<body>
	<div class="mypage_like">
		<section class="section1_like">
			<div>
				<ul class="like_nav">
					<li><a href="#" id="like_secondhand">중고거래</a></li>
					<li><a href="#" id="like_dongnaelife">동네생활</a></li>
					<li><a href="#" id="like_neighborhoodstore">동네업체</a></li>
				</ul>
			</div>
		</section>
		<section class="section2_like" id="section2_like">
			<c:forEach var="vo" items="${ list1 }">
				<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.psfile}" onclick="location.href='productContent.do?pid=${vo.pid}'"></td>
					<td><span class="product" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.ptitle }</span></td>
					<td rowspan="3">
					<button type="button" class="btn_like" id="btnLike" onclick="delProductLike('${vo.pid}')">
  							<span class="img_emoti">좋아요취소</span></button>
  					</td>
				</tr>
				<tr>
					<td><span class="locate" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.maddr }</span></td>
				</tr>
				<tr>
					<td><span class="price" onclick="location.href='productContent.do?pid=${vo.pid}'">${vo.pprice }</span></td>
				</tr>
			</table>
			</c:forEach> 
		</section>
		<section class="section3_like" id="section3_like">
			<c:forEach var="vo" items="${list2 }">
			<div class="dl_content2">
				<ul>	
					<li>
						<label onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">${vo.btitle }</label>
						<button type="button" class="btn_like2" id="btnLike2" onclick="delDongnelifeLike('${vo.bid}')">
  							<span class="img_emoti">좋아요취소</span></button>
					</li>
					<li>
						<img src="images/banana.jpg">
						<label onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">${vo.nickname }</label>
						<label onclick="location.href='dongneLife_content.do?bid=${vo.bid}'">${vo.maddr }</label>
					</li>	
					<li><pre onclick="location.href='dongneLife_content.do?bid=${vo.bid}'"><c:out value="${vo.btopic}" /></pre></li>
				</ul>
			</div>
			</c:forEach>
			
		</section>
		<section class="section4_like" id="section4_like">
			<c:forEach var="vo" items="${list3 }">
				<table class="mypage_table">
				<tr>
					<td rowspan="3" class="tdimg"><img src="http://localhost:9000/banana/resources/upload/${vo.smain_simg}" onclick="location.href='neighborhoodStore.do?sid=${vo.sid}'"></td>
					<td><span class="product" onclick="location.href='neighborhoodStore.do?sid=${vo.sid}'">${vo.sname } <div class="skinds" onclick="location.href='neighborhoodStore.do?sid=${vo.sid}'">${vo.skinds }</div></span></td>
					<td rowspan="3">
					<button type="button" class="btn_like" id="btnLike3" onclick="delShopLike('${vo.sid}')">
  							<span class="img_emoti">좋아요취소</span></button>
  					</td>
				</tr>
				<tr>
					<td><span class="locate" onclick="location.href='neighborhoodStore.do?sid=${vo.sid}'">${vo.saddr }</span></td>
				</tr>
				<tr>
					<td><span class="price">${vo.sph }</span></td>
				</tr>
			</table>
			</c:forEach>
		</section>
	</div>
</body>
</html>