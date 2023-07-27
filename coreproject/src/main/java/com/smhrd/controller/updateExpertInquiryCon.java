package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.domain.inquiryDAO;
import com.smhrd.domain.expertInquiryDTO;
public class updateExpertInquiryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx=Integer.valueOf(request.getParameter("inq_idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		expertInquiryDTO update=new expertInquiryDTO(idx,title,content,file);
		inquiryDAO noticeDAO=new inquiryDAO();
		int cnt=noticeDAO.updateExpertInquiry(update);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('문의사항 수정'); location.href='expertInquiryView.jsp?number="+idx+"';</script>");
		}
		else{
			out.println("<script>alert('문의사항 수정 실패'); location.href='expertInquiryView.jsp?number="+idx+"';</script>");
		}
	}
}