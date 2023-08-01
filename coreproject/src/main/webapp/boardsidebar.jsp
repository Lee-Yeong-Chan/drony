<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-3 col-12-medium">
		<div class="sidebar">
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
					<h1><a href="https://drone.onestop.go.kr/" target="_blank">원스탑민원서비스</a></h1>
				</article>
			</li>
		</ul>
		</div>
	</div>
</body>
</html>