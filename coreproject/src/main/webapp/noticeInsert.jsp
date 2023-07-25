<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>공지사항</h1>
		<div>
			<form action="insertNoticeCon" method="post">
				<h1> 제목<input type="text" name="title"></h1>
				<div>
					내용<input type="text" name="content">
				</div>
				<div>
					첨부파일<input type="text" name="file">
				</div>
				<input type="submit" value="추가">
			</form>
		</div>
	</body>
</html>