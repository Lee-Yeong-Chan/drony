package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.domain.inquiryDAO;
public class deleteUserInquiryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("inq_idx"));
		inquiryDAO inquiryDAO=new inquiryDAO();
		int cnt=inquiryDAO.deleteUserInquiry(idx);
		if (cnt>0) {
			System.out.println("삭제");
		}
		else {
			System.out.println("실패");			
		}
		response.sendRedirect("userInquiry.jsp");
	}
}