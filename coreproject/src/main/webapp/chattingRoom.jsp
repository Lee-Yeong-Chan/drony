<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.chatDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.chatDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	int tuw_idx=21;
	/*Integer.valueOf(request.getParameter("tuw_idx"));*/
	chatDAO chatDAO=new chatDAO();
	List<chatDTO> chatting=chatDAO.selectEachChattingRoom(tuw_idx);
	String id="abcde";
	/*if(session.getAttribute("loginUser")!=null) {
		id=((userDTO)session.getAttribute("loginUser")).getUser_id();
	}
	else if(session.getAttribute("loginExpert")!=null){
		id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
	}
	else {
		out.print("<script>alert('로그인상태가 아닙니다.');location.href='main.jsp';</script>");
	}*/
%>
<html>
	<head>
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/chat.css" />
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script type="text/javascript">
		<%-- <%=Integer.valueOf(request.getParameter("tuw_idx"))%>--%>
		/* formData.append("file",$('#file')[0].files[0]); */
			/* enctype:'multipart/form-data', */
			/* contentType:false,
			processData:false, */
			var lastID=0;
			var tuw_idx=<%=Integer.valueOf(request.getParameter("tuw_idx"))%>;
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
						if(res==1){
							alert("1");
						}
						else if(res==0){
							alert("2");
						}
						else{
							alert("3");
						}
					}
				})
				$('#chatText').val('');
			}
			/* enctype:'multipart/form-data', */
			/*contentType:false,
			processData:false, */
			function chatListFunction(type){
				$.ajax({
					type:"POST",
					url:'chatList',
					data:{
						listType:type,
					},
					success:function(data){
						var parsed=JSON.parse(data);
						var result=parsed.result;
						for(var i=0;i<result.length;i++){
							addChat(result[i][0].value,result[i][1].value,result[i][2].value)
						}
						lastID=Number(parsed.last);
					}
				});
			}
			function addChat(chatName,chatContent,chatTime){
				$('#chatList').append(
						'<div class="chat">'+
							'<div class="icon"><i class="icon solid fa-user"></i></div>'+
							'<div class="userName" style="align-self:end;"><b>'+ chatName +'</b></div>'+
							'<div class="textbox">'+ chatContent +'</div>' +
							'<div class="time" style="align-self:end; font-size: 13px;" >'+ chatTime +'</div>'+
						'</div>'
						'<br>'
						);
			}
			function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(lastID);
				},10000000);
			}
		</script>
	</head>
	<body>
		<div class="wrap">
			<div class="userchat">
				<div id="chatList">
		           <!-- 채팅내용 -->
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
		<button type="button" onclick="chatListFunction('today');">추가</button>
		<script type="text/javascript">
			$(document).ready(function(){
				chatListFunction("today");
				getInfiniteChat();
			});
		</script>
	</body>
</html>