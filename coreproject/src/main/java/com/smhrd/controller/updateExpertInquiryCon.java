package com.smhrd.controller;
import java.io.IOException;
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
		if (cnt>0) {
			System.out.println("수정");
		}
		else {
			System.out.println("실패");			
		}
		response.sendRedirect("expertInquiryView.jsp?number="+idx);
	}
}