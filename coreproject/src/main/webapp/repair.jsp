<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.domain.droneCompanyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.droneCompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	droneCompanyDAO droneCompanyDAO=new droneCompanyDAO();
	List <droneCompanyDTO> dcRepairList=droneCompanyDAO.selectRepairDroneCompany();
		String pageN=request.getParameter("pageNum");
		if(pageN==null){
			pageN="1";
		}
		int pageNum=Integer.valueOf(pageN);
		int startRow=(pageNum-1)*9+1;
		int startPage=0, endPage=0;
		if(dcRepairList.size()!=0){
			int pageCount=dcRepairList.size()/9+(dcRepairList.size()%9==0?0:1);
			if(pageNum<=3){
				startPage=((pageNum-1)/5)*5+1;
			}
			else if(pageNum>=pageCount-2){
				startPage=pageCount-4;
			}
			else{
				startPage=pageNum-2;
			}			
			endPage=startPage+4;
			if(endPage>pageCount){
				endPage=pageCount;
			}
		}
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
									<%if(pageNum==dcRepairList.size()/9+1){
										for(int i=(dcRepairList.size()/9)*9; i<dcRepairList.size(); i++){ %>
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
									<%	} 
									}
									else if(pageNum<dcRepairList.size()/9+1){
										for(int i=(pageNum-1)*9; i<9*pageNum; i++){ %>
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
									<%	} 
									}
									else{
									%>
										<div class="col-3 col-6-medium col-12-small">
											<section class="box feature droneCom">
												<a>
													<img>
												</a>
												<p class="dronecomp">
												<a class="dronecoma">
												</a>
												</p>
											</section>
										</div>
									<%} %>
								</div>
							</div>
							<div class="page-wrap">
								<ul class="page-nation">
								<%for(int i=startPage;i<=endPage;i++){%>
									<li><a href="repair.jsp?pageNum=<%=i%>"><%=i%></a></li>
								<%}%>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>