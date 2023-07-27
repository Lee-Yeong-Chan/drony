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
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<style type="text/css">
			#update{
				display: none;
			}
		</style>
	</head>
	<body>
		<h1>문의사항</h1>
		<div id="view">
			<h1> 제목<%=inquiry.get(0).getInq_title() %></h1>
			<div>
				내용<%=inquiry.get(0).getInq_content() %>
			</div>
			<div>
				첨부파일<%=inquiry.get(0).getInq_file()%>
			</div>
			<div>
				날짜<%=inquiry.get(0).getCreated_at() %>
			</div>
		</div>
		<div id="update">
			<form action="updateExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>" method="post">
				<h1> 제목<input type="text" name="title" placeholder="<%=inquiry.get(0).getInq_title()%>"></h1>
				<div>
					내용<input type="text" name="content" placeholder="<%=inquiry.get(0).getInq_content()%>">
				</div>
				<div>
					첨부파일<input type="text" name="file" placeholder="<%=inquiry.get(0).getInq_file()%>">
				</div>
				<input type="submit" value="수정완료">
			</form>
		</div>
		<div>
				<button onclick="toggleUpdate()" id="updateButton">수정</button>
				<button onclick="location.href='deleteExpertInquiryCon?inq_idx=<%=inquiry.get(0).getInq_idx()%>'">삭제</button>
			<button onclick="location.href='expertInquiry.jsp'">목록</button>
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
	</body>
</html>