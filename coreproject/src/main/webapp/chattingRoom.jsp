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
	else {
		out.print("<script>alert('로그인상태가 아닙니다.')location.href='main.jsp';</script>");
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
			function submitFunction(){
				var formData = new FormData();
				formData.append('chatText',$('#chatText').val());
				formData.append('tuw_idx',<%=Integer.valueOf(request.getParameter("tuw_idx"))%>);
				formData.append("file",$('#file')[0].files[0])
				var chatText=$('#chatText').val();
				$.ajax({
					type:"POST",
					enctype:'multipart/form-data',
					url:'chatSubmit',
					data:formData,
					contentType:false,
					processData:false,
					success: function(res){
						if(res==1){
							alert("접근1");
						}
						else if(res==0){
							alert("접근2");
						}
						else{
							alert("접근3");
						}
					}
				})
				$('#chatText').val('');
			}
			function chatListFunction(type){
				$.ajax({
					type:"POST",
					enctype:'multipart/form-data',
					url:'chatList',
					data:{
						listType:type,
					},
					contentType:false,
					processData:false,
					success:function(res){
						var parsed=Json.parse(data);
						var result=parsed.result;
						for(var i=0;i<result.length;i++){
							addChat(result[i][0].value,result[i][1].value,result[i][2].value)
						}
						lastID=Number(parsed.last);
					}
				});
			}
			function addChat(chatName,chatContent,chatTime){
				$('#chatList').append('<div class="row"'+
						'<div class="col-lg-12">'+
						'<div class="media">'+
						'<div class="dedia-body">'+
						'<h4 class="media-heading">'+
						chatName+
						'<span class="small pull-right">'+
						chatTime+
						'</span>'+
						'<h4>'+
						'<p>'+
						chatContent+
						'</p>'+
						'</div>'+
						'</div>'+
						'</div>'+
						'</div>'+
						'<hr>');
			}
			function getInfiniteChat(){
				setInterval(function(){
					chatListFunction(lastID);
				},500);
			}
		</script>
	</head>
	<body>
		<div class="wrap">
			<div class="userchat">
				<div class="chat ch1" id="chatList">
		           
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