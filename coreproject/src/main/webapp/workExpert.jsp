<%@page import="com.smhrd.domain.mypageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO dao=new mypageDAO();
	List<mypageDTO> mypageList= dao.selectExpertMypage(loginExpert.getExp_id());
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
				<td>의뢰받은 작업명</td>
				<td>진행 상황</td>
				<td>상황 갱신 날짜</td>
				<td>채팅방</td>
			</tr>
			<%if (mypageList!=null){
				for(int i=0;i<mypageList.size();i++){%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=mypageList.get(i).getW_title()%></td>
				<td>
					<form action="updateMypageCon" method="post">
						<select name="status">
							<option value="wconsul">상담대기</option>
							<option value="consul">상담중</option>
							<option value="contra">계약완료</option>
							<option value="working">작업중</option>
							<option value="comple">작업완료</option>
						</select>
						<input type="submit" value="수정">
						<% session.setAttribute("updateStatus_idx", mypageList.get(i).getStatus_idx());%>
					</form>
				</td>
				<td><%=mypageList.get(i).getCreated_at()%></td>
				<td><button onclick="location.href='.jsp'">채팅</button></td>
			</tr>
			<%	}
			}%>
		</table>
	</body>
</html>