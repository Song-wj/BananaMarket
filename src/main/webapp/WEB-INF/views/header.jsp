<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/banana//js/jqbar.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		get_alarm_review_msg('${ svo.mid }');
		
		alarm_count('${ svo.mid }');
		
		$("#al-msg").click(function(){
			$(".modal").toggle();
		});
		
		$(".modal_overlay").click(function(){
			$(".modal").hide();
		});
	});
	
	function alarm_count(mid) {
		$.ajax({
			url: "alarm_count.do?mid="+mid,
			success: function(cnt) {
				$("#al-cnt").append(cnt);
			}		
		});
	}
	
	function get_alarm_review_msg(mid) {
		$.ajax({
			url: "getReviewAlarmContent.do?mid="+mid,
			success: function(result) {
				var jdata = JSON.parse(result);
				var output = "";
					output+= "<ul id='review-alarm'>";
				for(var i in jdata.jlist) {
					//if(jdata.jlist.length > 0) {
					output+= "<li onclick=" + "\"move_dongneLife_content('"+ jdata.jlist[i].bid +"','"+ jdata.jlist[i].brid +"')\">";
					output+= "<p>";
					output+= "<span class='ra-id'>" + jdata.jlist[i].mid + "</span>님이 " + "<span class='ra-title'>" + jdata.jlist[i].btopic+"</span> 글에 댓글을 남겼습니다.<br>";
					output+= "<span class='ra-content'>'" + jdata.jlist[i].bcomment + "'</span>" +"<span class='ra-date'>"+ jdata.jlist[i].ra_data +"</span>";
					output+= "</p>";
					output+= "</li>";
					/* }
					else {
						output+="<li>알림이 없습니다.</li>";
					} */
				}
					output+= "</ul>";
				
				$(".review-al-content").append(output);
			}
		});
	}
	
	function move_dongneLife_content(bid, brid) {
		$.ajax({
			url: "ra_delete.do?brid="+brid,
			success: function(result) {
				if(result) {
					$(location).attr('href','http://localhost:9000/banana/dongneLife_content.do?bid='+bid);
				} else {
					alert("fail");
				}
			} 
		});
	}
