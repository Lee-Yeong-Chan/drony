package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.expertDAO;
import com.smhrd.domain.expertDTO;
public class JoinExpertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String bno =request.getParameter("bno");
		String company_name =request.getParameter("company_name");
		String company_address =request.getParameter("company_address");
		String working_area =request.getParameter("working_area");
		String working_field =request.getParameter("working_field");
		expertDTO joinExpert=new expertDTO(id,pw,name,email,phone,bno,company_name, company_address, working_area, working_field);
		expertDAO expertDAO=new expertDAO();
		int cnt =expertDAO.insertExpert(joinExpert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('회원가입완료'); location.href='login.jsp';</script>");
		}
		else {
			out.println("<script>alert('회원가입실패'); location.href='expertJoin.jsp';</script>");
		}
	}
}
