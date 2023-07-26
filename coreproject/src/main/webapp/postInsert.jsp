<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="insertPostCon" method="post">
			<h1> 제목 : <input type="text" name="title"></h1>
			<div>
				<div> 이미지 : <input type="file" name="img"> </div>
				<div> 내용 : <input type="text" name="content"></div>
				<div> 첨부파일 : <input type="file" name="file"></div>
				<div> 단가 : <input type="text" name="price"></div>
			</div>
			</form>
	</body>
</html>