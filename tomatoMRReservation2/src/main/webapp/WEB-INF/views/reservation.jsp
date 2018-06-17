<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.jptomato.tomatoMRReservation.model.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="http://web-designer.cman.jp/freejs/cmanCalendar_v092.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="top">
		<div class="logo">TomatoMeetingRoom予約システム</div>
		<div class="logout">
			<form>
				<input type="button" onclick="window.location.href='login.html'"
					value="ログアウト" class="button logout_button">
			</form>

		</div>
		<div class="clear fooder">
			<div class="loginUser">よこそう：<sec:authentication property="principal.Username" />さん</div>
			<div class="menu">
				<ul>
					<li><input type="button" value="予約"
						 onclick="window.location.href='reservation'"
						class="button logout_button"></li>
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
		<div class="clear errmessage"></div>
		<%List<MeetingRoom> lsm = (List<MeetingRoom>)request.getAttribute("mr"); %>
		<%List<MeetingRoom> lsml = (List<MeetingRoom>)request.getAttribute("mrlist"); %>
		<div class="body">
			<div class="context">
				<div class="left context_left">
				<form:form action="${pageContext.request.contextPath}/reservation_select">
					<ul>
						<li class="left li_left"><label for="date">日付：</label></li>
						<li class="left li_righr"><input type="date"  cmanCLDat="USE:ON,FORM:3" sytle="width:200px"  id="date" value="${date}" name="date"></li>
						<li class="clear left li_left"><label for="meeting">会議室：</label></li>
						<li class="left li_righr"><select id="meeting" name="meetingId">
								<option value="0">&nbsp;</option>
								<% for(int i =0;i<lsml.size();i++){%>
								<option <%= request.getAttribute("meetingId")!=null&&((String)request.getAttribute("meetingId")).equals(lsml.get(i).getMeetingRoomId().toString())?"selected":"" %> value="<%= lsml.get(i).getMeetingRoomId()%>"><%= lsml.get(i).getMeetingRoomName() %></option>
								<%} %>
						</select></li>
					</ul>

				</div>
				<div class="right context_right">
					<input type="submit" value="検索" onclick="return sreachDisplay()"
						class="r_button" name="sreach"> <input type="button"
						value="クリア" onclick="clearDisplay()" class="r_button" name="reset">
				</div>
				</form:form>
				<div id="meeting_div" class="clear meeting ${display}">
					<ul class="time_top ">
								<li>5</li>
								<li>6</li>
								<li>7</li>
								<li>8</li>
								<li>9</li>
								<li>10</li>
								<li>11</li>
								<li>12</li>
								<li>13</li>
								<li>14</li>
								<li>15</li>
								<li>16</li>
								<li>17</li>
								<li>18</li>
								<li>19</li>
								<li>20</li>
								<li>21</li>
								<li>22</li>
								<li>23</li>
								<li>24</li>
							</ul>
					<table>
						<%for(int i=0;i<lsm.size();i++) {%>
							<tr id="r<%=i+1%>">
								<th><%= lsm.get(i).getMeetingRoomName()%></th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

						<%}%>
					</table>
					<%for(int i=0;i<lsm.size();i++) {%>
						<input type="hidden" id="m<%= i+1 %>" value="<%= request.getAttribute('m'+ String.valueOf(i+1)).toString()%>" />
					<%}%>
					<div class="clear"></div>
				</div>

			</div>

		</div>
	</div>
	<div id="curtain" class="curtain"></div>
	<div id="adddisplay" class="adddisplay">
		<form:form action="${pageContext.request.contextPath}/reservation_add" method="post">
		<table id="mrr" border="1" cellspacing="0" cellpadding="0">
			<tr>
				<th>logo</th>
				<th>新規</th>
			</tr>
			<tr>
				<th>会議室名</th>
				<td><label id="mrName"></label>
				<input id="hmrId" name="meetingRoom.meetingRoomId" type="hidden" value=""/>
				</td>
			</tr>
			<tr>
				<th>会議タイトル</th>
				<td><label id="mrName"></label>
				<input name="reservationTitle" type="text" value="" />
				</td>
			</tr>
			<tr>
				<th>予約時間</th>
				<td><label id="mrStart"></label> ~ <label id="mrEnd"></label>
				<input id="hmrStart" name="startT" type="hidden" value=""/>
				<input id="hmrEnd" name="endT" type="hidden" value=""/>
				</td>
			</tr>
			<tr>
				<th>予約日付</th>
				<td>2018/06/07</td>
			</tr>
			<tr>
				<th>定員数</th>
				<td>6</td>
			</tr>
			<tr>
				<th>備考</th>
				<td class="t_td">
				<textarea name="reservationNote"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><strong style="color: red;">エラーメッセージ</strong>
					<div class="button_input">
						<input type="submit" value="追加" onclick="return add_none()"> <input
							type="button" onclick="display_none()" value="取り消し">
					</div></td>
			</tr>

		</table>
		<input type="hidden" value=""/>
		</form:form>
	</div>
