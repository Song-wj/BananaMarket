<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$(".mypost").click(function(){
			$(".mypost_table_area").show();
			$(".mycomment_table_area").hide();
			$(".mypost").css("color","black").css("border-bottom","4px solid black");
			$(".mycomment").css("color","#ccc").css("border-bottom","1px solid #ccc");
		});
		
		$(".mycomment").click(function(){
			$(".mypost_table_area").hide();
			$(".mycomment_table_area").show();
			$(".mypost").css("color","#ccc").css("border-bottom","1px solid #ccc");
			$(".mycomment").css("color","black").css("border-bottom","4px solid black");
		})
	});
</script>
<style>
	.mypage_mypost {
		text-align: center;
	}
	
	.mypost_change_area .mypost_title {
		text-align: left;
		margin-top: 50px;
		margin-left: 50px;
		font-size: 2rem;
		font-weight: bold;
	}
	
	.mypost_change_area div button {
		all: unset;
		font-size: 2rem;
		margin-top: 50px;
		width: 20rem;
		height: 7rem;
		color: #ccc;
		border-bottom: 1px solid #ccc;
		font-weight: bold;
	}
	
	.mypost_change_area div .mypost {
		color: black;
		border-bottom: 4px solid black;
	}
	
	.mypost_change_area div .mypost:active,
	.mypost_change_area div .mycomment:active {
		background-color: #FEE500;
		opacity: 0.7;
	}
	
	.mypost_change_area div .mycomment {
		margin-left: -5px;
	}
	
	.mypage_mypost .mypost_table_area,
	.mypage_mypost .mycomment_table_area {
		display: flex;
		justify-content: center;
	}
	
	.mypage_mypost .mypost_table_area .mypost_table,
	.mypage_mypost .mycomment_table_area .mycomment_table {
		border-bottom: 1px solid #ccc;
		width: 650px;
	}
	
	.mypage_mypost .mypost_table_area .mypost_table tr td,
	.mypage_mypost .mycomment_table_area .mycomment_table tr td {
		font-size: 2.1rem;
	}
</style>
</head>
<body>
	<div class="mypage_mypost">
		<section class="mypost_change_area">
			<div class="mypost_title">동네생활 글</div>
			<div>
				<button type="button" class="mypost">내 게시글</button>
				<button type="button" class="mycomment">내 댓글</button>
			</div>
		</section>
		<section class="mypost_table_area">
			<div>
			<table class="mypost_table">
				<tr>
					<td style="padding: 230px 0; color: #ccc;">게시글이 없어요.</td>
				</tr> 
			</table>
			</div>
		</section>
		<section class="mycomment_table_area" style="display: none;">
			<div>
			<table class="mycomment_table">
				<tr>
					<td style="padding: 230px 0; color: #ccc;">댓글이 없습니다.</td>
				</tr> 
			</table>
			</div>
		</section>
	</div>
</body>
</html>