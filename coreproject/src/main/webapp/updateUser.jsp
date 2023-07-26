<%@page import="com.smhrd.domain.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
%>
<html>
	<head>
		<title>개인정보 수정</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 1em;
        }
        
        nav {
            background-color: #444;
            padding: 0.5em;
            text-align: center;
        }
        
        nav a {
            color: #fff;
            text-decoration: none;
            padding: 0.5em 1em;
            margin: 0.2em;
        }
        
        nav a:hover {
            background-color: #555;
        }
        
        .container {
            max-width: 600px;
            margin: 2em auto;
            background-color: #fff;
            padding: 1em;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }
        
        form {
            margin-top: 1em;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.5em;
            margin: 0.5em 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 0.5em 1em;
            border: none;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #444;
        }
    </style>
		<a href="mypageUser.jsp">내 프로필</a>
		<a href="updateUser.jsp">개인 정보 수정</a>
		<a href="workUser.jsp">작업 진행 상황</a>
	<body>
		<form action="updateUserCon" method="post">
			변경할 비밀번호 : <input type="password" name="pw"><br>
			변경할 이름 : <input type="text" placeholder="<%=loginUser.getUser_name() %>" name="name"><br>
			변경할 이메일 : <input type="text" placeholder="<%=loginUser.getUser_email() %>" name="email"><br>
			변경할 전화번호 : <input type="text" placeholder="<%=loginUser.getUser_phone() %>" name="phone"><br>
			<input type="submit" name="수정">			
		</form>
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