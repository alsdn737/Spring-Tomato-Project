<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>TomatoMeetingRoom予約システム_メイン</title>
	<link rel="stylesheet" type="text/css" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="top">
			<div class="logo">
					TomatoMeetingRoom予約システム
			</div>
			<div class="logout">
				<form:form  action="./logout" method="post">
					<input type="submit" value="ログアウト" class="button logout_button">
				</form:form>

			</div>
			<div class="clear fooder">
				<div class="loginUser">
					よこそう：<sec:authentication property="principal.Username" />さん
				</div>
				<div class="menu">
					<ul>
						<li><input type="button" onclick="window.location.href='reservation'" value="予約" class="button logout_button"></li>
						<sec:authorize  access="hasRole('ROLE_ADMIN')">
						<li><input type="button" value="ユーザ管理"
						onclick="window.location.href='list'"
						class="button logout_button"></li>
						<li><input type="button" value="会議室管理"
						onclick="window.location.href='mrrList'"
						class="button logout_button"></li>
						</sec:authorize>
					</ul>
				</div>
			</div>
	</div>
	<div id="container">

	</div>
</body>
</html>