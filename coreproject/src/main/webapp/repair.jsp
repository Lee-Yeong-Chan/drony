<%@page import="com.smhrd.domain.droneCompanyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.droneCompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	droneCompanyDAO droneCompanyDAO=new droneCompanyDAO();
	List <droneCompanyDTO> dcRepairList=droneCompanyDAO.selectRepairDroneCompany();
%>
<!DOCTYPE html>
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
								<article class="box page-content">
									<header>
										<h3>드론 수리업체</h3>
									</header>
								</article>
							</div>
							<div>
								<div class="row comlist">
									<%for(int i=0;i<dcRepairList.size();i++){ %>
									<div class="col-3 col-6-medium col-12-small" style="width: 100%;">
										<section class="box feature droneCom">
											<a href="<%=dcRepairList.get(i).getDc_homepage()%>">
												<img alt="abcd" src="<%=dcRepairList.get(i).getDc_img()%>">
											</a>
											<p class="dronecomp"><a class="dronecoma">
												업체명 : <%=dcRepairList.get(i).getDc_name() %><br>
												주소 : <%=dcRepairList.get(i).getDc_addr() %><br>
												연락처 : <%=dcRepairList.get(i).getDc_tel() %><br>
												업체 소개 : <%=dcRepairList.get(i).getDc_info() %>
											</a></p>
										</section>
									</div>
									<%} %>
								</div>
							</div>
							
						</div>
						
						
						
					</div>
				</div>
			</section>
		</div>

	</body>
</html>