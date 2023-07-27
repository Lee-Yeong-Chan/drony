package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.userDAO;
import com.smhrd.domain.userDTO;
public class LoginUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		userDTO loginUser =new userDTO(id,pw);
		userDAO userDAO=new userDAO();
		userDTO login=userDAO.selectUser(loginUser);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(login!=null) {
	         HttpSession session = request.getSession();
	         session.setAttribute("loginUser", login);
	         response.sendRedirect("main.jsp");
		}
		else {
			out.println("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); location.href='userLogin.jsp';</script>");
		}
		
	}
}