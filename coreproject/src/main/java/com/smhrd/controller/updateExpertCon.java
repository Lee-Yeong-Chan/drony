package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.expertDAO;
import com.smhrd.domain.expertDTO;
public class updateExpertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String id = ((expertDTO)session.getAttribute("loginExpert")).getExp_id();
		String pw =request.getParameter("pw");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String bno =request.getParameter("bno");
		String cname =request.getParameter("cname");
		String cadd =request.getParameter("cadd");
		String warea =request.getParameter("warea");
		String wfield =request.getParameter("wfield");
		if (pw.equals("")) {
			pw=null;
		}
		if (name.equals("")) {
			name=null;
		}
		if (email.equals("")) {
			email=null;
		}
		if (phone.equals("")) {
			phone=null;
		}
		if (bno.equals("")) {
			bno=null;
		}
		if (cname.equals("")) {
			cname=null;
		}
		if (cadd.equals("")) {
			cadd=null;
		}
		if (warea.equals("")) {
			warea=null;
		}
		if (wfield.equals("")) {
			wfield=null;
		}
		expertDTO updateExpert=new expertDTO(id,pw,name,email,phone,bno,cname,cadd,warea,wfield);
		expertDAO expertDAO=new expertDAO();
		int cnt=expertDAO.updateExpert(updateExpert);
		if(cnt>0) {
			request.setAttribute("loginExpert", updateExpert);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
		else{
			response.sendRedirect("updateExpert.jsp");
		}
	}
}