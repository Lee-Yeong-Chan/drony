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
	<body>
	   <div class="is-preload">
         
         <!-- Header -->
      <%@include file="header.jsp" %>
   
         <!-- Main -->
         <section id="main">
            <div class="container">
               <div class="row">
                  <div class="col-3 col-12-medium">
                     <div class="sidebar">
                        <!-- Sidebar -->
                        
                        <!-- My page -->
                        <section>
                           <h3 class="major"><span><%=loginUser.getUser_id() %> 님의 프로필</span></h3>
                           <ul class="devided">
                              <li>
                                 <article class="box mypage-menu">
                                 <h1><a href="mypageUser.jsp">내프로필</a></h1>
                              </article>
                              </li>
                            
                           <li>
                              <article class="box mypage-menu">
                                 <h1><a href="workUser.jsp">작업의뢰현황</a></h1>
                              </article>
                           </li>
                          </ul>
                        </section>
                        
                     </div>
                  </div>
                  <div class="col-9 col-12-medium imp-medium">
                     <div class="content">
                        <!-- Content -->
                        <article class="box page-content">
                           <header>
                              <h2><%=loginUser.getUser_id() %>님의 프로필</h2>
                           </header>
                           
                           <section class="mypagetable">
                              <table>
                                 <tr>
                                    <td>아이디</td>
                                    <td><%=loginUser.getUser_id() %></td>
                                 </tr>
                                 <tr>
                                    <td>이름</td>
                                    <td><%=loginUser.getUser_name() %></td>
                                 </tr>
                                 <tr>
                                    <td>이메일</td>
                                    <td><%=loginUser.getUser_email() %></td>
                                 </tr>
                                 <tr>
                                    <td>전화번호</td>
                                    <td><%=loginUser.getUser_phone() %></td>
                                 </tr>
                                
                                 
                                
                                 
                              </table>
                           </section>
                           
                        </article>
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