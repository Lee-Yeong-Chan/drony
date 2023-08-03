<%@page import="com.smhrd.domain.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
%>
<html>
	<head>
		<title>DRONY</title>
   		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
    <div id="page-wrapper">
        <!-- Header -->
        <%@include file="header.jsp" %>

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-3 col-12-medium">
                        <div class="sidebar">
                            <!-- Sidebar -->
                            
                            <!-- "내 프로필" 섹션 -->
                            
                                <h3 class="major"><span><%=loginUser.getUser_id() %>님</span></h3>
                                <ul class="divided">
                                    <li>
                                        <article class="box mypage-menu">
                                            <h1><a href="mypageUser.jsp">내 프로필</a></h1>
                                        </article>
                                    </li>
                                    <li>
                                        <article class="box mypage-menu">
                                            <h1><a href="workUser.jsp">작업의뢰 현황</a></h1>
                                        </article>
                                    </li>
                                </ul>
                                <table>
	                               	<tr>
                               			<td colspan='2' align="right" style="font-size: 0.8em;">
	                               			<a href='updateUser.jsp'>개인정보수정</a> &nbsp;
	                               			<a href="deleteUserCon">회원탈퇴</a>
                               			</td>
                          			</tr>
                               	</table>
                        </div>
                    </div>
                    
                    <!-- 오른쪽 페이지 -->
                    <div class="col-9 col-12-medium imp-medium">
                        <div class="content">
                            <!-- "내 프로필" 섹션 -->
                            <section class="section-mypage">
                                <article class="box page-content">
                                    <header>
                                        <h3><%=loginUser.getUser_id() %>님의 프로필</h3>
                                    </header>
                                    
                                    <section class="mypagetable">
                                    	<h5>개인 정보</h5>
                                        <table>
                                            <tr>
                                                <td class="co1">아이디</td>
                                                <td class="co2"><%=loginUser.getUser_id() %></td>
                                            </tr>
                                            <tr>
                                                <td class="co1">이름</td>
                                                <td class="co2"><%=loginUser.getUser_name() %></td>
                                            </tr>
                                            <tr>
                                                <td class="co1">이메일</td>
                                                <td class="co2"><%=loginUser.getUser_email() %></td>
                                            </tr>
                                            <tr>
                                                <td class="co1">전화번호</td>
                                                <td class="co2"><%=loginUser.getUser_phone() %></td>
                                            </tr>
                                            </tr>
                                        </table>
                                        
                                    </section>
                                </article>
                            </section>

                            <!-- Footer -->
							<%@include file="footer.jsp" %>

                        </div>
                    </div>
                </div>
            </div>
        </section>
               
      <!-- Footer -->
      <%@include file="footer.jsp" %>
            
   </div>
   
   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/jquery.scrolly.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
   
	</body>
</html>