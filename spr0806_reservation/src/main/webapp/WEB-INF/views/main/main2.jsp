<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인(비로그인) 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff; /* 하얀색 배경 */
	color: #333;
}

header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 40px 20px; /* 상단 여백 추가 */
	background-color: #fff; /* 하얀색 배경 */
	border-bottom: 2px solid #d84315; /* 진한 주황색 테두리 */
	margin-bottom: 30px; /* 아래쪽 여백 추가 */
}

.header-left .logo {
	font-size: 24px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.header-center {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%; /* 전체 너비 사용 */
}

.header-center .search-form {
	display: flex;
	width: 60%; /* 검색폼의 너비를 60%로 설정 */
}

.header-center .search-form input[type="text"] {
	padding: 15px;
	font-size: 18px;
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	border-right: none; /* 오른쪽 테두리 제거 */
	border-radius: 10px 0 0 10px; /* 왼쪽 끝만 둥글게 */
	flex: 1;
}

.header-center .search-form button {
	padding: 15px 20px;
	font-size: 18px;
	cursor: pointer;
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	border-left: none; /* 왼쪽 테두리 제거 */
	background-color: #d84315; /* 진한 주황색 배경 */
	color: #fff; /* 흰색 글씨 */
	border-radius: 0 10px 10px 0; /* 오른쪽 끝만 둥글게 */
}

.header-center .icon-buttons {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.header-center .icon-buttons .icon {
	background-color: #d84315; /* 진한 주황색 배경 */
	border-radius: 10px; /* 둥근 모서리 */
	padding: 10px;
	margin: 0 10px;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
}

.header-right {
	position: relative; /* 드롭다운 메뉴의 위치를 상대적으로 설정 */
}

.header-right .menu-button {
	background: none;
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	font-size: 24px;
	cursor: pointer;
	border-radius: 0 0 10px 10px; /* 아래 양 끝 모서리 둥글게 */
}

.dropdown-menu {
	display: none;
	position: absolute;
	top: 50px; /* 드롭다운 메뉴의 위치 조정 */
	right: 0;
	background-color: #fff; /* 하얀색 배경 */
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	z-index: 1000; /* 드롭다운 메뉴를 최상위로 */
	min-width: 150px; /* 최소 너비 설정 */
}

.dropdown-menu a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #333;
	border-bottom: 1px solid #d84315; /* 진한 주황색 테두리 */
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
}

.dropdown-menu a:hover {
	background-color: #f0f0f0;
}

.content-container {
	display: flex;
	justify-content: center;
	align-items: flex-start; /* 상단 정렬 */
	padding: 0 20px;
	gap: 20px; /* 요소 간의 간격 추가 */
	max-width: 1200px; /* 최대 너비 설정 */
	margin: 0 auto; /* 중앙 정렬 */
}

nav, section, aside {
	background-color: #fff; /* 하얀색 배경 */
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	padding: 20px;
	margin: 0; /* 여백 초기화 */
	width: 100%; /* 전체 너비 사용 */
	max-width: 300px; /* 최대 너비 설정 */
}

nav {
	height: 200px; /* 슬라이더 높이 설정 */
}

section {
	flex: 1;
}

aside {
	width: 250px; /* 사이드바 너비 설정 */
}

section h2 {
	margin-top: 0;
}

section .notice {
	margin: 10px 0;
}

section .notice a {
	text-decoration: none;
	color: #333;
	border-bottom: 1px solid #d84315; /* 진한 주황색 테두리 */
}

section .notice a:hover {
	color: #d84315; /* 진한 주황색 */
}

table {
	border-collapse: collapse;
}

table img {
	max-width: 100%;
}

table p {
	margin: 0;
}

/* 여백을 추가하여 header 아래에 위치하도록 설정 */
.content-container {
	margin-top: 20px; /* 여백 조정 */
}

/* 로그인 및 회원가입 버튼 스타일 */
.header-right .login-button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 12px;
	color: #fff;
	background-color: #d84315; /* 진한 주황색 배경 */
	border: 2px solid #d84315; /* 진한 주황색 테두리 */
	border-radius: 4px; /* 네모 모서리 */
	text-decoration: none; /* 링크 기본 스타일 제거 */
	margin: 0 10px; /* 버튼 간격 조정 */
}

