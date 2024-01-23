<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<c:set var="loginId" value="${pageContext.request.session.getAttribute('id')==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<header>
		<h1>Groupware / 인사</h1>
		<nav>
			<a href="<c:url value='/overview'/>">전체 개요</a>
			<a href="<c:url value='/employee/show'/>">직원 정보</a>
			<a href="<c:url value='/training'/>">교육 및 훈련</a>
			<a href="<c:url value='/event'/>">이벤트 및 소식</a>
			<a href="<c:url value='/board/list'/>">게시판</a>
			<a href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
		</nav>

	</header>
	<!-- 여기에 스타일 및 필요한 메타태그 추가 -->

	<style>
		body {
			font-family: 'Arial', sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f0f0f0;
		}

		header {
			background-color: #003366;
			color: #fff;
			padding: 20px;
			text-align: center;
			position: relative;
		}

		header h1 {
			font-size: 2em;
			margin: 0;
			position: absolute;
			top: 10px;
			left: 20px;
		}

		nav {
			margin-top: 20px;
		}

		header a {
			color: #fff;
			text-decoration: none;
			margin: 0 20px;
			font-size: 1.2em;
		}

		.form-group label {
			width: 120px;
			margin-right: 10px;
		}


		footer {
			background-color: #003366;
			color: #fff;
			text-align: center;
			padding: 20px;
			position: fixed;
			bottom: 0;
			width: 100%;
		}


	</style>
</head>



