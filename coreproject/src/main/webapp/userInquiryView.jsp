<%@page import="com.smhrd.domain.userInquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.inquiryDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<%
	int number=Integer.valueOf(request.getParameter("number"));
	inquiryDAO inquiryDAO=new inquiryDAO();
	List<userInquiryDTO> inquiry= inquiryDAO.selectUserInquiry(number);
%>
	<head>
		<title>Insert title here</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			#update{
				display: none;
			}
		</style>
	</head>
	<body>
		<div id="page-wrapper">
   		
   		<!-- Header -->
		<%@include file="header.jsp" %>
   		 
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							
   							<!-- Sidebar 시작-->
   							
   								
   								<ul class="divided">
   									<li>
   										<article class="box side-info">
											<h1><a href="notice.jsp">공지사항</a></h1>
										</article>
   									</li>
   									<c:choose>
										<c:when test="${not empty loginUser or not empty loginExpert}">
											<c:choose>
												<c:when test="${not empty loginUser}">
													<li style="white-space: nowrap;"><a href="userInquiry.jsp">문의사항</a></li>
												</c:when>
										 		<c:otherwise>
													<li style="white-space: nowrap;"><a href="expertInquiry.jsp">문의사항</a></li>
										 		</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li><a href="login.jsp">문의사항</a></li>
										</c:otherwise>
									</c:choose>
									<li>
										<article class="box side-info">
											<h1><a href="sale.jsp">판매업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="repair.jsp">수리업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="flight.jsp">비행지도</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="https://drone.onestop.go.kr/" target="_blank">원스탑민원서비스</a></h1>
										</article>
									</li>
   								</ul>
   							
   						</div>
   					</div>
   							<!-- Sidebar 끝-->
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>문의사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<div id="view">
								<h1> 제목<%=inquiry.get(0).getInq_title() %></h1>
								<div>
									내용<%=inquiry.get(0).getInq_content() %>
								</div>
								<div>
									<a href="inquiry/<%=inquiry.get(0).getInq_file()%>" download>첨부파일</a>
								</div>
								<div>
									날짜<%=inquiry.get(0).getCreated_at() %>
								</div>
							</div>
							<div id="update">
								<form action="updateUserInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>" method="post">
									<h1> 제목<input type="text" name="title" placeholder="<%=inquiry.get(0).getInq_title()%>"></h1>
									<div>
										내용<input type="text" name="content" placeholder="<%=inquiry.get(0).getInq_content()%>">
									</div>
									<div>
										첨부파일<input type="file" name="file" placeholder="<%=inquiry.get(0).getInq_file()%>">
									</div>
									<input type="submit" value="수정완료">
								</form>
							</div>
							<div>
									<button onclick="toggleUpdate()" id="updateButton">수정</button>
									<button onclick="location.href='deleteUserInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>'">삭제</button>
								<button onclick="location.href='userInquiry.jsp'">목록</button>
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
								
								
   							<!-- 여기까지 -->
   							</article>
   							
   						</div>
   					</div>
   				</div>
   			</div>
   		</section>
       
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