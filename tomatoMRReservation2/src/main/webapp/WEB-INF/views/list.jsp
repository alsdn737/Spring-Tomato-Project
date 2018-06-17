<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TomatoMeetingRoom予約システム_メイン</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/meetingRoomManage.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main.jsp" />

	<div class="body" id='meeting_div'>

		<div class="context">
			<h1>ユーザ管理</h1>

			<div align="right">
				<button onclick="showMask()" class="showMask" href="$">新規登録</button>
				<!-- 			<a  type="button" href="#" class="showMask" onclick="showMask()">新規登録</a> -->
			</div>
			<table>
				<tr>
					<th>ユーザ番号</th>
					<th>氏名</th>
					<th>電話番号</th>
					<th>部署</th>
					<th>権限</th>
					<th>有効状態</th>
					<th>備考</th>
					<th>編集</th>
				</tr>
				<c:forEach var="userlist" items="${userlist}">
					<tr>
						<td>${userlist.userId}</td>
						<td>${userlist.userName}</td>
						<td>${userlist.userPhone}</td>
						<td>${userlist.department.departmentName}</td>
						<td>${userlist.role.roleName}</td>
						<c:if test="${userlist.isEnable == 'true'}">
							<td>○</td>
						</c:if>
						<c:if test="${userlist.isEnable == 'false'}">
							<td>×</td>
						</c:if>
						<td>
							<form name="deleteform" action="userinfodelete" method="post">
								<input type="hidden" name="userId" value="${userlist.userId}">
								<input type="hidden" name="isEnable"
									value="${userlist.isEnable}"> <input type="submit"
									class="button" value="一時停止・可能" />
							</form>
						</td>
						<td><input type="hidden" name="userId[]"
							value="${userlist.userId}"> <input type="hidden"
							name="userName" value="${userlist.userName}"> <input
							type="hidden" name="userPhone" value="${userlist.userPhone}">
							<input type="hidden" name="departmentName"
							value="${userlist.department.departmentName}"> <input
							type="hidden" name="roleName" value="${userlist.role.roleName}">
							<a class="up_btn" type="button">編集</a></td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>

	<div id="curtain" class="curtain"></div>
	<div id="adddisplay" class="adddisplay">
		<form name="frm1" method="post" action="userinfonew"
			class="commonForm input">
			<table border="1" cellspacing="0" cellpadding="0">
				<TR>
					<Td colspan="2">新規登録</Td>
				</TR>
				<tr>
					<th>氏名</th>
					<td><input type="text" name="userName" maxlength="10"></td>
				</tr>
				<tr>
					<th>暗証番号</th>
					<td><input type="password" name="userPassWord" maxlength="20"></td>
				</tr>

				<tr>
					<th>電話番号</th>
					<td><input type="text" name="userPhone" maxlength="11"></td>
				</tr>
				<tr>
					<th>部署</th>
					<td><select name="department.departmentId">
							<c:forEach var="departmentlist" items="${departmentlist}">
								<option value="${departmentlist.departmentId}">${departmentlist.departmentName }</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<th>権限</th>
					<td><select name="role.roleId">
							<c:forEach var="rolelist" items="${rolelist}">
								<option value="${rolelist.roleId}">${rolelist.roleName }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2">

						<div class="button_input">
							<input type="button" value="追加" onclick="check_onclick();">
							<input type="button" onclick="display_none()" value="取り消し">
						</div>
					</td>

				</tr>

				<tr>
			</table>
		</form>

	</div>


	<div id="curtain1" class="curtain"></div>
	<div id="updateisplay" class="adddisplay">
		<form method="post" action="userinfoupdate" name="updateform">
			<table border="1" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">Update : 社員番号</td>
					<td><input type="text" name="u_userId" readonly="readonly"></td>
				</tr>
				<tr>
					<th>氏名</th>
					<td><input type="text" name="u_userName" maxlength="10"></td>
				</tr>
				<tr>
					<th>暗証番号</th>
					<td><input type="password" name="userPassWord" maxlength="20"></td>
				</tr>

				<tr>
					<th>電話番号</th>
					<td><input type="text" name="u_userPhone" maxlength="11"></td>
				</tr>
				<tr>
					<th>部署</th>
					<td><select name="department.departmentId">
							<c:forEach var="departmentlist" items="${departmentlist}">
								<option value="${departmentlist.departmentId}">${departmentlist.departmentName }</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<th>権限</th>
					<td><select name="role.roleId">
							<c:forEach var="rolelist" items="${rolelist}">
								<option value="${rolelist.roleId}">${rolelist.roleName }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>

					<td colspan="2">
						<div class="button_input">
							<input type="button" value="変更" onclick="updatecheck_onclick()">
							<input type="button" onclick="display_none()" value="取り消し">
						</div>
					</td>
				</tr>

				<tr>
			</table>
		</form>

	</div>
	<script type="text/javascript">
		function sreachDisplay() {
			document.getElementById("meeting_div").classList
					.remove("display_none");
			document.getElementById("meeting_div").classList
					.add("display_block");
		}

		function clearDisplay() {
			document.getElementById("meeting_div").classList
					.remove("display_block");
			document.getElementById("meeting_div").classList
					.add("display_none");

		}
		function addDisplay() {
			document.getElementById("curtain").style.height = document.documentElement.scrollHeight
					+ "px";
			document.getElementById("curtain").style.display = "block";
			document.getElementById("adddisplay").style.display = "block";

			document.getElementById("curtain1").style.height = document.documentElement.scrollHeight
					+ "px";
			document.getElementById("curtain1").style.display = "block";
			document.getElementById("updateisplay").style.display = "block";

		}
		function display_none() {
			document.getElementById("curtain").style.display = "none";
			document.getElementById("curtain1").style.display = "none";
			document.getElementById("adddisplay").style.display = "none";
			document.getElementById("updateisplay").style.display = "none";
		}

		function showMask() {
			document.getElementById("curtain").style.height = document.documentElement.scrollHeight
					+ "px";
			document.getElementById("curtain").style.display = "block";
			document.getElementById("adddisplay").style.display = "block";
		}

		function showupdate() {

			document.getElementById("curtain1").style.height = document.documentElement.scrollHeight
					+ "px";
			document.getElementById("curtain1").style.display = "block";
			document.getElementById("updateisplay").style.display = "block";
		}

		$(document).ready(
				function() {

					$(".up_btn").click(
							function(el) {
								var row = $(this).parent().parent().parent()
										.prevAll().length - 1;

								u_userId = $(this).prevAll().eq(
										$(this).prevAll().length - 1).val();
								u_userName = $(this).prevAll().eq(3).val();
								u_userPhone = $(this).prevAll().eq(2).val();
								u_departmentName = $(this).prevAll().eq(1)
										.val();
								u_roleName = $(this).prevAll().eq(0).val();

								$('[name="u_userId"]').val(u_userId);
								$('[name="u_userName"]').val(u_userName);
								$('[name="u_userPhone"]').val(u_userPhone);
								$('[name="u_departmentName"]').val(
										u_departmentName);
								$('[name="u_roleName"]').val(u_roleName);
								showupdate();
							});

				});
	</script>
	<script type="text/javascript">
		function check_onclick() {
			theForm = document.frm1;
			var regNumber = /^[0-9]+$/;
			//数字のみ正規式
			var hanakakusuzi =/^[0-9a-zA-Z]+$/;
			//半角のみ

			if (theForm.userName.value == "") {
				alert("ユーザ名を入力してください。");
				return theForm.userName.focus();
			}

			if (theForm.userPassWord.value == "") {
				alert("暗証番号を入力してください。");
				return theForm.userPassWord.focus();
			}

			if(!hanakakusuzi.test(theForm.userPassWord.value)){
				alert("半角文字を入力してください。");
				return theForm.userPassWord.focus();
			}

			if (theForm.userPhone.value == "") {
				alert("ユーザの電話番号を入力してください。");
				return theForm.userPhone.focus();

			}

			if (!regNumber.test(theForm.userPhone.value)) {
				alert("入力が間違っています。");
				return theForm.userPhone.focus();
			}
			theForm.submit();

		}

		function updatecheck_onclick() {
			theForm1 = document.updateform;
			var regNumber = /^[0-9]+$/;
			var hanakakusuzi =/^[0-9a-zA-Z]+$/;
			if (theForm1.u_userName.value == "") {
				alert("ユーザ名を入力してください。");
				return theForm1.u_userName.focus();
			}

			if (theForm1.userPassWord.value == "") {
				alert("暗証番号を入力してください。");
				return theForm1.userPassWord.focus();
			}

			if(!hanakakusuzi.test(theForm1.userPassWord.value)){
				alert("半角文字を入力してください。");
				return theForm1.userPassWord.focus();
			}
			if (theForm1.u_userPhone.value == "") {
				alert("ユーザの電話番号を入力してください。");
				return theForm1.u_userPhone.focus();
				if (isNaN(theForm1.u_userPhone.value)) {
					alert("入力が間違っています。");
				}
			}

			if (!regNumber.test(theForm1.u_userPhone.value)) {
				alert("入力が間違っています。");
				return theForm1.u_userPhone.focus();
			}

			theForm1.submit();

		}
	</script>
</body>

</html>