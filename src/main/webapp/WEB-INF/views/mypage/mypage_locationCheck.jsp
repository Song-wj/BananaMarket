<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 인증</title>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7ce94d4dd9c22ccad809655bc3ab74f&libraries=services"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function() {        
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 정기적으로 얻기
        var id = navigator.geolocation.watchPosition(
                function(pos) {
                   kakao_map(pos.coords.latitude, pos.coords.longitude);    // 위도 
                  // 경도 
                });
        
        // 버튼 클릭으로 감시를 중지
        $('#btnStop').click(function() {
            navigator.geolocation.clearWatch(id);
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }
    
});
	function kakao_map(latitude,longitude){
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			var ps = new kakao.maps.services.Places(); 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
			    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

			// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);

			// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
			 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			            
			            var content = '<div class="bAddr">' +
			                            '<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>';

			            // 마커를 클릭한 위치에 표시합니다 
			            marker.setPosition(mouseEvent.latLng);
			            marker.setMap(map);

			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, marker);
			        }   
			    });
			});
			 
			// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', function() {
			    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			});

			function searchAddrFromCoords(coords, callback) {
			    // 좌표로 행정동 주소 정보를 요청합니다
			    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
			}

			function searchDetailAddrFromCoords(coords, callback) {
			    // 좌표로 법정동 상세 주소 정보를 요청합니다
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}

			// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
			function displayCenterInfo(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        var infoDiv = document.getElementById('centerAddr');

			        for(var i = 0; i < result.length; i++) {
			            // 행정동의 region_type 값은 'H' 이므로
			            if (result[i].region_type === 'H') {
			                /* infoDiv.innerHTML = result[i].address_name; */
			             	chk(result[i].address_name.split(" "));
			                break;
			            }
			        }
			    }    
			}
			
			function chk(dong){
				
			 	$("#dong").html(dong[dong.length-1]); 
			}
		
	}
	 	</script>


</head>
<style>
	.mypage_locationCheck {
		width:98%;
		height:700px;
		margin:auto;
	}
	.mypage_locationCheck label:nth-child(1) {
		border:1px solid red;
	}
	.mypage_locationCheck label:nth-child(2){
		display:inline-block;
		font-size:20px;
		margin: 70px 0 0 300px;
	}
	.mypage_locationCheck label:nth-child(3) {
		display:inline-block;
		font-size:20px;
		color:rgb(98,71,24);
		text-shadow: -0.5px 0 #FEE500, 0 0.5px #FEE500,  0.5px 0 #FEE500, 0 -0.5px #FEE500;
		margin: 10px 0 40px 400px;
		
	}
	.mypage_locationCheck label:nth-child(3):hover{
		color:  #FEE500;
        text-shadow: -1px 0 rgb(98,71,24), 0 1px rgb(98,71,24),  1px 0 rgb(98,71,24), 0 -1px rgb(98,71,24);
	} 
	.mypage_locationCheck button {
		color:RGB(82,67,21);
		background-color:#FEE500;
		border:1px solid #FEE500;
		font-size:18px;
		font-weight:bold;
		width: 190px;
		height: 60px;
		margin: 0 420px; 
		padding:15px 17px;
		border-radius:5px;
     	}
    .mypage_locationCheck button:hover {
		opacity:0.7;
	}
	 #map {
		border:1px solid green;
		margin-top:50px;
		margin-left:190px;
		margin-bottom:50px;
		
	} 
	.map_wrap {
		position:relative;
		width:100%;
		height:350px;
	}
    .title {
    	font-weight:bold;
    	display:block;
    }
	.hAddr {
		position:absolute;
		left:10px;
		top:10px;
		border-radius: 2px;
		background:#fff;
		background:rgba(255,255,255,0.8);
		z-index:1;
		padding:5px;
	}
    #centerAddr {
    	display:block;
    	margin-top:2px;
    	font-weight: normal;
    }
    .bAddr {
    	padding:5px;
    	text-overflow: ellipsis;
    	overflow: hidden;
    	white-space: nowrap;
    }
</style>
<body>
	<div class="mypage_locationCheck">
		<section class="section1_locationCheck">
		<div class="map_wrap">
			<div id="map" style="width:650px;height:400px;"></div>
			<!--  <div class="hAddr">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
    		</div> -->
    	</div>
    		
			<label>현재 위치가 내 동네로 설정한 '<span id="dong"></span>'에 있습니다.</label>
			<label>왜 동네 인증을 해야하나요?</label><br>
			<button type="button">동네 인증 완료하기</button> 
		</section>
			
	</div>	
</body>
</html>