.header-right .login-button:hover {
	background-color: #b02e1b; /* 호버 시 어두운 주황색 */
	color: #fff;
}
</style>
<script>
	function toggleMenu() {
		var dropdownMenu = document.getElementById("dropdown-menu");
		dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none"
				: "block";
	}

	// 로그인이 되어 있는지 여부를 확인하는 함수
	function isLoggedIn() {
		// 실제로는 서버에서 세션 등을 통해 로그인 상태를 확인해야 함
		// 여기서는 예시로 간단히 true 또는 false를 반환
		return document.getElementById("login-status").value === "true";
	}

	window.onload = function() {
		if (isLoggedIn()) {
			document.getElementById("dropdown-menu").style.display = "block";
			document.getElementById("login-buttons").style.display = "none";
		} else {
			document.getElementById("dropdown-menu").style.display = "none";
			document.getElementById("login-buttons").style.display = "flex";
		}
	}
</script>
</head>
<body>
	<header>
		<div class="header-left">
			<a href="#" class="logo">A</a>
		</div>
		<div class="header-center">
			<form class="search-form">
				<input type="text" placeholder="검색어를 입력하세요...">
				<button type="submit">검색</button>
			</form>
			<div class="icon-buttons">
				<div class="icon">아이콘 1</div>
				<div class="icon">아이콘 2</div>
				<div class="icon">아이콘 3</div>
				<div class="icon">아이콘 4</div>
				<div class="icon">아이콘 5</div>
				<!-- 추가 아이콘을 여기서 추가하세요 -->
			</div>
		</div>
		<div class="header-right">
			<div id="login-buttons" style="display: flex;">
				<a href="ex/main/login" class="login-button">로그인</a> <a href="ex/main/join"
					class="login-button">회원가입</a>
			</div>
			<button id="dropdown-button" class="menu-button"
				onclick="toggleMenu()" style="display: none;">☰</button>
			<div id="dropdown-menu" class="dropdown-menu">
				<a href="/ex/my/myPage">마이 페이지</a> <a href="/ex/my/myCart">장바구니</a>
				<a href="/ex/my/myCoupon">쿠폰함</a>
			</div>
		</div>
		<input type="hidden" id="login-status" value="false" />
		<!-- 로그인이 되어 있는지 여부를 설정 -->
	</header>
	<div class="content-container">
		<nav>
			<div class="slider-container">
				<div class="slider-wrapper">
					<div class="slider-item">
						<img src="image1.jpg" alt="슬라이드 이미지 1">
					</div>
					<div class="slider-item">
						<img src="image2.jpg" alt="슬라이드 이미지 2">
					</div>
					<div class="slider-item">
						<img src="image3.jpg" alt="슬라이드 이미지 3">
					</div>
					<!-- 추가 이미지가 있다면 여기에 삽입 -->
				</div>
			</div>
		</nav>
		<section>
			<h2>공지사항</h2>
			<div class="notice">
				<a href="#">공지사항 제목 1</a>
			</div>
			<div class="notice">
				<a href="#">공지사항 제목 2</a>
			</div>
			<div class="notice">
				<a href="#">공지사항 제목 3</a>
			</div>
			<!-- 추가 공지사항이 있다면 여기에 삽입 -->
		</section>
		<aside>
			<h3>사용자 정보</h3>
			<div class="user-info">
				<p>이름: 사용자 이름</p>
				<p>이메일: user@example.com</p>
				<p>가입일: YYYY-MM-DD</p>
				<!-- 추가 사용자 정보가 있다면 여기에 삽입 -->
			</div>
		</aside>
	</div>
</body>
</html>
