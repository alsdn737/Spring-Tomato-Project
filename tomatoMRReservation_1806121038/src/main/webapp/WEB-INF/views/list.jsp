<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TomatoMeetingRoom予約システム_メイン</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/userManage.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h1>ユーザ管理</h1>
					<table>

						<tr>
							<th>ユーザ番号</th>
							<th>氏名</th>
							<th>電話番号</th>
							<th>部署</th>
							<th>権限</th>
							<th>有効状態</th>
						</tr>
						<c:forEach var="userlist" items="${userlist}">
							<tr>
								<td>${userlist.userId}</td>
								<td>${userlist.userName}</td>
								<td>${userlist.userPhone}</td>
								<td>${userlist.department.departmentName}</td>
								<td>${userlist.role.roleName}</td>
								<td>${userlist.isEnable==true?"有効":"無効"}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
</div>
</body>
</html>