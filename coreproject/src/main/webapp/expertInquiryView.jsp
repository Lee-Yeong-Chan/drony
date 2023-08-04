<%@page import="com.smhrd.domain.expertDAO"%>
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
		expertDAO expertDAO=new expertDAO();
	%>
	<head>
		<title>DRONY</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
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
	   								<div id="view">
	   									<table class="inquiryview">
	   										<thead>
	   											<tr>
	   												<td><h5><%=inquiry.get(0).getInq_title() %></h5></td>
	   												<td align="right" style="vertical-align: bottom"><%=inquiry.get(0).getexp_id() %>(<%=expertDAO.selectExpertInquiry(inquiry.get(0).getexp_id()).getExp_email()%>)</td>
	   											</tr>
	   										</thead>
	   										<tbody>
	   											<tr>
	   												<td><span>첨부파일<a href="inquiry/<%=inquiry.get(0).getInq_file()%>" download><i class="icon solid fa-download"></i></a></span></td>
	   												<td align="right"><span><%=inquiry.get(0).getCreated_at() %></span></td>
	   											</tr>
	   											<tr style="height: 50px;">
	   												<td colspan="2"><span><%=inquiry.get(0).getInq_content() %></span></td>
	   											</tr>
	   										</tbody>
										</table>
									</div>
									<div>
										<button onclick="toggleUpdate()" id="updateButton">수정</button>
										<button onclick="location.href='deleteExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>'">삭제</button>
										<button onclick="location.href='expertInquiry.jsp'">목록</button>
									</div>
									<div id="update" class="mypagetable" style="margin-left: 30px;">
										<form action="updateExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>" name="updateExpertInquiryForm" method="post" enctype="multipart/form-data">
											<table class="noticetable" style="height: 180px;">
												<tr>
	   												<td>작성자</td>
	   												<td><%=inquiry.get(0).getexp_id() %></td>
	   											</tr>
												<tr>
													<td>제목</td>
													<td><input type="text" name="title" value="<%=inquiry.get(0).getInq_title()%>"></td>
												</tr>
												<tr>
													<td>첨부파일</td>
													<td><input type="text" name="file" value="<%=inquiry.get(0).getInq_file()%>"></td>
												</tr>
												<tr>
													<td>내용</td>
													<td><textarea rows="6" cols="" name="content" value="<%=inquiry.get(0).getInq_content()%>"></textarea></td>
												</tr>
												<tr>
													<td colspan='2' style="text-align:right;"><input type="button" value="수정" onclick="subm()"></td>
												</tr>
											</table>
										</form>
									</div>
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
			var form = document.updateExpertInquiryForm;
			function subm(){
				if(!form.title.value){
					alert("제목을 입력해주세요.");
					form.title.focus();
					return;
				}
				if(!form.content.value){
					alert("내용을 입력해주세요.");
					form.content.focus();
					return;
				}
				form.submit();
			}
		</script>							
	</body>
</html>