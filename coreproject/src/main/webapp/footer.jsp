<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<title>DRONY</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">
						<ul>
							<li><a href="notice.jsp">공지사항</a></li>
								<c:choose>
									<c:when test="${not empty loginUser or not empty loginExpert}">
										<c:choose>
											<c:when test="${not empty loginUser}">
											<li><a href="userInquiry.jsp">문의사항</a></li>
											</c:when>
										 	<c:otherwise>
										 	<li><a href="expertInquiry.jsp">문의사항</a></li>
										 	</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<li><a href="login.jsp">문의사항</a></li>
									</c:otherwise>
								</c:choose>
							<li><a href="sale.jps">판매업체</a></li> 
							<li><a href="repair.jsp">수리업체</a></li> 
							<li><a href="flight.jsp">비행가능지도</a></li> 
							<li><a href="civilComplaint.jsp">드론원스탑민원서비스</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>