<%@page import="com.smhrd.domain.mypageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO dao=new mypageDAO();
	List<mypageDTO> mypageList= dao.selectExpertMypage(loginExpert.getExp_id());
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/chat.css" />
		<style type="text/css">
			#modal_background{
				display: none;
			}
			
			input[type="submit"] {
				font-family: "FontAwesome";
			}
		</style>
	
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
   		
   		<!-- Header -->
		<%@include file="header.jsp" %>
   
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							<!-- Sidebar -->
   							
   							<!-- My page -->
   							
   								<h3 class="major"><span>🍀<%=loginExpert.getExp_id() %>님의 마이페이지</span></h3>
   								<ul class="divided">
   									<li>
   										<article class="box mypage-menu">
											<h1><a href="mypageExpert.jsp">내프로필</a></h1>
										</article>
   									</li>
   									<li>
										<article class="box mypage-menu">
											<h1><a href="myPost.jsp">내게시글</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="workExpert.jsp">작업목록</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="droneList.jsp">드론관리</a></h1>
										</article>
									</li>
   								</ul>
   								<table>
						     	 <tr>
						         	<td colspan='2' align="right" style="font-size: 0.8em;">
						         		<a href="updateExpert.jsp">개인정보수정</a> &nbsp;
						         		<a href="deleteExpertCon">회원탈퇴</a>	
						         	</td>
						         </tr>
						     </table>
   							
   						</div>
   					</div>
   					
   					<!-- 오른쪽 메인페이지 -->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>작업 목록</h3>
   								</header>
   								
   								<section class="mycontent">
   									<table>
   										<thead>
										<tr>
											<td style="text-align: center;">번호</td>
											<td>제목</td>
											<td>의뢰인</td>
											<td>진행상황</td>
											<td>갱신날짜</td>
											<td>1:1상담</td>
										</tr>
										</thead>
										<%if (mypageList!=null){
											for(int i=0;i<mypageList.size();i++){%>
										<tr style="border-bottom: solid 1px #e7eae8;" height='33px'>
											<td style="text-align: center;"><%=(i+1) %></td>
											<td><a href="postDetail.jsp?w_idx=<%=mypageList.get(i).getW_idx()%>"><%=mypageList.get(i).getW_title()%></a></td>
											<td><%=mypageList.get(i).getUser_id()%></td>
											<td>
												<form action="updateMypageCon" method="post">
													<select name="status">
														<option disabled><%=mypageList.get(i).getStatus_memo()%></option>
														<option value="상담대기">상담대기</option>
														<option value="상담중">상담중</option>
														<option value="계약완료">계약완료</option>
														<option value="작업중">작업중</option>
														<option value="작업완료">작업완료</option>
													</select>
													<input type="submit" value="수정">
													<% session.setAttribute("updateStatus_idx", mypageList.get(i).getStatus_idx());%>
												</form>
											</td>
											<td><%=mypageList.get(i).getCreated_at()%></td>
											<td><button id="chat" onclick="modalOpen()"><i class="icon solid fa-comments"></i></button>
												<button onclick="location.href='deleteWorkExpertMypageCon?tuw_idx=<%=mypageList.get(i).getTuw_idx()%>'"><i class="icon solid fa-trash"></i></button></td>
										</tr>
										<%	}
										}%>
									</table>
   								</section>
   								
   							</article>
   						</div>
   					</div>
   				</div>
   				
   				<!-- 모달창 -->
   					<div class="wrap">
   						<div class="closebtn"><button>X</button></div>
   						<div class="userchat">
   							<div class="chat ch1">
					            <div class="icon"><i class="icon solid fa-user"></i></div>
					            <div class="textbox">안녕하세요. 반갑습니다.</div>
					        </div>
					        <div class="chat ch2">
					            <div class="icon"><span>🍀</span><i class="icon solid fa-user"></i></div>
					            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
					        </div>
					        <div class="chat ch1">
					            <div class="icon"><i class="icon solid fa-user"></i></div>
					            <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
					        </div>
					        <div class="chat ch2">
					            <div class="icon"><span>🍀</span><i class="icon solid fa-user"></i></div>
					            <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
					        </div>
					        <div class="input-text">
					        	<input type="text" class="text_input" placeholder="메세지를 입력하세요.">
					    	</div>
					    	<div class="sub">
					    		<span class="file"></span>
					    		<span class="submit"><input type="submit" value="전송"></span>
					    	</div>
   						</div>
   					</div>
   				
   				<script>
   					// 모달 열기
   					function modalOpen(){
   						document.querySelector('.wrap').style.display='block';
   					}
   					// 모달 끄기
   					function modalClose(){
   						document.querySelector('.wrap').style.display='none';
   						
   					}
   					//버튼 클릭리스너 달기
   					document.querySelector("#chat").addEventListener('click', modalOpen);
   					document.querySelector(".closebtn").addEventListener('click', modalClose);
   				</script>
   				<!-- 모달끝 -->
   				
   			</div>
   		</section>
   		
   		
   		      
		<!-- Footer -->
		<%@include file="footer.jsp" %>
		      
	</div>
	
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