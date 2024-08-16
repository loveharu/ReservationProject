<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카카오맵 서비스</title>
<link rel="stylesheet" href="/ex/resources/css/mapServiceStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c441b3b3b2ef1a8131497b58ac1bae64&libraries=services,clusterer,drawing"></script>
<script>
	$(document)
			.ready(
					function() {
						var mapContainer = document.getElementById('map'), mapOption = {
							center : new kakao.maps.LatLng(37.4911, 126.7221),
							level : 3
						};
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 서버에서 마커 데이터를 받아와서 표시합니다.
						$
								.ajax({
									url : '/ex/getMarkers',
									method : 'GET',
									dataType : 'json', // JSON 데이터 형식으로 요청
									success : function(data) {
										if (Array.isArray(data)) { // 데이터가 배열인지 확인
											data
													.forEach(function(
															markerData) {
														var markerPosition = new kakao.maps.LatLng(
																markerData.lat,
																markerData.lng);
														var marker = new kakao.maps.Marker(
																{
																	position : markerPosition,
																	map : map
																});

														var infowindow = new kakao.maps.InfoWindow(
																{
																	content : `<div style="padding:5px;">${markerData.name}</div>`
																});

														kakao.maps.event
																.addListener(
																		marker,
																		'click',
																		function() {
																			infowindow
																					.open(
																							map,
																							marker);
																		});
													});
										} else {
											console.error(
													'Unexpected data format:',
													data);
										}
									},
									error : function(xhr, status, error) {
										console.error(
												'Error fetching markers:',
												status, error);
									}
								});
						$('#searchButton')
								.click(
										function() {
											var query = $('#searchInput').val();

											$
													.ajax({
														url : '/ex/searchMarkers',
														method : 'GET',
														data : {
															query : query
														}, // 검색어를 쿼리 파라미터로 전송
														dataType : 'json',
														success : function(data) {
															if (Array
																	.isArray(data)) {
																clearMarkers(); // 기존 마커 제거
																data
																		.forEach(function(
																				markerData) {
																			var markerPosition = new kakao.maps.LatLng(
																					markerData.lat,
																					markerData.lng);
																			var marker = new kakao.maps.Marker(
																					{
																						position : markerPosition,
																						map : map
																					});
																			markers
																					.push(marker); // 새로 추가된 마커 배열에 저장

																			var infowindow = new kakao.maps.InfoWindow(
																					{
																						content : `<div style="padding:5px;">${markerData.name}</div>`
																					});

																			kakao.maps.event
																					.addListener(
																							marker,
																							'click',
																							function() {
																								infowindow
																										.open(
																												map,
																												marker);
																							});
																		});
															} else {
																console
																		.error(
																				'Unexpected data format:',
																				data);
															}
														},
														error : function(xhr,
																status, error) {
															console
																	.error(
																			'Error fetching markers:',
																			status,
																			error);
														}
													});
										});
						var markers = [];

						kakao.maps.event
								.addListener(
										map,
										'rightclick',
										function(mouseEvent) {
											var latlng = mouseEvent.latLng;

											var marker = new kakao.maps.Marker(
													{
														position : latlng,
														map : map
													});

											markers.push(marker);

											kakao.maps.event
													.addListener(
															marker,
															'click',
															function() {
																marker
																		.setMap(null);
																markers = markers
																		.filter(function(
																				m) {
																			return m !== marker;
																		});
															});
										});
					});
</script>
</head>
<body>
	<div class="app">
		<header class="header">
			<h1>어디로든 놀러가</h1>
		</header>
		<div class="container">
			<div class="search-section">
				<!-- 			      해당 폼에 대한 키워드처리를 컨트롤러에서해준다 키워드 이름은 query이다. -->
				<form action="/search" method="get" class="search-form">
					<input type="text" name="query" placeholder="업체를 검색하세요"
						class="search-input" />
					<button type="submit" class="search-button">검색</button>
				</form>
				<ul class="search-results">
					<c:forEach var="result" items="${results}">
						<li class="search-result-item">${result}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="map" class="map"></div>
		</div>
	</div>
</body>
</html>
