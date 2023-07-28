<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	int w_idx=Integer.valueOf(request.getParameter("w_idx"));
	workDAO workDAO=new workDAO();
	List<workDTO> selectPost=workDAO.selectWork(w_idx);
	
	String x, y;
	if(selectPost.get(0).getW_kind().equals("P")){
		x="farm";
		y="pestControl";
	}
	else if(selectPost.get(0).getW_kind().equals("M")){
		x="measure";
		y="measure";
	}
	else if(selectPost.get(0).getW_kind().equals("S")){
		x="camera";
		y="shooting";
	}
	else if(selectPost.get(0).getW_kind().equals("T")){
		x="delivery";
		y="transport";
	}
	else if(selectPost.get(0).getW_kind().equals("E")){
		x="hobbydrone";
		y="etc";
	}
	else{
		x="";
		y="";
	}
	session.setAttribute("postExpert", selectPost.get(0).getExp_id());
%>
<html>
	<head>
		<title>게시글 수정</title>
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
		<article id="view">
		<!-- 배치 어떻게 해야할지 감이 안옴... -->
		<%@include file="header.jsp" %> 
			<h1><%=selectPost.get(0).getW_title()%></h1>
			<div>
				<div> <img onerror=this.src="images/<%=x%>.png" src="upload/<%=selectPost.get(0).getW_img()%>"></div>
				<div><%=selectPost.get(0).getW_content() %></div>
				<div> <a href="upload/<%=selectPost.get(0).getW_file()%>" download>첨부파일</a></div>
				<div><%=selectPost.get(0).getW_price() %></div>
				<div><%=selectPost.get(0).getExp_id()%></div>
				<div><%=selectPost.get(0).getCreated_at().substring(0, selectPost.get(0).getCreated_at().length()-2) %></div>
			</div>
		</article>
		<article id="update">
			<form action="updatePostCon?w_idx=<%=selectPost.get(0).getW_idx() %>" method="post">
				<h1> 제목 : <input type="text" name="title" placeholder="<%=selectPost.get(0).getW_title()%>"></h1>
				<div>
					<!-- 위랑 같은 배치 맞춰주면 좋을것 같음 -->
					<!-- Header -->		
					<%@include file="header.jsp" %> 
					
					<div> 분야 : 
						<select name="w_kind">
							<option value="">선택</option>
							<option value="P">방역·방제·살포</option>
							<option value="M">측량</option>
							<option value="S">촬영</option>
							<option value="T">물류·운송</option>
							<option value="E">기타</option>
						</select>
					</div>
					<div> 이미지 : <input type="file" name="img"> </div>
					<div> 내용 : <input type="text" name="content" placeholder="<%=selectPost.get(0).getW_content()%>"></div>
					<div> 첨부파일 : <input type="file" name="file"></div>
					<div> 단가 : <input type="text" name="price" placeholder="<%=selectPost.get(0).getW_price()%>"></div>
				</div>
			</form>
		</article>
			<c:if test="${not empty loginExpert and loginExpert.exp_id eq postExpert}">
				<button onclick="toggleUpdate()" id="updateButton">수정</button>
				<button onclick="location.href='deletePostCon?w_idx=<%=selectPost.get(0).getW_idx()%>&w_kind=<%=selectPost.get(0).getW_kind()%>'">삭제</button>
			</c:if>
			<c:if test="${not empty loginUser}">
				<button onclick="location.href='insertWorkUserMypageCon?w_idx=<%=selectPost.get(0).getW_idx()%>&exp_id=<%=selectPost.get(0).getExp_id()%>'">의뢰하기</button>
			</c:if>
			<button onclick="location.href='<%=y %>.jsp'">목록</button>
		
		<!-- Scripts -->
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
			<!-- Footer -->
			<%@include file="footer.jsp" %>
		
		
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