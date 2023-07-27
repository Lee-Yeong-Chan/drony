package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.noticeDAO;
import com.smhrd.domain.noticeDTO;
public class insertNoticeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		noticeDTO insert=new noticeDTO(title,content,file);
		noticeDAO noticeDAO=new noticeDAO();
		int cnt=noticeDAO.insertNotice(insert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			noticeDAO DAO=new noticeDAO();
			int max=0;
			for(int i=0;i<DAO.selectRecentNotice(insert).size();i++) {
				max=Math.max(max, DAO.selectRecentNotice(insert).get(i));
			}
			out.println("<script>alert('공지사항 등록'); location.href='noticeView.jsp?number="+max+"';</script>");
		}
		else {
			out.println("<script>alert('공지사항 등록 실패'); location.href='notice.jsp';</script>");
		}
	}
}