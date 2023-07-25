package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.domain.noticeDAO;
public class deleteNoticeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("notice_idx"));
		noticeDAO noticeDAO=new noticeDAO();
		int cnt=noticeDAO.deleteNotice(idx);
		if (cnt>0) {
			System.out.println("삭제");
		}
		else {
			System.out.println("실패");			
		}
		response.sendRedirect("notice.jsp");
	}
}