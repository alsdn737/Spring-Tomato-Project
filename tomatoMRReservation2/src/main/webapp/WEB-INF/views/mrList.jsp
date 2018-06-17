<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>TomatoMeetingRoom予約システム_会議室管理</title>
	 <link rel="stylesheet" type="text/css" href="css/basic.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	 <style>
        .setDiv {
            padding-top: 100px;
            text-align: center;
        }
        .mask {
            position:absolute;
            left:0;
            top:0;
            z-index:9999;
            background-color:#000;
            display:none;
        }
        .window {
            display: none;
            background-color: #ffffff;
            height: 200px;
            z-index:99999;
        }
    </style>


</head>

<body>
	<jsp:include page="/WEB-INF/views/main.jsp"/>
	<div id="container">
		<div class="clear errmessage">

		</div>
		<div class="body">
			<div class="context">
				<h1>会議室管理</h1>
					<div class="setDiv">
    					<div class="mask"></div>
    					<div class="window">
    					<form id="join" action="addRoom" method="post">

						<table class="table">
						<tr>
							<th>会議室名 :</th>
							<td><input type="text" id="meetingRoomName" name="meetingRoomName"/></td>
						</tr>
						<tr>
							<th>定員数 :</th>
							<td><input type="text" id="meetingRoomCapacity" name="meetingRoomCapacity" onkeydown="onlyNumber(this)"/></td>
						</tr>
						<tr>
							<th>詳細情報 :</th>
							<td><input type="text" id="meetingRoomDetailInfo" name="meetingRoomDetailInfo"/></td>
						</tr>
						<tr>
							<th>使用状態 :</th>
							<td><input type="radio" id="enable" name="meetingRoomState" value="true"/>True
    								<input type="radio" id="disenable" name="meetingRoomState" value="false"/>False</td>
						</tr>
						<tr>
						<th></th>
							<td><input type="submit" value="Submit"/>
        					<input type="button" href="#" class="close1" value="Cancle"/></td>
						</tr>

						</table>
    					</form>
    					</div>
					</div>
					<a href="#" class="showMask">Add Room</a>
				<table class="table">
					<tr>
						<th>会議室番号</th>
						<th>会議室名</th>
						<th>定員数</th>
						<th>詳細情報</th>
						<th>使用状態</th>
						<th></th>
					</tr>

					<c:forEach items="${meetingRooms}" var="meetingRoom">
						<tr>
							<td>${meetingRoom.meetingRoomId}</td>
							<td>${meetingRoom.meetingRoomName}</td>
							<td>${meetingRoom.meetingRoomCapacity}</td>
							<td>${meetingRoom.meetingRoomDetailInfo}</td>

							<c:if test="${meetingRoom.meetingRoomState == 'true'}">
								<td>○</td>
							</c:if>
							<c:if test="${meetingRoom.meetingRoomState == 'false'}">
								<td>×</td>
							</c:if>
							<td>
							<form action="mrrList" method="post">
							<input type="hidden" name="meetingRoomId" value="${meetingRoom.meetingRoomId}">
							<input type="hidden" name="meetingRoomState" value="${meetingRoom.meetingRoomState}">
							<input type="submit" class="button td_button" value="一時停止">
							</form>
							</td>

							</tr>
					</c:forEach>


				</table>
			</div>
		</div>
	</div>


<script type="text/javascript">
    function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();

        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});

        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);

        // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );

        // css 스타일을 변경합니다.
        $('.window').css({'left':left,'top':top, 'position':'absolute'});

        // 레이어 팝업을 띄웁니다.
        $('.window').show();
    }

    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $('.showMask').click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask();
        });

        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close1').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });

        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });

    });


    $(document).ready(function(){


    	  $('#join').submit(function(){
    		  if($("#meetingRoomName").val()==""){
    				alert("WRITE SOME NAME");
    				$("#meetingRoomName").focus();
    				return false;

    		  }else if($("#meetingRoomCapacity").val()==""){
				  alert("WRITE ROOM CAPACITY");
				  $("#meetingRoomCapacity").focus();
				  return false;
			  }else if($("#meetingRoomDetailInfo").val()==""){
				  alert("WRITE ROOM INFO");
				  $("#meetingRoomDetailInfo").focus();
				  return false;
			  }else if($("#enable").is(':checked')==false && $("#disenable").is(':checked')==false){
				  alert("CHOOSE THE ROOM STATE");
				 return false;
			  }
		return true;

    });


    });




    function onlyNumber(obj) {
        $(obj).keyup(function(){
             $(this).val($(this).val().replace(/[^0-9]/g,""));
        });
    }
</script>
</body>
</html>