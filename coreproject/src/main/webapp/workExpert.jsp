<%@page import="com.smhrd.domain.chatDTO"%>
<%@page import="com.smhrd.domain.chatDAO"%>
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
	chatDAO chatDAO=new chatDAO();
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/chat.css" />
		<style type="text/css">
			#modal_background{
				display: none;
			}
			
			input[type="submit"] {
				font-family: "FontAwesome";
			}
		</style>
	
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
   							
   								<h3 class="major"><span>🍀<%=loginExpert.getExp_id() %>님</span></h3>
   								<ul class="divided">
   									<li>
   										<article class="box mypage-menu">
											<h1><a href="mypageExpert.jsp">내프로필</a></h1>
										</article>
   									</li>
   									<li>
										<article class="box mypage-menu">
											<h1><a href="myPost.jsp">내게시글</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="workExpert.jsp">작업목록</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="droneList.jsp">드론관리</a></h1>
										</article>
									</li>
   								</ul>
   								<table>
						     	 <tr>
						         	<td colspan='2' align="right" style="font-size: 0.8em;">
						         		<a href="updateExpert.jsp">개인정보수정</a> &nbsp;
						         		<a href="deleteExpertCon">회원탈퇴</a>	
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
   									<h3>작업 목록</h3>
   								</header>
   								
   								<section class="mycontent">
   									<table>
   										<thead>
										<tr>
											<td style="text-align: center;">번호</td>
											<td>제목</td>
											<td>의뢰인</td>
											<td>진행상황</td>
											<td>갱신날짜</td>
											<td>1:1상담</td>
										</tr>
										</thead>
										<%if (mypageList!=null){
											for(int i=0;i<mypageList.size();i++){%>
										<tr style="border-bottom: solid 1px #e7eae8;" height='33px'>
											<td style="text-align: center;"><%=(i+1) %></td>
											<td><a href="postDetail.jsp?w_idx=<%=mypageList.get(i).getW_idx()%>"><%=mypageList.get(i).getW_title()%></a></td>
											<td><%=mypageList.get(i).getUser_id()%></td>
											<td>
												<form action="updateMypageCon" method="post">
													<select name="status">
														<option disabled><%=mypageList.get(i).getStatus_memo()%></option>
														<option value="상담대기">상담대기</option>
														<option value="상담중">상담중</option>
														<option value="계약완료">계약완료</option>
														<option value="작업중">작업중</option>
														<option value="작업완료">작업완료</option>
													</select>
													<input type="submit" id="submitbtn" style="display:none;" />
													<label for ="submitbtn"><i class="icon solid fa-check"></i></label>
													<% session.setAttribute("updateStatus_idx", mypageList.get(i).getStatus_idx());%>
												</form>
											</td>
											<td><%=mypageList.get(i).getCreated_at().substring(0,mypageList.get(i).getCreated_at().length()-2)%></td>
											<td><button id="chat" onclick="location.href='chattingRoom.jsp?tuw_idx=<%=mypageList.get(i).getTuw_idx()%>'"><i class="icon solid fa-comments"></i></button>
												<button onclick="location.href='deleteWorkExpertMypageCon?tuw_idx=<%=mypageList.get(i).getTuw_idx()%>'"><i class="icon solid fa-trash"></i></button></td>
										</tr>
										<%	}
										}%>
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