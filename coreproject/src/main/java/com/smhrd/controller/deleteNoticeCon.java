package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

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
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			out.println("<script>alert('공지사항 삭제'); location.href='notice.jsp';</script>");
		}
		else {
			out.println("<script>alert('공지사항 삭제 실패'); location.href='notice.jsp';</script>");
		}
	}
}