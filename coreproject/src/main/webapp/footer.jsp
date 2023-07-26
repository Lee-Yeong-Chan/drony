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
<body class="homepage">
	
		<footer id="footer">
			<ul>
				<li style="white-space: nowrap;"><a href="notice.jsp">공지사항</a></li>
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
				<li style="white-space: nowrap;"><a href="sale.jsp">판매업체</a></li> 
				<li style="white-space: nowrap;"><a href="repair.jsp">수리업체</a></li> 
				<li style="white-space: nowrap;"><a href="flight.jsp">비행가능지도</a></li> 
				<li style="white-space: nowrap;"><a href="civilComplaint.jsp">드론원스탑민원서비스</a></li>
			</ul>
		</footer>
	
</body>
</html>