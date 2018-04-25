<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
picture {display: block; width: 100%; text-align: center;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Daum Map</title>
<link rel="stylesheet" href="css/reference/kakao_map.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64411ad6f0bd0929bf1dbab38dbb0aaa&libraries=services"></script>
</head>
<body>
	<div>
		<button onclick="zoomIn();">확대</button>
		<button onclick="zoomOut();">축소</button>
		<button onclick="testAddr();">테스트</button>
	</div>
	<div style="width:600px;height:400px;">
		<div id="daumMap" style="width:100%;height:100%;"></div>
	</div>
	<script>
		
		var addrs = [
			'경기도 안산시 단원구 인현중앙길 28, 101동 304호'
		];
		
		//미래에셋 강남 좌표(default)
		var mirae_x = 37.5075982;
		var mirae_y = 127.0577237;
		
		
		var container = document.getElementById('daumMap');
		var options = {
			center: new daum.maps.LatLng(mirae_x, mirae_y),
			level: 3
		};
		
		var map = new daum.maps.Map(container, options);
		
		
		// 주소-좌표 변환 객체를 생성합니다.
		var geocoder = new daum.maps.services.Geocoder();
				
		
			/*
			** 지점주소 필요
			*/
			var addr = '경기도 안산시 단원구 인현중앙길 28, 101동 304호'; //주소에서 메리츠화재 빼면   뜸
			
			var x = 0;
			var y = 0;
			var coords;
			
			
			(function() {
				addrSearch(addr, "");
			
			}());

			
			function addrSearch(oriAddr, newAddr){
				
				if (newAddr != "") {
					addr = newAddr;
				}else{
					addr = oriAddr;
				}
				
				// 주소로 좌표를 검색합니다.
				geocoder.addressSearch(addr, function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				     				    	 
				    	 x = result[0].x;
				    	 y = result[0].y;
				    	 
				    	 coords = new daum.maps.LatLng(y, x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        
					     // 커스텀 오버레이에 표시할 컨텐츠 입니다.
					     // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
					     // 별도의 이벤트 메소드를 제공하지 않습니다.
					     
					     if (newAddr != "") {
							
						     var content = '<div class="wrap">' + 
						                 '    <div class="info">' + 
						                 '        <div class="title">' + 
						                 '            [지점명 입력]' + 
						                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						                 '        </div>' + 
						                 '        <div class="body">' + 
						                 '            <div class="desc">' + 
						                 '                <div class="ellipsis">' + oriAddr + '</div>' + 
						                 '            </div>' + 
						                 '        </div>' + 
						                 '    </div>' +    
						                 '</div>';
						}else{
						     var content = '<div class="wrap">' + 
						                 '    <div class="info">' + 
						                 '        <div class="title">' + 
						                 '            [지점명 입력]' + 
						                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						                 '        </div>' + 
						                 '        <div class="body">' + 
						                 '            <div class="desc">' + 
						                 '                <div class="ellipsis">' + addr + '</div>' + 
						                 '            </div>' + 
						                 '        </div>' + 
						                 '    </div>' +    
						                 '</div>';
						}
			
					     // 마커 위에 커스텀오버레이를 표시합니다
					     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					     overlay = new daum.maps.CustomOverlay({
					         content: content,
					         map: map,
					         position: marker.getPosition()       
					     });
			
					     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					     daum.maps.event.addListener(marker, 'click', function() {
					         overlay.setMap(map);
					     });
			
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
						/*
						** 지점명 필요
						*/
	//	 		        var infowindow = new daum.maps.InfoWindow({
	//	 		            content: '<div style="width:150px;text-align:center;padding:6px 0;">지점명</div>'
	//	 		        });
	//	 		        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				        
				    	console.log("주소검색 성공");
				        
				    }else{
				    	if (newAddr == "") {
							console.log("주소 재검색");
							console.log("addr : " + addr );
							
							var indexCom = addr.indexOf(',');
							console.log("indexCom : " + indexCom);
							if(indexCom > -1){
								var addr_ss = addr.substring(0, indexCom);
								addrSearch(addr, addr_ss);
								
							}else{
								console.log("주소검색 실패");
						    	
							}
						}else{
					    	console.log("주소검색 실패");
						
						}
				    }
				});    
			
			}
			
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		     function closeOverlay() {
		         overlay.setMap(null);     
		     }
			
			
// 		function testAddr(oriAddr, newAddr){	
				
