package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.noticeDAO;
import com.smhrd.domain.noticeDTO;
public class updateNoticeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("notice_idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		noticeDTO update=new noticeDTO(idx,title,content,file);
		noticeDAO noticeDAO=new noticeDAO();
		int cnt=noticeDAO.updateNotice(update);
		if (cnt>0) {
			System.out.println("수정");
		}
		else {
			System.out.println("실패");			
		}
		response.sendRedirect("noticeView.jsp?number="+idx);
	}
}