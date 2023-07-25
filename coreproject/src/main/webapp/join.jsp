<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        #wrap {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .k-container {
            text-align: center;
        }
        .sign-up-wrap {
            background-color: #4c8ac8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        .sub-text {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }
        .type01, .type02 {
        text-align: center;
        }
        .membership-type {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .membership-type li {
            flex: 1;
            margin: 0 30px;
        }
        .membership-type p {
            font-size: 18px;
            color: #333;
            margin: 30px 0;
        }
        .membership-type strong {
            font-size: 18px;
            color: #000;
        }
        .btn-join {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 0 auto;
            padding: 12px 24px;
            font-size: 16px;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            background-color: #007bff;
            transition: background-color 0.3s ease;
        }
        .btn-join:hover {
            background-color: #0056b3;
        }
</style>
	</head>
	<body>
		<div id="wrap">
        <article id="contents">
        <div class="k-container">
        <div class="sign-up-warp">
        <h2 class="title">회원유형 선택</h2>
        <p class="sub-text">DRONY에 오신 것을 환영합니다.
        </p>
        
        <ul class="membership-type">
        <li class="type01">
        <p>
            <strong>일반 회원</strong>
           
        </p>
        <a href="userjoin.jsp" title="일반회원가입" class="btn black-line large btn-join">회원가입</a>
        </li>
        <li class="type02">
        <p>
            <strong>전문가 회원</strong>
           
       </p>
       <a href="expertjoin.jsp" title="전문가 회원가입" class="btn black-line large btn-join">회원가입</a>
       </li>
       </ul>
    </div>
</div>
</article>
</div>
	</body>
</html>

