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
		<title>내작업 의뢰 현황</title>
		<meta charset="UTF-8">
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
								<!-- My page -->
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
						<!-- 오른쪽 메인페이지 -->
						<div class="col-9 col-12-medium imp-medium">
							<div class="content">
								<!-- Content -->
								<article class="box page-content">
									<header>
										<h3>계약 목록</h3>
									</header>
									<section class="mycontent" style="margin-left: 50px;">
										<table>
											<thead>
												<tr>
													<td style="text-align: center;">번호</td>
													<td>의뢰한 작업명</td>
													<td>진행 상황</td>
													<td>상황 갱신 날짜</td>
													<td>채팅방</td>
												</tr>
											</thead>
											<tbody>
											<%if (mypageList!=null){
												for(int i=0;i<mypageList.size();i++){%>
											<tr>
												<td style="text-align: center;"><%=(i+1) %></td>
												<td><a href="postDetail.jsp?w_idx=<%=mypageList.get(i).getW_idx()%>"><%=mypageList.get(i).getW_title()%></a></td>
												<td><%=mypageList.get(i).getStatus_memo()%></td>
												<td><%=mypageList.get(i).getCreated_at().substring(0, mypageList.get(i).getCreated_at().length()-2)%></td>
												<td>
												<button onclick="location.href='chattingRoom.jsp?tuw_idx=<%=mypageList.get(i).getTuw_idx()%>'"><i class="icon solid fa-comments"></i></button>
												<button onclick="location.href='deleteWorkUserMypageCon?tuw_idx=<%=mypageList.get(i).getTuw_idx()%>'"><i class="icon solid fa-trash"></i></button>
											</tr>
											<%	}
											}%>
											</tbody>
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