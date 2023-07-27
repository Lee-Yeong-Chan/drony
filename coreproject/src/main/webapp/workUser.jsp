<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.mypageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
	mypageDAO dao=new mypageDAO();
	List<mypageDTO> mypageList= dao.selectUserMypage(loginUser.getUser_id());
%>
<html>
	<head>
		<title>내작업 의뢰 현황</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	<style>
        /* 추가한 CSS 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            background-color: #f1f1f1;
        }

        th {
            background-color: #f1f1f1;
        }

        td {
            border-bottom: 1px solid #ccc;
        }

        button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
	<body>
	 <div class="menu-licks">
		<a href="mypageUser.jsp">내 프로필</a>
		<a href="updateUser.jsp">개인 정보 수정</a>
		<a href="workUser.jsp">작업 진행 상황</a>
		</div>
		<h1>의뢰한 계약 목록</h1>
		<table>
			<tr>
				<td>번호</td>
				<td>의뢰한 작업명</td>
				<td>진행 상황</td>
				<td>상황 갱신 날짜</td>
				<td>채팅방</td>
			</tr>
			<%if (mypageList!=null){
				for(int i=0;i<mypageList.size();i++){%>
			<tr>
				<td><%=(i+1) %></td>
				<td><a href="postDetail.jsp?w_idx=<%=mypageList.get(i).getW_idx()%>"><%=mypageList.get(i).getW_title()%></a></td>
				<td><%=mypageList.get(i).getStatus_memo()%></td>
				<td><%=mypageList.get(i).getCreated_at().substring(0, mypageList.get(i).getCreated_at().length()-2)%></td>
				<td><button onclick="location.href='#'">채팅</button></td>
				<td><button onclick="location.href='deleteWorkUserMypageCon?w_idx=<%=mypageList.get(i).getW_idx()%>'">삭제</button></td>
			</tr>
			<%	}
			}%>
		</table>
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