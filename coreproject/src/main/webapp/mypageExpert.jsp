<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
   </head>
   <body>
      <a href="mypageExpert.jsp">내 프로필</a>
      <a href="updateExpert.jsp">개인 정보 수정</a>
      <a href="myPost.jsp">내 게시글</a>
      <a href="workExpert.jsp">작업 진행 상황</a>
      <a href="droneList.jsp">내 드론 현황</a>
      <table>
         <tr>
            <td>아이디</td>
            <td><%=loginExpert.getExp_id() %></td>
         </tr>
         <tr>
            <td>이름</td>
            <td><%=loginExpert.getExp_name() %></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><%=loginExpert.getExp_email() %></td>
         </tr>
         <tr>
            <td>전화번호</td>
            <td><%=loginExpert.getExp_phone() %></td>
         </tr>
         <tr>
            <td>사업자번호</td>
            <td><%=loginExpert.getBno() %></td>
         </tr>
         <tr>
            <td>사업자명</td>
            <td><%=loginExpert.getCompany_name() %></td>
         </tr>
         <tr>
            <td>사업자주소</td>
            <td><%=loginExpert.getCompany_addr() %></td>
         </tr>
         <tr>
            <td>작업가능구역</td>
            <td><%=loginExpert.getWorking_area() %></td>
         </tr>
         <tr>
            <td>작업가능분야</td>
            <td><%=loginExpert.getWorking_field() %></td>
         </tr>
      </table>
   </body>
</html>