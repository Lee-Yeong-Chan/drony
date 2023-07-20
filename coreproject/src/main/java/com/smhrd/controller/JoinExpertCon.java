package com.smhrd.controller;
import java.io.IOException;
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
		if(cnt>0) {
			response.sendRedirect("main.html");
		}
	}
}