<!-- 	<p id="log"></p> -->
</body>
</html>
<script type="text/javascript">
	var selectecdlog = [];
	var resultLen = 0;
	var resultBegin = 0;
	var backColor = [ 'red', 'green', 'blue' ]; // assume 3 rows 1 -red 2 - green 3 - blue
	var resultColor = 0;
	var look = false;
	$("#meeting_div table tr td").mousedown(
			function() {
				selectecdlog = [];
				resultColor = backColor[2];
				look = false;
				var rid = $(this).parent().attr('id').substr(1,1);
				var cols = parseInt($(this).attr('id').substr(
						($(this).attr('id').indexOf('c')) + 1));//行号
				var t = $("#m"+rid).val().split('|');
				var r = $(this).parent().prevAll().length+1;

				$("#mrName").html($(this).parent().find("th").eq(0).html());
				$("#hmrId").val($("#m"+r).val().split('|')[0]);
				$("#meeting_div table tr td").css('background-color', 'white');

				$("#meeting_div table tr td").each(
						function(index, val) {
							/* iterate through array or object */
							var r = $(this).parent().prevAll().length+1;
							var t = $("#m"+r).val().split('|');
							for (var i = 1; i < t.length; i++) {
								if (($(this).index()) >= (t[i].split(','))[0] - 4
										&& ($(this).index()) <= (t[i].split(','))[1] - 4) {
									$(this).css('background-color', 'red');
								}
							}

						});


				for (var y = 1; y < t.length; y++) {
					//判断是否在红色区域
					if (cols >= (t[y].split(','))[0]
							&& cols <= (t[y].split(','))[1] || look) {
						look = true;
						return;
					}
				}

				// ID for tr tag
				//alert($(this).parent().attr('id'));
				//get the column No.
				//alert($(this).index()+1);

				$(this).css('background-color', resultColor);

				selectecdlog.push($(this).attr('id'));
				//alert($(this).attr('id'));
				$("#meeting_div table tr td").mouseup(onMouseUp);
				$("#meeting_div table tr td").mouseover(onMouseOver);
			})
	function onMouseUp() {
		/* Act on the event */
		var rid = $(this).parent().attr('id').substr(1,1);
		var cols = parseInt($(this).attr('id').substr(
				($(this).attr('id').indexOf('c')) + 1));//行号
		var t = $("#m"+rid).val().split('|');
		for (var y = 1; y < t.length; y++) {
			//判断是否在红色区域
			if (cols >= (t[y].split(','))[0]
					&& cols <= (t[y].split(','))[1] || look) {
				$("#meeting_div table tr td").unbind('mouseup', onMouseUp);
				for (var i = 0; i < resultLen; i++) {
					selectecdlog.push(selectecdlog[0].substr(0, 2) + "c"
							+ (resultBegin + i));

				}
				selectecdlog.shift();
				//combine();
				$('#log').text(selectecdlog.toString());
				selectecdlog.push($(this).next().attr("id"));
				$("#mrStart").html(selectecdlog[0].substr(selectecdlog[0].indexOf('c')+1)+":00");
				$("#mrEnd").html(selectecdlog[selectecdlog.length-1].substr(selectecdlog[selectecdlog.length-1].indexOf('c')+1)+":00");
				$("#hmrStart").val($("#date").val()+" "+selectecdlog[0].substr(selectecdlog[0].indexOf('c')+1)+":00:00");
				$("#hmrEnd").val($("#date").val()+" "+selectecdlog[selectecdlog.length-1].substr(selectecdlog[selectecdlog.length-1].indexOf('c')+1)+":00:00");
				$("#meeting_div table tr td").unbind('mouseover', onMouseOver);
				$("#meeting_div table tr td").unbind('mouseup', onMouseUp);
				addDisplay();
				look = true;
				return;
			}
		}
		var len = resultLen = Math.abs(parseInt(selectecdlog[0]
				.substr(selectecdlog[0].indexOf('c') + 1))
				- parseInt($(this).attr('id').substr(
						($(this).attr('id').indexOf('c')) + 1))) + 1;
		var begin = resultBegin = parseInt(selectecdlog[0]
				.substr(selectecdlog[0].indexOf('c') + 1)) > parseInt($(this)
				.attr('id').substr(($(this).attr('id').indexOf('c')) + 1)) ? parseInt($(
				this).attr('id').substr(($(this).attr('id').indexOf('c')) + 1))
				: parseInt(selectecdlog[0]
						.substr(selectecdlog[0].indexOf('c') + 1));
		for (var i = 0; i < resultLen; i++) {
			selectecdlog.push(selectecdlog[0].substr(0, 2) + "c"
					+ (resultBegin + i));

		}
		selectecdlog.push($(this).next().attr("id"));
		$("#mrStart").html(selectecdlog[0].substr(selectecdlog[0].indexOf('c')+1)+":00");
		$("#mrEnd").html(selectecdlog[selectecdlog.length-1].substr(selectecdlog[selectecdlog.length-1].indexOf('c')+1)+":00");
		$("#hmrStart").val($("#date").val()+" "+selectecdlog[0].substr(selectecdlog[0].indexOf('c')+1)+":00:00");
		$("#hmrEnd").val($("#date").val()+" "+selectecdlog[selectecdlog.length-1].substr(selectecdlog[selectecdlog.length-1].indexOf('c')+1)+":00:00");
		selectecdlog.shift();
		//combine();
		addDisplay()
		$('#log').text(selectecdlog.toString());

		$("#meeting_div table tr td").unbind('mouseover', onMouseOver);
		$("#meeting_div table tr td").unbind('mouseup', onMouseUp);
	}
	function onMouseOver(argument) {
		var rid = $(this).parent().attr('id').substr(1,1);
		var cols = parseInt($(this).attr('id').substr(
				($(this).attr('id').indexOf('c')) + 1));//行号
		var t = $("#m"+rid).val().split('|');
		for (var y = 1; y < t.length; y++) {
			if (cols >= (t[y].split(','))[0]
					&& cols <= (t[y].split(','))[1]  || look) {
				$("td").unbind('mouseover', onMouseOver);
				look = true;
				return;
			}

		}
		var len = resultLen = Math.abs(parseInt(selectecdlog[0]
				.substr(selectecdlog[0].indexOf('c') + 1))
				- parseInt($(this).attr('id').substr(
						($(this).attr('id').indexOf('c')) + 1))) + 1;
		var begin = resultBegin = parseInt(selectecdlog[0]
				.substr(selectecdlog[0].indexOf('c') + 1)) > parseInt($(this)
				.attr('id').substr(($(this).attr('id').indexOf('c')) + 1)) ? parseInt($(
				this).attr('id').substr(($(this).attr('id').indexOf('c')) + 1))
				: parseInt(selectecdlog[0]
						.substr(selectecdlog[0].indexOf('c') + 1));
		//$('td').css('background-color', 'white');
		for (var i = 0; i < len; i++) {
			$('#' + selectecdlog[0].substr(0, 2) + "c" + (begin + i)).css(
					'background-color', resultColor);
		}
		//alert( $(this).attr('id').substr(($(this).attr('id').indexOf('c'))+1));
		//$('#'+tdId).css('background-color', 'red');
	}
	// set id attr for each td
	$("#meeting_div table tr td").each(
			function(index, val) {
				/* iterate through array or object */
				$(this).attr(
						'id',
						$(this).parent().attr('id') + "c"
								+ ($(this).index() + 4));
				var r = $(this).parent().prevAll().length+1;
				var t = $("#m"+r).val().split('|');
				for (var i = 1; i < t.length; i++) {
					if (($(this).index()) >= (t[i].split(','))[0] - 4
							&& ($(this).index()) <= (t[i].split(','))[1] - 4) {
						$(this).css('background-color', 'red');
					}
				}

			});

	//combine cells
	function combine(argument) {
		// body...
		for ( var m in selectecdlog) {
			if (m == 0) {
				$('#' + selectecdlog[m]).attr('colspan', resultLen);
				$('#' + selectecdlog[m]).css('width', resultLen * 50 + "px");
				//$('#'+selectecdlog[m]).css('background-color', 'bule');
			} else {
				$('#' + selectecdlog[m]).addClass('hidden');
			}
		}
	}

	function colorChange(x) {
		if (x.className == "button_1") {
			x.className = "button_2";
		} else {
			x.className = "button_1";
		}
	}

	function sreachDisplay() {
		document.getElementById("meeting_div").classList.remove("display_none");
		document.getElementById("meeting_div").classList.add("display_block");
		return true;
	}

	function clearDisplay() {
		document.getElementById("meeting_div").classList
				.remove("display_block");
		document.getElementById("meeting_div").classList.add("display_none");

	}
	function addDisplay() {
		document.getElementById("curtain").style.height = document.documentElement.scrollHeight
				+ "px";
		document.getElementById("curtain").style.display = "block";
		document.getElementById("adddisplay").style.display = "block";

	}
	function display_none() {
		document.getElementById("curtain").style.display = "none";
		document.getElementById("adddisplay").style.display = "none";
	}
	function add_none() {
		var bool = confirm('追加がよろしいでしょうか？');
		if (bool) {
			display_none();
			return true;
		}else{
			return false;
		}
	}
</script>