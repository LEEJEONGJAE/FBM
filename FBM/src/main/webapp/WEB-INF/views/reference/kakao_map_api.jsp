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
		<button onclick="zoomIn();">Ȯ��</button>
		<button onclick="zoomOut();">���</button>
		<button onclick="testAddr();">�׽�Ʈ</button>
	</div>
	<div style="width:600px;height:400px;">
		<div id="daumMap" style="width:100%;height:100%;"></div>
	</div>
	<script>
		
		var addrs = [
			'��⵵ �Ȼ�� �ܿ��� �����߾ӱ� 28, 101�� 304ȣ'
		];
		
		//�̷����� ���� ��ǥ(default)
		var mirae_x = 37.5075982;
		var mirae_y = 127.0577237;
		
		
		var container = document.getElementById('daumMap');
		var options = {
			center: new daum.maps.LatLng(mirae_x, mirae_y),
			level: 3
		};
		
		var map = new daum.maps.Map(container, options);
		
		
		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�.
		var geocoder = new daum.maps.services.Geocoder();
				
		
			/*
			** �����ּ� �ʿ�
			*/
			var addr = '��⵵ �Ȼ�� �ܿ��� �����߾ӱ� 28, 101�� 304ȣ'; //�ּҿ��� �޸���ȭ�� ����   ��
			
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
				
				// �ּҷ� ��ǥ�� �˻��մϴ�.
				geocoder.addressSearch(addr, function(result, status) {
				    // ���������� �˻��� �Ϸ������ 
				     if (status === daum.maps.services.Status.OK) {
				     				    	 
				    	 x = result[0].x;
				    	 y = result[0].y;
				    	 
				    	 coords = new daum.maps.LatLng(y, x);
				
				        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        
					     // Ŀ���� �������̿� ǥ���� ������ �Դϴ�.
					     // Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
					     // ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ�.
					     
					     if (newAddr != "") {
							
						     var content = '<div class="wrap">' + 
						                 '    <div class="info">' + 
						                 '        <div class="title">' + 
						                 '            [������ �Է�]' + 
						                 '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
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
						                 '            [������ �Է�]' + 
						                 '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
						                 '        </div>' + 
						                 '        <div class="body">' + 
						                 '            <div class="desc">' + 
						                 '                <div class="ellipsis">' + addr + '</div>' + 
						                 '            </div>' + 
						                 '        </div>' + 
						                 '    </div>' +    
						                 '</div>';
						}
			
					     // ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
					     // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
					     overlay = new daum.maps.CustomOverlay({
					         content: content,
					         map: map,
					         position: marker.getPosition()       
					     });
			
					     // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
					     daum.maps.event.addListener(marker, 'click', function() {
					         overlay.setMap(map);
					     });
			
				
				        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
						/*
						** ������ �ʿ�
						*/
	//	 		        var infowindow = new daum.maps.InfoWindow({
	//	 		            content: '<div style="width:150px;text-align:center;padding:6px 0;">������</div>'
	//	 		        });
	//	 		        infowindow.open(map, marker);
				
				        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
				        map.setCenter(coords);
				        
				    	console.log("�ּҰ˻� ����");
				        
				    }else{
				    	if (newAddr == "") {
							console.log("�ּ� ��˻�");
							console.log("addr : " + addr );
							
							var indexCom = addr.indexOf(',');
							console.log("indexCom : " + indexCom);
							if(indexCom > -1){
								var addr_ss = addr.substring(0, indexCom);
								addrSearch(addr, addr_ss);
								
							}else{
								console.log("�ּҰ˻� ����");
						    	
							}
						}else{
					    	console.log("�ּҰ˻� ����");
						
						}
				    }
				});    
			
			}
			
			// Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
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
// 				// �ּҷ� ��ǥ�� �˻��մϴ�.
// 	// 			geocoder.addr2coord(addr, function(status, result) {
// 				geocoder.addr2coord(addr, function(status, result) {
				
// 				    // ���������� �˻��� �Ϸ������ 
// 				     if (status === daum.maps.services.Status.OK) {
				    	 
// 				    	 x = result.addr[0].lat;
// 				    	 y = result.addr[0].lng;

				    	 
// 				    	 coords = new daum.maps.LatLng(x, y);
				
// 				        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
// 				        var marker = new daum.maps.Marker({
// 				            map: map,
// 				            position: coords
// 				        });
				        
				        
// 					     // Ŀ���� �������̿� ǥ���� ������ �Դϴ�.
// 					     // Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
// 					     // ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ�.
					    
// 					     if (newAddr != "") {
// 					    	 var content = '<div class="wrap">' + 
// 			                 '    <div class="info">' + 
// 			                 '        <div class="title">' + 
// 			                 '            [������ �Է�]' + 
// 			                 '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
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
// 			                 '            [������ �Է�]' + 
// 			                 '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
// 			                 '        </div>' + 
// 			                 '        <div class="body">' + 
// 			                 '            <div class="desc">' + 
// 			                 '                <div class="ellipsis">' + newAddr + '</div>' + 
// 			                 '            </div>' + 
// 			                 '        </div>' + 
// 			                 '    </div>' +    
// 			                 '</div>';
// 						}
					     
			
// 					     // ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
// 					     // ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
// 					     overlay = new daum.maps.CustomOverlay({
// 					         content: content,
// 					         map: map,
// 					         position: marker.getPosition()       
// 					     });
			
// 					     // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
// 					     daum.maps.event.addListener(marker, 'click', function() {
// 					         overlay.setMap(map);
// 					     });
			
				
// 				        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
// 						/*
// 						** ������ �ʿ�
// 						*/
// 	//	 		        var infowindow = new daum.maps.InfoWindow({
// 	//	 		            content: '<div style="width:150px;text-align:center;padding:6px 0;">������</div>'
// 	//	 		        });
// 	//	 		        infowindow.open(map, marker);
				
// 				        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
// 				        map.setCenter(coords);
				        
// 						console.log("[����]");
				        
				        
// 				    }else{
				    	
// 				    	if (newAddr == "") {
// 							console.log("�ּ� ��˻�");
// 							console.log("addr : " + addr );
							
// 							var indexCom = addr.indexOf(',');
// 							console.log("indexCom : " + indexCom);
							
// 							if(indexCom > -1){
// 								var addr_ss = addr.substring(0, indexCom);
// 								testAddr(addr, addr_ss);
								
// 							}else{
// 								console.log("�ּҰ˻� ����");
						    	
// 							}
// 						}else{
// 					    	console.log("�ּҰ˻� ����");
						
// 						}
// 				    }
				    
				  
// 				});
				
// 		}//end function testAddr()
		
		
		//Ȯ��, ���
		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(map, 'zoom_changed', function() {        
		    
			map.setCenter(coords);
			
		});
		
		//Ȯ�� btn
		function zoomIn(){
			var level = map.getLevel();
			map.setLevel(level - 1);
		}
		
		//��� btn
		function zoomOut(){
			var level = map.getLevel();
			map.setLevel(level + 1);
		}
		
		//Ȯ��, ���
		
		
		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(status, result) {
		    if (status === daum.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		        infoDiv.innerHTML = result[0].fullName;
		    }    
		}
		
	</script>
</body>
	
</html>