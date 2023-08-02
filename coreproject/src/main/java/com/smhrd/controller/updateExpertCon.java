package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

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
		expertDTO updateExpert=new expertDTO(id,pw,name,email,phone,bno,cname,cadd,warea,wfield);
		expertDAO expertDAO=new expertDAO();
		int cnt=expertDAO.updateExpert(updateExpert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			session.setAttribute("loginExpert", updateExpert);
			out.println("<script>alert('내 정보 수정 완료'); location.href='mypageExpert.jsp';</script>");
		}
		else{
			out.println("<script>alert('내 정보 수정 실패'); location.href='updateExpert.jsp';</script>");
		}
	}
}