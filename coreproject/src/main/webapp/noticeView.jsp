<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.domain.noticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.noticeDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	int number=Integer.valueOf(request.getParameter("number"));
	noticeDAO noticeDAO=new noticeDAO();
	List<noticeDTO> notice= noticeDAO.selectNotice(number);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			#update{
				display: none;
			}
		</style>
	</head>
	<body>
		<h1>공지사항</h1>
		<div id="view">
			<h1> 제목<%=notice.get(0).getNotice_title() %></h1>
			<div>
				내용<%=notice.get(0).getNotice_content() %>
			</div>
			<div>
				첨부파일<%=notice.get(0).getNotice_file()%>
			</div>
			<div>
				날짜<%=notice.get(0).getCreated_at() %>
			</div>
		</div>
		<div id="update">
			<form action="updateNoticeCon?notice_idx=<%=notice.get(0).getNotice_idx()%>" method="post">
				<h1> 제목<input type="text" name="title" placeholder="<%=notice.get(0).getNotice_title()%>"></h1>
				<div>
					내용<input type="text" name="content" placeholder="<%=notice.get(0).getNotice_content()%>">
				</div>
				<div>
					첨부파일<input type="text" name="file" placeholder="<%=notice.get(0).getNotice_file()%>">
				</div>
				<input type="submit" value="수정완료">
			</form>
		</div>
		<div>
			<c:if test="${(not empty loginUser and loginUser.user_id eq 'admin')or(not empty loginExpert and loginExpert.exp_id eq 'admin')}">
				<button onclick="toggleUpdate()" id="updateButton">수정</button>
				<button onclick="location.href='deleteNoticeCon?notice_idx=<%=notice.get(0).getNotice_idx()%>'">삭제</button>
			</c:if>
			<button onclick="location.href='notice.jsp'">목록</button>
		</div>
		<script>
			function toggleUpdate() {
				  const update = document.getElementById('update');
				  const view = document.getElementById('view');
				  const updateButton = document.getElementById('updateButton');
				  if(update.style.display !== 'none') {
				    update.style.display = 'none';
				    view.style.display='block';
				    updateButton.innerText='수정';
				  }
				  else {
				    update.style.display = 'block';
				    view.style.display='none';
				    updateButton.innerText='돌아가기';
				  }
			}
		</script>
	</body>
</html>