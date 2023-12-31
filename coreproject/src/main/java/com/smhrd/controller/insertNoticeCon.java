package com.smhrd.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.domain.noticeDAO;
import com.smhrd.domain.noticeDTO;
@MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		)
public class insertNoticeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Part file=request.getPart("file");
		String originName = file.getSubmittedFileName();
		if (!"".equals(originName)) {
			InputStream fis = file.getInputStream();
			String realPath = request.getServletContext().getRealPath("/notice");
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
			List<Integer> noticeLi=DAO.selectRecentNotice(insert);
			int max=0;
			for(int i=0;i<noticeLi.size();i++) {
				max=Math.max(max, noticeLi.get(i));
			}
			out.println("<script>alert('공지사항 등록'); location.href='noticeView.jsp?number="+max+"';</script>");
		}
		else {
			out.println("<script>alert('공지사항 등록 실패'); location.href='notice.jsp';</script>");
		}
	}
}