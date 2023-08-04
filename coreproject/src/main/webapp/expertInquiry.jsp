<%@page import="com.smhrd.domain.expertInquiryDTO"%>
<%@page import="com.smhrd.domain.inquiryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	String pageN=request.getParameter("pageNum");
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	inquiryDAO inquiryDAO=new inquiryDAO();
	List<expertInquiryDTO> expertInquiryList=inquiryDAO.selectAllExpertInquiry(loginExpert.getExp_id());
	if(pageN==null){
		pageN="1";
	}
	int pageNum=Integer.valueOf(pageN);
	int startRow=(pageNum-1)*10+1;
	int startPage=0, endPage=0;
	if(expertInquiryList.size()!=0){
		int pageCount=expertInquiryList.size()/10+(expertInquiryList.size()%10==0?0:1);
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
<html>
	<head>
		<title>Insert title here</title>
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
	   					<!-- sidebar -->
	   					<%@include file="boardsidebar.jsp" %>
	   					<!-- sidebar끝 -->
	   					<div class="col-9 col-12-medium imp-medium">
	   						<div class="content">
	   							<!-- Content -->
	   							<article class="box page-content">
	   								<header>
	   									<h3>문의사항</h3>
	   								</header>
	   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
	   								<section class="mycontent" style="margin-left: 30px;">								
										<table class="noticetable">
											<thead>
												<tr>
													<td colspan='4' align="right"><span><a href="expertInquiryInsert.jsp">문의 작성하기</a></span></td>
												</tr>
												<tr>
													<td class="co1" style="text-align: center; width: 10%;">순번</td>
													<td class="co1" style="width: 40%;">제목</td>
													<td class="co1" style="width: 20%;">작성자</td>
													<td class="co1" style="width: 30%;">작성일자</td>
												</tr>
											</thead>
											<tbody>
												<%if(pageNum==expertInquiryList.size()/10+1){
													for(int i=(expertInquiryList.size()/10)*10; i<expertInquiryList.size(); i++){ %>
													<tr style="border-bottom: solid 1px #e7eae8;" height='33px'>
														<td style="text-align: center;"><%=i+1 %></td>
														<td><a href="expertInquiryView.jsp?number=<%=expertInquiryList.get(i).getInq_idx()%>"><%=expertInquiryList.get(i).getInq_title()%></a></td>
														<td><%=expertInquiryList.get(i).getexp_id()%></td>
														<td align="right"><%=expertInquiryList.get(i).getCreated_at()%></td>
													</tr>
												<%	} 
												}
												else if(pageNum<expertInquiryList.size()/10+1){
													for(int i=(pageNum-1)*10+1; i<10*pageNum+1; i++){ %>
													<tr style="border-bottom: solid 1px #e7eae8;" height='33px'>
														<td style="text-align: center;"><%=i+1 %></td>
														<td><a href="expertInquiryView.jsp?number=<%=expertInquiryList.get(i).getInq_idx()%>"><%=expertInquiryList.get(i).getInq_title()%></a></td>
														<td><%=expertInquiryList.get(i).getexp_id()%></td>
														<td align="right"><%=expertInquiryList.get(i).getCreated_at()%></td>
													</tr>
												<%	} 
												}
												else{
												%>
												<tr>
													<td style="text-align: center;"></td>
													<td><a></a></td>
													<td></td>
													<td align="right"></td>
												</tr>
												<%} %>
											</tbody>
										</table>
									</section>
									<div class="page-wrap">
										<ul class="page-nation">
										<%for(int i=startPage;i<=endPage;i++){%>
											<li><a href="expertInquiry.jsp?pageNum=<%=i%>"><%=i%></a></li>
										<%}%>
										</ul>
									</div>
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