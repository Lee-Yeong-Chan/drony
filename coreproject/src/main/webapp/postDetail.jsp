<%@page import="com.smhrd.domain.expertDroneDTO"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDAO"%>
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
   expertDAO expertDAO=new expertDAO();
   expertDTO expertPost=expertDAO.selectExpertPost(w_idx);
   mypageDAO mypageDAO=new mypageDAO();
   List<expertDroneDTO> droneList=mypageDAO.selectExpertDrone(selectPost.get(0).getExp_id());
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
      <title>DRONY</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
      <style type="text/css">
         #update{
            display: none;
         }
         .css-1nbuyxl {
             color: rgb(154, 155, 167);
             font-size: 11px;
             font-family: 'Metro Sans',sans-serif;
             box-sizing: border-box;
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
               
                  <!-- Sidebar row 밑에 위치-->
                  <%@include file="fisidebar.jsp" %>
                  <!-- 사이드바끝 -->
                  
                  
                  <!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
                  
                  <!-- 게시글 -->
                  <div class="col-8 col-12-medium imp-medium">
                  <!-- Content -->
                  <article class="box page-content">
                     <article id="view" class="postDetail">
                        <h5><%=selectPost.get(0).getW_title()%></h5>
                        <div class="posthead">
                           <div class="id"><span><%=selectPost.get(0).getExp_id()%></span></div>
                           <div class="date"><span style="text-align: right;"><%=selectPost.get(0).getCreated_at().substring(0, selectPost.get(0).getCreated_at().length()-2) %></span></div>
                        </div>
                        <div class="file"><span>첨부파일</span><a href="upload/<%=selectPost.get(0).getW_file() %>" download><i class="icon solid fa-download"></i></a></div>
                        <div class="postimg"><img onerror=this.src="images/<%=x%>.png" src="upload/<%=selectPost.get(0).getW_img()%>"></div>
                        
                        <section class="post-content">
                           <div><b>단가 : </b><%=selectPost.get(0).getW_price() %>원</div>   
                           <div style="border-bottom: solid 1px #efefef; height: 50px;"><%=selectPost.get(0).getW_content() %></div>
                           <div class="exinfo">
								업체명<span><%=expertPost.getCompany_name() %></span><br>
								사업자번호<span><%=expertPost.getBno() %></span><br>
								보유드론<%for (int i=0;i<droneList.size();i++){
								out.print("<span>"+droneList.get(i).getDr_model()+"</span>");
								}%>
								<br>
                           </div>
                        </section>
                        
                        <c:if test="${not empty loginExpert and loginExpert.exp_id eq postExpert}">
                           <button onclick="toggleUpdate()" id="updateButton">수정</button>
                           <button onclick="location.href='deletePostCon?w_idx=<%=selectPost.get(0).getW_idx()%>&w_kind=<%=selectPost.get(0).getW_kind()%>'">삭제</button>
                        </c:if>
                        <c:if test="${not empty loginUser}">
                           <button onclick="location.href='insertWorkUserMypageCon?w_idx=<%=selectPost.get(0).getW_idx()%>&exp_id=<%=selectPost.get(0).getExp_id()%>'">의뢰하기</button>
                        </c:if>
                        <button onclick="location.href='<%=y %>.jsp'">목록</button>
                     </article>
                     
                     
                     <!-- postDetail 수정부분 -->
                     <article id="update">
                        <div>
                           <form action="updatePostCon?w_idx=<%=selectPost.get(0).getW_idx() %>" name="updatePostForm" method="post" enctype="multipart/form-data">
                              <table class="noticetable">
                                 <tr>
                                    <td>제목</td>
                                    <td><input type="text" name="title" value="<%=selectPost.get(0).getW_title()%>"></td>
                                 </tr>
                                 <tr>
                                    <td>분야</td>
                                    <td>
                                       <select name="w_kind">
                                       <option value="">선택</option>
                                       <option value="P">방역·방제·살포</option>
                                       <option value="M">측량</option>
                                       <option value="S">촬영</option>
                                       <option value="T">물류·운송</option>
                                       <option value="E">기타</option>
                                       </select>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>이미지업로드</td>
                                    <td><input type="file" name="file"></td>
                                 </tr>
                                 <tr>
                                    <td>첨부파일</td>
                                    <td><input type="file" name="file"></td>
                                 </tr>
                                 <tr>
                                    <td>단가</td>
                                    <td><input type="text" name="price" value="<%=selectPost.get(0).getW_price()%>"></td>
                                 </tr>
                                 <tr>
                                    <td>내용</td>
                                    <td><textarea type="text" name="content" value="<%=selectPost.get(0).getW_content()%>"></textarea></td>
                                 </tr>
                                 <tr style="text-align: right;">
                                    <td colspan="2"><input type="button" value="수정완료" onclick="subm()"></td>
                                 </tr>
                              </table>
                           </form>
                        </div>
                           
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
                     </article>
                     
                     
                  </article>   
                  </div>
               
            <!-- 여기까지 -->            
                  
               </div>
            </div>
         </section>
         
               
      <!-- Footer -->
      <%@include file="footer.jsp" %>
            
   </div>
   
   
    <!-- 찐 -->
      
      
      <!-- Scripts -->
      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/jquery.dropotron.min.js"></script>
      <script src="assets/js/jquery.scrolly.min.js"></script>
      <script src="assets/js/browser.min.js"></script>
      <script src="assets/js/breakpoints.min.js"></script>
      <script src="assets/js/util.js"></script>
      <script src="assets/js/main.js"></script>
      <script type="text/javascript">
		var form = document.updatePostForm;
		function subm(){
			if(!form.title.value){
				alert("제목을 입력해주세요.");
				form.title.focus();
				return;
			}
			if(!form.content.value){
				alert("내용을 입력해주세요.");
				form.content.focus();
				return;
			}
			if(!form.w_kind.value){
				alert("작업분류를 입력해주세요.");
				form.w_kind.focus();
				return;
			}
			if(!form.price.value){
				alert("작업단가를 입력해주세요.");
				form.price.focus();
				return;
			}
			form.submit();
		}
      </script>
   </body>
</html>