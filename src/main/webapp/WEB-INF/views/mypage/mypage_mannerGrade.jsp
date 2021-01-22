<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	
	$("#section3_manner").hide();
	
	$("#getManner").click(function(){
		$("#section3_manner").hide();
		$("#section2_manner").toggle(1000);
	});
	
	$("#getBmanner").click(function(){
		$("#section2_manner").hide();
		$("#section3_manner").toggle(1000);
	});
	
});
</script>
<style>
	div.mypage_manner {
		width:98%;
		margin:auto;
	}
	div.mypage_manner section.section1_manner>div {
		padding-top:20px;
		text-align:center;
		
	}
	div.mypage_manner ul.manner_nav {
		border-bottom:1px solid gray;
		padding-bottom:10px;
	}
	div.mypage_manner ul.manner_nav li {
		display:inline-block;
		padding:0 10%;
		list-style:none;
	}
	div.mypage_manner ul.manner_nav li>a {
		text-decoration:none;
	}
	div.mypage_manner table.mypage_table {
		width:100%; 
		padding:5px 0;
		border-bottom:1px solid gray;
	}
	div.mypage_manner table.mypage_table td:first-child{
		width:200px;
	}
	div.mypage_manner table.mypage_table td:nth-child(2),
	div.mypage_manner table.mypage_table td:nth-child(3){
		text-align:center;
	}
	div.mypage_manner table.mypage_table td:first-child img {
		width:100px;
		border-radius:50%;
		border:1px solid red;
	}

	div.mypage_manner table.mypage_table span.mnickname {
		font-size:19px;
		vertical-align:40px;
		margin-left:10px;
	}
	div.mypage_manner table.mypage_table span.mcoment {
		font-size:15px;
	}
	div.mypage_manner table.mypage_table span.mgrade {
		font-weight:900;
	}
</style>
</head>
<body>
	<div class="mypage_manner">
		<section class="section1_manner">
			<div>
				<ul class="manner_nav">
					<li><a href="#" id="getManner">받은 매너 칭찬</a></li>
					<li><a href="#" id="getBmanner">받은 비매너</a></li>
				</ul>
			</div>
		</section>
		<section class="section2_manner" id="section2_manner">
			<table class="mypage_table">
				<tr>
					<th>닉네임</th>
					<th>내용</th>
					<th>점수</th>
				</tr>	
                <tr>					
					<td><img src="images/mypage_bananaimg.jpg" class="mimg"><span class="mnickname">홀길돌</span></td>
					<td><span class="mcoment">당신은 날개없는 천사</span></td>
					<td><span class="mgrade">😆</span></td>
				</tr>
				<tr>					
					<td><img src="images/mypage_bananaimg.jpg" class="mimg"><span class="mnickname">톨톨톨</span></td>
					<td><span class="mcoment">지금만나 언제만나</span></td>
					<td><span class="mgrade">🙂</span></td>
				</tr>
			</table>
		</section>
		<section class="section3_manner" id="section3_manner">
			<table class="mypage_table">
				 <tr>
					<th>닉네임</th>
					<th>내용</th>
					<th>점수</th>
				 </tr>	
				 <tr>					
					<td><img src="images/mypage_bananaimg.jpg" class="mimg"><span class="mnickname">홀길돌</span></td>
					<td><span class="mcoment">악마를 보았따</span></td>
					<td><span class="mgrade">😡</span></td>
				</tr>
				<tr>					
					<td><img src="images/mypage_bananaimg.jpg" class="mimg"><span class="mnickname">톨톨톨</span></td>
					<td><span class="mcoment">가다가 새똥맞아라ㅗ^^ㅗ</span></td>
					<td><span class="mgrade">😥</span></td>
				</tr>
			</table>			
		</section>
	</div>
</body>
</html>