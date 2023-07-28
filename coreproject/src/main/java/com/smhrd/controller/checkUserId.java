package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.userDAO;
import com.smhrd.domain.userDTO;
public class checkUserId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>function decide(){document.getElementById('decide').innerHTML = '<span style=\'color:red;\'>ID 중복 여부를 확인해주세요.</span>document.getElementById('decide_id').value = document.getElementById('uid').valuedocument.getElementById('uid').disabled = truedocument.getElementById('join_button').disabled = falsedocument.getElementById('check_button').value = '다른 ID로 변경'document.getElementById('check_button').setAttribute('onclick', 'change()')}</script>");
		out.println("<script>function change(){document.getElementById('decide').innerHTML = '<span style=\'color:red;\'>ID 중복 여부를 확인해주세요.</span>'document.getElementById('uid').disabled = falsedocument.getElementById('uid').value = ''document.getElementById('join_button').disabled = truedocument.getElementById('check_button').value = 'ID 중복 검사'document.getElementById('check_button').setAttribute('onclick', 'checkid()'')}</script>");
		String user_id=request.getParameter("user_id");
		userDAO userDAO=new userDAO();
		userDTO check=null;
		try {
			check=userDAO.selectUserId(user_id);
			out.println("<p><input type=button value=\"다른 ID 사용\" onclick=\"opener.parent.change(); window.close()\"></p><script>alert('사용불가능한 아이디입니다.');</script>");
		} 
		catch (Exception e) {
			out.println("<p><input type=button value='이 ID 사용' onclick='opener.parent.decide(); window.close();'></p><script>alert('사용가능한 아이디입니다.');</script>");
		}
		finally {			
		}
	}
}