</script>
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	* {
		padding: 0;
		margin: 0;
		outline: none;	
		color: #212529;
		font-family: 'Noto Sans KR', snas-serif;
	}

	#fixed-bar {
		width: 100%;
	    background-color: #fff;
	    position: fixed;
	    top: 0;
	    left: 0;
	    right: 0;
	    z-index: 100;
	}
	
	.fixed-bar-box-shadow {
		box-sizing: border-box;
		border-bottom: 1px solid rgba(0,0,0,0.1);
	}
	
	#fixed-bar #fixed-bar-wrap {
	    width: 100%;
	    padding: 16px 0;
	    position: relative;
	}
	
	#fixed-bar #fixed-bar-wrap .fixed-logo {
		margin-bottom: 5px;	
		margin-left: 10%;
	}
	
	#header-search-input {
		position: absolute;
		top:30px;
		margin-left: 30px;
		width: 400px;
		padding: 8px 0;
		text-indent: 8px;
		font-size: 16px;
		color: #212529;
		background-color: transparent;
		border: 2px solid #FEE500;
		border-radius: 5px;
	}
	
	#header-search-button {
		all: unset;
		position: absolute;
		top: 40px;
		margin-left: 395px;
	}
	
	#fixed-bar .header-menu-list {
		position: absolute;
		top: 40px;
		left: 70rem;
		list-style-type: none;
	}
	
	#fixed-bar .header-menu-list .header-menu-item {
		display: inline-block;
		margin-right: 1.5rem;
	}
	
	#fixed-bar .header-menu-list .header-menu-item .menu-link {
		text-decoration: none;
		color: #212529;
		font-weight: bold;
		padding: 3px;
	}
	
	#fixed-bar .header-menu-list .header-menu-item .menu-link:active {
		border-radius: 7px;
		border: 1px solid #FEE500;
		background-color: #FEE500;
	}
	
	#al-msg {
		position:absolute;
		top: -2px;
		display: inline-block;
		margin-top: -2px;
	}
	
	#al-msg:active {
		opacity: 0.6;
	}
	
	#al-msg img {
		width: 30px;
		height: 30px;
	}
	
	#al-cnt {
		display: inline-block;
		position: absolute;
		top: -9px;
		color: #212529;
		font-weight: bold;
		background-color: #FEE500;
		padding:0 5px;
		margin-left: 14px;
		border-radius: 10px;
	}
	
	.modal {
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal_overlay {
            width: 100%;
            height: 100%;
            position: absolute;
        }

        .modal_content {
            position: absolute;
            padding: 20px 20px;
            background-color: white;
            text-align: left;
            top: 100px;
            right: 5px; 
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            border-radius: 10px;
            width: 25%;
            font-size: 20px;
        }
        
        .modal_content ul{
        	list-style-type: none;
        }
        .modal_content ul li{
			margin-bottom: 8px;
			border-bottom: 1px solid #ccc;
        }
        .modal_content ul li:hover{
        	background-color: #FEE500;
        }
        .modal_content ul li:first-child{
        	border-top: 1px solid #ccc;
        }
        
        .modal_content ul .ra-id,
        .modal_content ul .ra-title {
        	font-weight: bold;
        }
        .modal_content ul .ra-date {
        	font-size: 16px;
        	color: #666;
        	margin-left: 10px;
        }
        
</style>
<script type="text/javascript">
$(document).ready(function() {
    $("#header-search-button").click(function() {
    	var search = $("#header-search-input").val();
		location.href="http://localhost:9000/banana/search.do?search="+search;
    });
});
</script>
</head>
<body>
	<header id="fixed-bar" class="fixed-bar-box-shadow">
		<div id="fixed-bar-wrap">
			<img class="fixed-logo" src="http://localhost:9000/banana/images/logo1.png"
			 onclick="location.href='http://localhost:9000/banana/index.do'">
			<input type="text" id="header-search-input" placeholder="동네 이름, 물품명 등을 검색해보세요!">
			<button id="header-search-button">
				<img src="http://localhost:9000/banana/images/search-icon.svg">
			</button>
			<c:choose>
				<c:when test="${ svo.nickname eq '관리자'}">
					<ul class="header-menu-list">
						<li id="name-area" class="header-menu-item"><a class="menu-link" href="#">${ svo.nickname }님</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/logout.do">로그아웃</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/memberManage.do">회원 관리</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/boardSubjectManage.do">동네생활 관리</a></li>
					</ul>
				</c:when>
				<c:when test="${ svo ne null }">
					<ul class="header-menu-list">
						<li id="name-area" class="header-menu-item"><a class="menu-link" href="#">${ svo.nickname }님</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/logout.do">로그아웃</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/mypage.do">나의 바나나</a></li> 	
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/popularProduct.do">바나나 매물</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/dongneLife.do">동네생활</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/neighborhood.do">내 근처</a></li>
						<li class="header-menu-item">
							<div id="al-msg">
								<div id="al-cnt"></div>
								<img src="http://localhost:9000/banana/images/알림.png">
							</div>
							<div class="modal" style="display:none">
								<div class="modal_overlay"></div>
								<div class="modal_content">
									<div class="review-al-content">
										<span>우리동네 알림</span>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="header-menu-list">
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/login.do">로그인</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/join.do">회원가입</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/popularProduct.do">바나나 매물</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/dongneLife.do">동네생활</a></li>
						<li class="header-menu-item"><a class="menu-link" href="http://localhost:9000/banana/neighborhood.do">내 근처</a></li>
					</ul>
				</c:otherwise>
			</c:choose> 
		</div>
	</header>
</body>
</html>