<%@page import="com.smhrd.domain.expertInquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.inquiryDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<%
	int number=Integer.valueOf(request.getParameter("number"));
	inquiryDAO inquiryDAO=new inquiryDAO();
	List<expertInquiryDTO> inquiry= inquiryDAO.selectExpertInquiry(number);
%>
	<head>
		<title>DRONY</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<style type="text/css">
			#update{
				display: none;
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
													<li>
														<article class="box side-info">
															<h1><a href="userInquiry.jsp">문의사항</a></h1>
														</article>	
													</li>
												</c:when>
										 		<c:otherwise>
													<li>
														<article class="box side-info">
															<h1><a href="expertInquiry.jsp">문의사항</a></h1>
														</article>
													</li>
										 		</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li>
												<article class="box side-info">
													<h1><a href="login.jsp">문의사항</a></h1>
												</article>
											</li>
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
											<h1><a href="civilComplaint.jsp">원스탑민원서비스</a></h1>
										</article>
									</li>
   								</ul>
   							
   							
   						</div>
   					</div>
   				
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>문의사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<div id="view" class="mypagetable" style="margin-left: 30px;">
   									<table class="noticetable" style="height: 180px;">
   										<tr>
   											<td style="width: 25%;">작성자</td>
   											<td class="co3"><%=inquiry.get(0).getexp_id() %></td>
   										</tr>
   										<tr>
   											<td>날짜</td>
   											<td class="co3"><%=inquiry.get(0).getCreated_at() %></td>
   										</tr>
   										<tr>
   											<td>제목</td>
   											<td class="co3"><%=inquiry.get(0).getInq_title() %></td>
   										</tr>
   										<tr>
   											<td>첨부파일</td>
   											<td class="co3"><%=inquiry.get(0).getInq_file()%></td>
   										</tr>
   										<tr style="height: 150px;">
   											<td>내용</td>
   											<td class="co3"><%=inquiry.get(0).getInq_content() %></td>
   										</tr>
   										<tr>
	   										<td colspan='2' align="right">
	   											<button onclick="toggleUpdate()" id="updateButton">수정</button>
												<button onclick="location.href='deleteExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>'">삭제</button>
												<button onclick="location.href='expertInquiry.jsp'">목록</button>
	   										</td>
	   									</tr>
   									</table>
   								</div>
   								
								<div id="update" class="mypagetable" style="margin-left: 30px;">
									<form action="updateExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>" method="post">
										<table class="noticetable" style="height: 180px;">
											<tr>
   												<td>작성자</td>
   												<td><%=inquiry.get(0).getexp_id() %></td>
   											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="title" placeholder="<%=inquiry.get(0).getInq_title()%>"></td>
											</tr>
											<tr>
												<td>첨부파일</td>
												<td><input type="text" name="file" placeholder="<%=inquiry.get(0).getInq_file()%>"></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="6" cols="" name="content" placeholder="<%=inquiry.get(0).getInq_content()%>"></textarea></td>
											</tr>
											<tr>
												<td colspan='2' style="text-align:right;"><input type="submit" value="수정"></td>
											</tr>
										</table>
									</form>
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