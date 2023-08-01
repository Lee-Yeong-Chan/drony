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
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	</head>
	<body>
		<div class="wrap">
			<div class="userchat">
  				<%for(int i=0;i<chatting.size();i++){ %>
				<div class="chat ch1">
		            <div class="icon"><i class="icon solid fa-user"></i></div>
					<%if(chatting.get(i).getTalker().equals(id)){ %>
						<div class="myTextbox"><%=chatting.get(i).getTalk() %></div>
					<%}
					else{%>
						<div class="otherTextbox"><%=chatting.get(i).getTalk() %></div>
					<%} %>
		        </div>
		        <%} %>
			        <div class="input-text">
			        	<textarea maxlength="100px" id='chatText' class="text_input" placeholder="메세지를 입력하세요." name="chatText"></textarea>
			    	</div>
			    	<div class="sub">
			    		<span class="file"> <input id="file" type="file" name="file"> </span>
			    		<span class="submit"> <button type="button" onclick="submitFunction()">전송</button></span>
			    	</div>
			</div>
		</div>
		<script type="text/javascript">
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
							console.log("1");
							alert("접근1");
						}
						else if(res==0){
							console.log("2")
							alert("접근2");
						}
						else{
							console.log("3")
							alert("접근3");
						}
					}
				})
				$('#chatText').val('');
			}
		</script>
	</body>
</html>