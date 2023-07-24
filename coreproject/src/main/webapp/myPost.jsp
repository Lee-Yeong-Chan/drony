<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.postDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO mypageDAO=new mypageDAO();
	mypageDAO mypageDAO2=new mypageDAO();
	List <postDTO> allPost=mypageDAO.selectPost(loginExpert.getExp_id());
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
		<table border='1'>
			<tr>
				<td>번호</td>
				<td>작업제목</td>
				<td>작업조회수</td>
				<td>글작성일자</td>
				<td>작업단가</td>
				<td>요청받은개수</td>
			</tr>
			<%if (allPost!=null){
				for(int i=0;i<allPost.size();i++){%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=allPost.get(i).getW_title()%></td>
				<td><%=allPost.get(i).getW_view()%></td>
				<td><%=allPost.get(i).getCreated_at()%></td>
				<td><%=allPost.get(i).getW_price()%></td>
				<td><%=mypageDAO2.selectPostToUser(loginExpert.getExp_id())%></td>
				<td><a href="?w_idx=<%=allPost.get(i).getW_idx()%>">수정</a></td>
				<td><a href="?w_idx=<%=allPost.get(i).getW_idx()%>">삭제</a></td>
			</tr>
			<%	}
			}%>
		</table>
	</body>
</html>