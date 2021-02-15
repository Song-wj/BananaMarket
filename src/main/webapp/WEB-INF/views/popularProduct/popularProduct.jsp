<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 매물</title>
<script src="http://localhost:9000/banana/js/jquery-3.5.1.min.js"></script>
<style>
	div.content{
		width:55%;
		margin:auto;
		margin-top:150px;
		margin-bottom:230px;
	}
	h1.ph3{
		text-align:center;
	}
	div.content>div.select_div{
		text-align:right;
	}
	div.content>div.select_div select{
		height:50px;
		font-size:17px;
	} 
	div.content>div.product{
		margin-top:50px;
	}
	div.content>div.product div.plist a{
		text-decoration:none;
	}
	div.content>div.product div.plist{
		display:inline-block;
		width:190px;
		height:370px;
		margin-left:55px;
	}
	div.content>div.product div.plist img{
		width:190px;
		height:190px;
		border-radius:20%;
		border:3px solid #FEE500;
	}
	div.content>div.product div.plist label{
		display:block;
		cursor:pointer;
	}
	div.content>div.product div.plist label.ptitle{
	    font-size:17px;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	div.content>div.product div.plist label.pprice{
		font-weight:bold;
		font-size:17px;
	}
	div.content>div.product div.plist label.loc{
		font-size:15px;
	}
	div.content>div.product div.plist span{
		font-size:13px;
		color:gray;
	}
	div.content>div.pbanner div:first-child,
	div.content>div.pbanner div:nth-child(2),
	div.content>div.pbanner div:last-child{
		display:inline-block;
		background-color:#FEE500;
		border-radius:50%;
		position:fixed;
		right:30px;
	}
	div.content>div.pbanner div:first-child{
		bottom:270px;
		visibility:hidden;
	}
	div.content>div.pbanner div:nth-child(2){
		bottom:220px;
		visibility:hidden;
	}
	div.content>div.pbanner div:last-child{
		bottom:150px;
		transition: all ease 1s;
	}
	div.content>div.pbanner div label{
		display:inline-block;	
		margin-right:10px;
		font-weight:bold;
		float:left;
		margin-top:15px;
	}
	div.content>div.pbanner div button{
		border:1px solid white;
		background-color:white;
		border-radius:50%;	
	}
	div.content>div.pbanner div img{
		width:50px;
		height:45px;
	}		
	div.content>div.pbanner div:last-child:active {
		transform: rotate( 180deg );
	}
		
</style>
<script>
 	$(document).ready(function(){
 		
 		var chk = 0;
		$( 'button#plus' ).click( function() {
			
				$("#plus").css("transform"," rotate( 180deg )");
				
			if(chk ==0 ){
			 	$("#pstore").css("visibility","visible");
			 	$("#pwrite").css("visibility","visible");
			 	$(".pstore").css("visibility","visible");
			 	$(".pwrite").css("visibility","visible");
			 	chk = 1;
			}else{				
			 	$("#pstore").css("visibility","hidden");
			 	$("#pwrite").css("visibility","hidden");
			 	$(".pstore").css("visibility","hidden");
			 	$(".pwrite").css("visibility","hidden");
			 	chk=0;
			} 
		});		
 	})
 	
 	
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content">
		<h1 class="ph3">중고거래 인기매물</h1>
		<div class="select_div">
			<select name="select_loc" class="select_loc" >
			    <option value="none">지역을 선택하세요</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="울산광역시">울산광역시</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="경기도">경기도</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="제주특별자치도">	제주특별자치도</option>	
			</select>
			<select  name ="select_dongne" class="select_dongne" disabled>
				<option value="none">동네를 선택하세요</option>
			</select>
		</div> <!-- select_div -->
		<div class ="product">
			<c:forEach var="vo"  items="${list}"  varStatus="status" >
				
			<div class="plist">
				<c:if test="${vo.psfile ne null }"> 
					<a href="productContent.do?pid=${vo.pid}">
                         <img src="http://localhost:9000/banana/resources/upload/${vo.psfile }">
						</a> 
                 </c:if>      
					<label class="ptitle">${vo.ptitle }</label>
					<label class="pprice"><fmt:formatNumber value="${vo.pprice }" pattern="###,###"/>원</label>
					<label class="loc">서울 강남구 역삼동</label>
					<span class="interest">관심 ${vo.plike }</span>&nbsp;&nbsp;<span class="chat">조회 ${vo.phits}</span>
					
			</div>
			</c:forEach>
			</div> <!-- product -->
		<div class="pbanner">
			<div><a href="promoteDongne.do"><label class="pstore">동네홍보</label><button type="button" id="pstore"><img src="images/pstore.png"></button></a></div>
			<div><a href="writePage.do?mid=${vo.mid }"><label class="pwrite">중고거래</label><button type="button" id="pwrite"><img src="images/pwrite.png"></button></a></div>
			<div><button type="button" id="plus"><img src="images/picon.png"></button></div>
		</div> <!-- banner -->
	</div> <!-- content -->
	<jsp:include page="../footer.jsp" />
</body>
</html>