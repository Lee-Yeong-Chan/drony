package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.inquiryDAO;
import com.smhrd.domain.expertDTO;
import com.smhrd.domain.expertInquiryDTO;
public class insertExpertInquiryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		HttpSession session=request.getSession();
		String expert_id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
		expertInquiryDTO insert=new expertInquiryDTO(title,content,file, expert_id);
		inquiryDAO inquiryDAO=new inquiryDAO();
		int cnt=inquiryDAO.insertExpertInquiry(insert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			out.println("<script>alert('문의사항 등록'); location.href='expertInquiry.jsp';</script>");
		}
		else {
			out.println("<script>alert('문의사항 등록 실패'); location.href='expertInquiry.jsp';</script>");
		}
	}
}