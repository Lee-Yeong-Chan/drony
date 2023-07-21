<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.mypageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
	mypageDAO dao=new mypageDAO();
	List<mypageDTO> mypageList= dao.selectUserMypage(loginUser.getUser_id());
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="mypageExpert.jsp">내 프로필</a>
		<a href="updateExpert.jsp">개인 정보 수정</a>
		<a href="workExpert.jsp">작업 진행 상황</a>
		<h1>의뢰한 계약 목록</h1>
		<table border='1'>
			<tr>
				<td>번호</td>
				<td>의뢰한 작업명</td>
				<td>진행 상황</td>
				<td>상황 갱신 날짜</td>
				<td>채팅방</td>
			</tr>
			<%if (mypageList!=null){
				for(int i=0;i<mypageList.size();i++){%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=mypageList.get(i).getW_title()%></td>
				<td><%=mypageList.get(i).getStatus_memo()%></td>
				<td><%=mypageList.get(i).getCreated_at()%></td>
				<td><button onclick="location.href='.jsp'">채팅</button></td>
			</tr>
			<%	}
			}%>
		</table>
	</body>
</html>