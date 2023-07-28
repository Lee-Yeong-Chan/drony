package com.smhrd.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.domain.noticeDAO;
import com.smhrd.domain.noticeDTO;
public class insertNoticeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Part file=request.getPart("file");
		String originName = file.getSubmittedFileName();
		if (!originName.equals("")) {
			InputStream fis = file.getInputStream();
			String realPath = request.getServletContext().getRealPath("/inquiry");
			String filePath = realPath + File.separator + originName; 
			FileOutputStream fos = new FileOutputStream(filePath);
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			fis.close();
	        fos.close();
		}
		noticeDTO insert=new noticeDTO(title,content,originName);
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