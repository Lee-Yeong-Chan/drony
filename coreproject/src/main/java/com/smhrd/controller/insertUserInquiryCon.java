package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.inquiryDAO;
import com.smhrd.domain.userDTO;
import com.smhrd.domain.userInquiryDTO;
public class insertUserInquiryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		HttpSession session=request.getSession();
		String user_id=((userDTO)session.getAttribute("loginUser")).getUser_id();
		userInquiryDTO insert=new userInquiryDTO(title,content,file, user_id);
		inquiryDAO inquiryDAO=new inquiryDAO();
		int cnt=inquiryDAO.insertUserInquiry(insert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			inquiryDAO DAO=new inquiryDAO();
			int max=0;
			for(int i=0;i<DAO.selectRecentUserInquiry(insert).size();i++) {
				max=Math.max(max, DAO.selectRecentUserInquiry(insert).get(i));
			}
			out.println("<script>alert('문의사항 등록'); location.href='userInquiryView.jsp?number="+max+"';</script>");
		}
		else {
			out.println("<script>alert('문의사항 등록 실패'); location.href='userInquiry.jsp';</script>");
		}
	}
}