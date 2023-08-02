package com.smhrd.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.domain.inquiryDAO;
import com.smhrd.domain.expertInquiryDTO;
@MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		)
public class updateExpertInquiryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("inq_idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Part file=request.getPart("file");
		String originName = file.getSubmittedFileName();
		if (!"".equals(originName)) {
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
		expertInquiryDTO update=new expertInquiryDTO(idx,title,content,originName);
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