<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<style>
.acontainer {
	width: 400px;
	margin: 0 auto;
}

#time-buttons {
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	gap: 5px;
	margin-top: 20px;
}

.time-slot {
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
	cursor: pointer;
}

.time-slot.selected {
	background-color: #FFEB33;
	color: #535252;
}
</style>


<%@include file="../include/header.jsp"%>
<div class="header-placeholder"></div>
<div class="content">
<br><br>

loginEmail: [${sessionScope.loginEmail}] , <br>
loginBusiness_regi_num: [${sessionScope.loginBusiness_regi_num}] ,<br>
loginName: [${sessionScope.loginName}]

<br>


<div class="acontainer">
    <!-- <h1>영업일 및 영업시간 선택</h1> -->
    <br><br>
    <input type="text" id="datepicker" placeholder="날짜를 선택하세요">
    <div id="time-buttons"></div>
    <button type="button" id="submitBtn">전송</button>
</div>

</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../resources/js/scheduleinsert.js"></script>
<%@include file="../include/footer.jsp"%>