// 				console.log("oriaddr : " + oriAddr);
// 				console.log("newAddr : " + newAddr);
				
// 				if (newAddr != "") {
// 					addr = newAddr;
					
// 				}else{
// 					addr = oriAddr;
					
// 				}
				
// // 				console.log("test" + addr);
// // 				console.log("test : " + i);
// 				// 주소로 좌표를 검색합니다.
// 	// 			geocoder.addr2coord(addr, function(status, result) {
// 				geocoder.addr2coord(addr, function(status, result) {
				
// 				    // 정상적으로 검색이 완료됐으면 
// 				     if (status === daum.maps.services.Status.OK) {
				    	 
// 				    	 x = result.addr[0].lat;
// 				    	 y = result.addr[0].lng;

				    	 
// 				    	 coords = new daum.maps.LatLng(x, y);
				
// 				        // 결과값으로 받은 위치를 마커로 표시합니다
// 				        var marker = new daum.maps.Marker({
// 				            map: map,
// 				            position: coords
// 				        });
				        
				        
// 					     // 커스텀 오버레이에 표시할 컨텐츠 입니다.
// 					     // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 					     // 별도의 이벤트 메소드를 제공하지 않습니다.
					    
// 					     if (newAddr != "") {
// 					    	 var content = '<div class="wrap">' + 
// 			                 '    <div class="info">' + 
// 			                 '        <div class="title">' + 
// 			                 '            [지점명 입력]' + 
// 			                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
// 			                 '        </div>' + 
// 			                 '        <div class="body">' + 
// 			                 '            <div class="desc">' + 
// 			                 '                <div class="ellipsis">' + oriAddr + '</div>' + 
// 			                 '            </div>' + 
// 			                 '        </div>' + 
// 			                 '    </div>' +    
// 			                 '</div>';
// 						}else{
// 							var content = '<div class="wrap">' + 
// 			                 '    <div class="info">' + 
// 			                 '        <div class="title">' + 
// 			                 '            [지점명 입력]' + 
// 			                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
// 			                 '        </div>' + 
// 			                 '        <div class="body">' + 
// 			                 '            <div class="desc">' + 
// 			                 '                <div class="ellipsis">' + newAddr + '</div>' + 
// 			                 '            </div>' + 
// 			                 '        </div>' + 
// 			                 '    </div>' +    
// 			                 '</div>';
// 						}
					     
			
// 					     // 마커 위에 커스텀오버레이를 표시합니다
// 					     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
// 					     overlay = new daum.maps.CustomOverlay({
// 					         content: content,
// 					         map: map,
// 					         position: marker.getPosition()       
// 					     });
			
// 					     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// 					     daum.maps.event.addListener(marker, 'click', function() {
// 					         overlay.setMap(map);
// 					     });
			
				
// 				        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 						/*
// 						** 지점명 필요
// 						*/
// 	//	 		        var infowindow = new daum.maps.InfoWindow({
// 	//	 		            content: '<div style="width:150px;text-align:center;padding:6px 0;">지점명</div>'
// 	//	 		        });
// 	//	 		        infowindow.open(map, marker);
				
// 				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
// 				        map.setCenter(coords);
				        
// 						console.log("[성공]");
				        
				        
// 				    }else{
				    	
// 				    	if (newAddr == "") {
// 							console.log("주소 재검색");
// 							console.log("addr : " + addr );
							
// 							var indexCom = addr.indexOf(',');
// 							console.log("indexCom : " + indexCom);
							
// 							if(indexCom > -1){
// 								var addr_ss = addr.substring(0, indexCom);
// 								testAddr(addr, addr_ss);
								
// 							}else{
// 								console.log("주소검색 실패");
						    	
// 							}
// 						}else{
// 					    	console.log("주소검색 실패");
						
// 						}
// 				    }
				    
				  
// 				});
				
// 		}//end function testAddr()
		
		
		//확대, 축소
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'zoom_changed', function() {        
		    
			map.setCenter(coords);
			
		});
		
		//확대 btn
		function zoomIn(){
			var level = map.getLevel();
			map.setLevel(level - 1);
		}
		
		//축소 btn
		function zoomOut(){
			var level = map.getLevel();
			map.setLevel(level + 1);
		}
		
		//확대, 축소
		
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		        infoDiv.innerHTML = result[0].fullName;
		    }    
		}
		
	</script>
</body>
	
</html>