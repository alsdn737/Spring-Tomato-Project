<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%-- <%@ page session="false" %> --%>
<!DOCTYPE html>
<html>
<head>
	<title>TomatoMeetingRoom予約システム_ログイン</title>
	<link rel="stylesheet" type="text/css" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="login">
		<div class="top">サイン画面</div>
		<div class="body">
			<form:form action="${pageContext.request.contextPath}/authentication" method="post">
			<div class="left">
				<ul>
					<li>
						ユーザ番号<input type="text" id="user_id" name="user_id">
					</li>
					<li>
						パスワード<input type="password" id="user_password" name="user_password">
					</li>
				</ul>
			</div>
			<div class="right">
				<input type="submit" value="Login" class="button login_button">
			</div>
			</form:form>
			<div class="clear message">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
		</div>
	</div>
</body>
</html>