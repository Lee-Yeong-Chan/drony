<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.chatDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.chatDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	int tuw_idx=Integer.valueOf(request.getParameter("tuw_idx"));
	chatDAO chatDAO=new chatDAO();
	List<chatDTO> chatting=chatDAO.selectEachChattingRoom(tuw_idx);
	String id="";
	if(session.getAttribute("loginUser")!=null) {
		id=((userDTO)session.getAttribute("loginUser")).getUser_id();
	}
	else if(session.getAttribute("loginExpert")!=null){
		id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
	}
%>
<html>
	<head>
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/chat.css" />
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script type="text/javascript">
			var lastID=0;
			var tuw_idx=<%=tuw_idx%>
			function submitFunction(){
				chatText=$('#chatText').val();
				var chatText=$('#chatText').val();
				$.ajax({
					type:"POST",
					url:'chatSubmit',
					data:{
						'chatText':encodeURIComponent(chatText),
						'tuw_idx':tuw_idx
					},
					success: function(res){
						
					}
				});
				$('#chatText').val('');
			};
			function chatListFunction(type){
				$.ajax({
					type:"POST",
					url:'chatList',
					data:{
						'listType':type,
						'tuw_idx':tuw_idx
					},
					dataType:'json',
					success:function(result){
						if(result==""){
							return;
						}
						for(var i=0;i<result.length;i++){
							addChat(result[i].talker,result[i].talk,result[i].created_at);
						}
						lastID=Number(result[(result.length)-1].chat_idx);
					}
				});
			};
			function addChat(chatName,chatContent,chatTime){
				var chatTime1=""+chatTime;
				var timeSet="";
				timeSet+=chatTime1.substring(0,11);
				var half="오전";
				var hour=Number(chatTime1.substring(11,13));
				if(Number(chatTime1.substring(11,13))>=12) {
					half="오후";
					hour=Number(chatTime1.substring(11,13))-12+((Number(chatTime1.substring(11,13))!=12)?0:12);
				}
				timeSet+=half;
				timeSet+=hour;
				timeSet+=":";
				timeSet+=chatTime1.substring(14,16);
				if (chatName=="<%=id%>"){
					$('#chatList').append(
							'<div class="chat right">'+
								'<div class="userName" style="align-self:end;"><i class="icon solid fa-user"></i><br><b>'+ chatName +'</b></div>'+
								'<div class="textbox">'+ chatContent +'</div> &nbsp;'+
								'<div class="time" style="align-self:end; font-size: 13px;" >'+ timeSet +'</div>'+
							'</div>'+
							'<br>');
				}
				else{
					$('#chatList').append(
							'<div class="chat left">'+
								'<div class="userName" style="align-self:end;"><i class="icon regular fa-user"></i><br><b>'+ chatName +'</b></div>'+
								'<div class="textbox">'+ chatContent +'</div> &nbsp;'+
								'<div class="time" style="align-self:end; font-size: 13px;" >'+ timeSet +'</div>'+
							'</div>'+
							'<br>');
				}
				$(function(){
					$('.userchat').scrollTop($('.userchat')[0].scrollHeight)
				});
			};
			function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(lastID);
				},1000);
			};
			function enterText(e){
				if(e.keyCode==13){
					submitFunction();
				}
			}
		</script>
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
			<%@include file="header.jsp" %>
			<!-- Main -->
			<section id="main">
				<div class="container">
					<div class="row">
  							<!-- Sidebar -->
						<div class="col-3 col-12-medium">
  							<div class="sidebar">
								<c:choose>
									<c:when test="${not empty loginUser}">
										<ul class="divided">
											<li>
												<article class="box mypage-menu">
													<h3 class="major"><span><%=id %>님</span></h3>
													<h1><a href="mypageUser.jsp">내 프로필</a></h1>
                                       			</article>
                                  			</li>
                                   			<li>
                                      			<article class="box mypage-menu">
                                           			<h1><a href="workUser.jsp">작업의뢰 현황</a></h1>
                                       			</article>
                                   			</li>
                               			</ul>
                               			<table>
                               				<tr>
                              					<td colspan='2' align="right" style="font-size: 0.8em;">
                               						<a href='updateUser.jsp'>개인정보수정</a> &nbsp;
                               						<a href="deleteUserCon">회원탈퇴</a>
                              					</td>
                         					</tr>
                              			</table>
									</c:when>
									<c:when test="${not empty loginExpert}">
										<h3 class="major"><span>🍀<%=id %>님</span></h3>
										<ul class="divided">
		   									<li>
		   										<article class="box mypage-menu">
													<h1><a href="mypageExpert.jsp">내프로필</a></h1>
												</article>
		   									</li>
		   									<li>
												<article class="box mypage-menu">
													<h1><a href="myPost.jsp">내게시글</a></h1>
												</article>
											</li>
											<li>
												<article class="box mypage-menu">
													<h1><a href="workExpert.jsp">작업목록</a></h1>
												</article>
											</li>
											<li>
												<article class="box mypage-menu">
													<h1><a href="droneList.jsp">드론관리</a></h1>
												</article>
											</li>
	   									</ul>
		   								<table>
								     	 	<tr>
									         	<td colspan='2' align="right" style="font-size: 0.8em;">
									         		<a href="updateExpert.jsp">개인정보수정</a> &nbsp;
									         		<a href="deleteExpertCon">회원탈퇴</a>	
									         	</td>
									         </tr>
									     </table>
									</c:when>										
								</c:choose>   								
	   						</div>
	   					</div>
	   					<div class="col-9 col-12-medium imp-medium">
	   						<div class="content">
								
								<!-- 채팅창 시작 -->
								<div class="wrap">
									<div class="chathead">
										<div><a href="#"><i class="icon solid fa-arrow-left"></i></a></div>
										<div><b>1:1채팅</b></div>
									</div>
									<div class="userchat">
										<div id="chatList">
								        	<!-- 채팅내용 -->   
								        </div>
									</div>
							        <div class="input-text">
							        	<textarea maxlength="100px" id='chatText' class="text_input" placeholder="메세지를 입력하세요." name="chatText" onkeypress="enterText(event)"></textarea>
							    	</div>
							    	<div class="sub">
							    		<span class="submit"> <button type="button" onclick="submitFunction()" id="sb">전송</button></span>
							    	</div>
								</div>							
	   						</div>
	   					</div>
					</div>
				</div>
			</section>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				chatListFunction("today");
				getInfiniteChat();
			});
		</script>
	</body>
</html>