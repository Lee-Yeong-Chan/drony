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
					success:function(data){
						if(data==""){
							return;
						}
						var parsed=JSON.parse(data);
						var result=parsed.result;
						for(var i=0;i<result.length;i++){
							addChat(result[i][0].value,result[i][1].value,result[i][2].value)
						}
						lastID=Number(parsed.last);
					}
				});
			};
			function addChat(chatName,chatContent,chatTime){
				$('#chatList').append(
						'<div class="chat">'+
							'<div class="userName" style="align-self:end;"><b>'+ chatName +'</b></div>'+
							'<div class="textbox">'+ chatContent +'</div>'+
							'<div class="time" style="align-self:end; font-size: 13px;" >'+ chatTime +'</div>'+
						'</div>'+
						'<br>'
						);
				$('#chatList').scrollTop($('#chatList')[0].scrolHeight);
			};
			function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(lastID);
				},1000);
			};
		</script>
	</head>
	<body>
		<div class="is-preload">
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
										
									</c:choose>   								
	   								<h3 class="major"><span>🍀<%=loginExpert.getExp_id() %>님의 마이페이지</span></h3>
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
	   						</div>
	   					</div>
						
						</div>
					</div>
				</section>
			
			</div>
		
		
		</div>
	
	
		<div class="wrap">
			<div class="userchat">
				<div id="chatList">
		           
		        </div>
			        <div class="input-text">
			        	<textarea maxlength="100px" id='chatText' class="text_input" placeholder="메세지를 입력하세요." name="chatText"></textarea>
			    	</div>
			    	<div class="sub">
			    		<span class="file"> 
			    			<label for="file">파일</label>
			    			<input id="file" type="file" name="file"> 
			    		</span>
			    		<span class="submit"> <button type="button" onclick="submitFunction()">전송</button></span>
			    	</div>
			</div>
		</div>	
		<script type="text/javascript">
			$(document).ready(function(){
				chatListFunction("today");
				getInfiniteChat();
			});
		</script>
	</body>
</html>