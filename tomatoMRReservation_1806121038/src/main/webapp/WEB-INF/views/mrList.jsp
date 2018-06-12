<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TomatoMeetingRoom予約システム_メイン</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/userManage.css">

<script type="text/javascript">
	function colorChange(x) {
		if (x.className == "button_1") {
			x.className = "button_2";
		} else {
			x.className = "button_1";
		}
	}
</script>

</head>
<body>
	<div class="top">
		<div class="logo">TomatoMeetingRoom予約システム
		</div>
		<div class="logout">
			<form>
				<input type="button" value="ログアウト" class="button logout_button">
			</form>
		</div>
		<div class="clear fooder">
			<div class="loginUser">よこそう：趙添さん
			</div>
			<div class="menu">
				<ul>
					<li><input type="button" value="予約"
						onclick="window.location.href='main.html'"
						class="button logout_button"></li>
					<li><input type="button" value="ユーザ管理"
						onclick="window.location.href='userManage.html'"
						class="button logout_button"></li>
					<li><input type="button" value="会議室管理"
						onclick="window.location.href='meetingRoomManage.html'"
						class="button logout_button"></li>
				</ul>
			</div>
		</div>
</div>
		<div id="container">
			<div class="clear errmessage">エラーメッセージ
			</div>

			<div class="body">
				<div class="context">
					<h1>会議室管理</h1>
					<table>

						<tr>
							<th>会議室番号</th>
							<th>氏名</th>
							<th>収容人員</th>
							<th>詳細情報</th>
							<th>状態</th>
							<th>状態</th>
						</tr>
						<c:forEach var="mRoomList" items="${mRoomList}">
							<tr>
								<td>${mRoomList.meetingRoomId}</td>
								<td>${mRoomList.meetingRoomName}</td>
								<td>${mRoomList.meetingRoomCapacity}</td>
								<td>${mRoomList.meetingRoomDetailInfo}</td>
								<td>${mRoomList.meetingRoomState}</td>
								<td><form action ="available" method = "post" >
								<span class="mRoomList"></span>
								<input type="hidden" id="meetingRoomId" name="meetingRoomId" value="${mRoomList.meetingRoomId}"/>
								<input type="hidden" id="meetingRoomState" name="meetingRoomState" value="${mRoomList.meetingRoomState}"/>
								<input type="submit"  value="変更" />
								</form></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
</div>
</body>
</html>