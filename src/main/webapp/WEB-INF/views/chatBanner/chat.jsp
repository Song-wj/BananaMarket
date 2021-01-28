<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section.chatBanner #floatMenu {
		position: absolute;
		right: 100px;
		top: 10px;
	}
	section.chatBanner #floatMenu img {
		width:95px;
		height:95px;
	}
</style>
<script>
	$(document).ready(function() {
	
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop()+700;
			var newPosition = scrollTop + floatPosition + "px";
	
			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */
	
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);
	
		}).scroll();
	
	});
</script>
</head>
<body>
	<section class="chatBanner">
			<div id="floatMenu">
				<a href="http://localhost:9000/banana/chat_list.do"><img src="images/chat.png"></a>
			</div>
	</section>
</body>
</html>