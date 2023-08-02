package com.smhrd.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.smhrd.domain.expertDTO;
import com.smhrd.domain.workDAO;
import com.smhrd.domain.workDTO;
@MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		)
public class insertPostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int price=Integer.valueOf(request.getParameter("price"));
		HttpSession session=request.getSession();
		String kind=request.getParameter("w_kind");
		String exp_id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
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
		workDTO insert=new workDTO(title,content,fi,exp_id,price,kind,img);
		workDAO postDAO=new workDAO();
		int cnt=postDAO.insertWork(insert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			workDAO workDAO=new workDAO();
			List<Integer> allWork = workDAO.selectRecentWork(insert);
			int max=0;
			for(int i=0;i<allWork.size();i++) {
				max=Math.max(max, allWork.get(i));
			}
			out.println("<script>alert('게시글 추가'); location.href='postDetail.jsp?w_idx="+max+"';</script>");
		}
		else {
			out.println("<script>alert('게시글 추가 실패'); location.href='postInsert.jsp';</script>");
		}
	}
}