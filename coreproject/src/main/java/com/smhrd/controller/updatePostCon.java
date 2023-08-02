package com.smhrd.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.domain.workDAO;
import com.smhrd.domain.workDTO;
public class updatePostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("w_idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String kind=request.getParameter("w_kind");
		Collection<Part> parts=request.getParts();
		String img="", fi="";
		int j=1;
		for(Part file:parts) {
			if(!file.getName().equals("file")){
				continue;
			}
			String originName = file.getSubmittedFileName();
			if ("".equals(originName)){
				break;
			}
			InputStream fis = file.getInputStream();
			String realPath = request.getServletContext().getRealPath("/upload");
			String filePath = realPath + File.separator + originName;
			FileOutputStream fos = new FileOutputStream(filePath);
			byte[] buf = new byte[1024];
			int size = 0;
			while((size = fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			if (j==1) {
				img=originName;
			}
			else if(j==2) {
				fi=originName;
			}
			fis.close();
	        fos.close();
	        j++;
		}
		int price=Integer.valueOf(request.getParameter("price"));
		workDTO update=new workDTO(idx,title,content,fi,price,kind,img);
		workDAO workDAO=new workDAO();
		int cnt=workDAO.updateWork(update);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('게시글 수정'); location.href='postDetail.jsp?w_idx="+idx+"';</script>");
		}
		else{
			out.println("<script>alert('게시글 수정 실패'); location.href='postDetail.jsp?w_idx="+idx+"';</script>");
		}
	}
}