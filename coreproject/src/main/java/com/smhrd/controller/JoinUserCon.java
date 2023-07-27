package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.userDAO;
import com.smhrd.domain.userDTO;
public class JoinUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		userDTO joinUser=new userDTO(id,pw,name,email,phone);
		userDAO userDAO=new userDAO();
		int cnt=userDAO.insertUser(joinUser);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('회원가입완료'); location.href='login.jsp';</script>");
		}
		else {
			out.println("<script>alert('회원가입실패'); location.href='userJoin.jsp';</script>");
		}
	}
}