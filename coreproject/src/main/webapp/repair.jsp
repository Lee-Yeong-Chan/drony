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
						
						<!-- sidebar -->
   						<%@include file="boardsidebar.jsp" %>
   						<!-- sidebar끝 -->
						
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
									<div class="col-3 col-6-medium col-12-small" style="width: 100%; overflow: hidden;">
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