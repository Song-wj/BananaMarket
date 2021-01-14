<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	div.login{
		width:25%;
		margin:auto;
	}
	section.section_login>div>form.login>ul>li{
		list-style-type:none;
		margin-left:-42px;
		margin-top:3px;
	}
	section.section_login>div>form.login>ul>li>ul>li{
		list-style-type:none;
		margin-top:10px;
		display:inline-block;
	}
	section.section_login>div>form.login>ul>li>ul{
		margin-left:24px;
	}
	
	section.section_login>div>form.login>ul>li>ul>li>div{
		background-color:lightgray;
     	width:1px; 
     	height:11px;
     	display:inline-block;
	}
	section.section_login>div>form.login>ul>li>ul>li>a{
		text-decoration:none;
		font-size:13px;
      	color:#333;
		margin:0 15px 0 10px;	
	}
	section.section_login>div>form.login>ul>li>input{
		padding:15px 0;
		border:1px solid lightgray;
		border-radius:5px;
		width:100%;
		text-indent:10px;
		font-size:17px;
	}
	section.section_login>div>form.login>ul>li:first-child>input{
		border-bottom-left-radius:0px;
		border-bottom-right-radius:0px;
	}
	section.section_login>div>form.login>ul>li:nth-child(2)>input{
		border-top-left-radius:0px;
		border-top-right-radius:0px;
	}
	section.section_login>div>form.login>ul>li:nth-child(2){
		margin-top:-1px;
	}
	
</style>
</head>
<body>
	<div class="login">
		<section class="section_login">
			<div>
				<form name="loginForm" action="login_proc.do" method="post" class="login">
					<h1>로그인</h1>
					<ul>
						<li>
							<input type="text" name="id" placeholder="아이디 입력" id="id">
						</li>
						<li>
							<input type="password" name="pass" placeholder="비밀번호 입력" id="pass">
							<div id="errMsg">에러메세지</div>
						</li>
						<li>
							<button type="button" class="btn_style" id="btnLogin">로그인</button>
						</li>
						<li>
							<ul>
								<li>
		                     		<a href=""><span>아이디 찾기</span></a><div></div>
		                  		</li>
		                  		<li>
		                     		<a href=""><span>비밀번호 찾기</span></a><div></div>
		                  		</li>
		                  		<li>
		                     		<a href=""><span>회원가입</span></a>
		                  		</li>
							</ul>
						</li>
					</ul>
				</form>
			</div>
		</section>
	</div>
</body>
</html>