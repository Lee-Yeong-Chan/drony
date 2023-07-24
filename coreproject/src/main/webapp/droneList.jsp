<%@page import="com.smhrd.domain.expertDroneDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO mypageDAO=new mypageDAO();
	List<expertDroneDTO> droneList=mypageDAO.selectExpertDrone(loginExpert.getExp_id());
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="mypageExpert.jsp">내 프로필</a>
		<a href="updateExpert.jsp">개인 정보 수정</a>
		<a href="myPost.jsp">올린 게시글</a>
		<a href="workExpert.jsp">작업 진행 상황</a>
		<a href="droneList.jsp">내 드론 현황</a>
		<form action="updateDroneCon" method="post">
			<table border='1'>
				<tr>
					<td>순번</td>
					<td>모델명</td>
					<td>제조사</td>
					<td>일련번호</td>
					<td>설명</td>
					<td>사진</td>
				</tr>
				<%for(int i=0;i<droneList.size();i++){%>
				<tr>
					<td><%=i+1 %></td>
					<td> <input type="text" name="model" placeholder=<%=droneList.get(i).getDr_model()%>></td>
					<td> <input type="text" name="maker" placeholder=<%=droneList.get(i).getDr_maker()%>></td>
					<td> <input type="text" name="serial" placeholder=<%=droneList.get(i).getDr_serial()%>></td>
					<td> <input type="text" name="desc" placeholder=<%=droneList.get(i).getDr_desc()%>></td>
					<td> <input type="file" name="img" placeholder=<%=droneList.get(i).getDr_img()%>></td>
					<td> <input type="submit" value="수정"></td>
					<td><a href="deleteDroneCon?dr_idx=<%=droneList.get(i).getDr_idx()%>">삭제</a></td>
				</tr>
				<% session.setAttribute("dr_idx", droneList.get(i).getDr_idx());
				}%>
			</table>
		</form>
		<form action="insertDroneCon" method="post">
			<table border="1">
				<tr>
					<td>추가 </td>
					<td> <input type="text" name="model"></td>
					<td> <input type="text" name="maker"></td>
					<td> <input type="text" name="serial"></td>
					<td> <input type="text" name="desc"></td>
					<td> <input type="file" name="img"></td>
					<td> <input type="submit" value="추가"> </td>
				</tr>
			</table>
		</form>
	</body>
</html>