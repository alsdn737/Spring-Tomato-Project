<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TomatoMeetingRoom予約システム_会議室管理</title>
	<link rel="stylesheet" type="text/css" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/meetingRoomManage.css">
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
					よこそう：<sec:authentication property="name"/>さん
				</div>
				<div class="menu">
					<ul>
						<li><input type="button" value="予約"  onclick="window.location.href='reservation'" class="button logout_button"></li>
						<li><input type="button" value="ユーザ管理" onclick="window.location.href='list'" class="button logout_button"></li>
						<li><input type="button" value="会議室管理"  onclick="window.location.href='mrrList'" class="button logout_button"></li>
					</ul>
				</div>
			</div>
	</div>
</body>
</html>