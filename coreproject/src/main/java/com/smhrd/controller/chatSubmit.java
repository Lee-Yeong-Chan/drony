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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.smhrd.domain.chatDAO;
import com.smhrd.domain.chatDTO;
import com.smhrd.domain.expertDTO;
import com.smhrd.domain.userDTO;
public class chatSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		int tuw_idx=Integer.valueOf(request.getParameter("tuw_idx"));
		String chatText=request.getParameter("chatText");
		HttpSession session=request.getSession();
		String id="", originName="";
		Part file=request.getPart("file");
		originName = file.getSubmittedFileName();
		if (originName!=null||!"".equals(originName)) {
			InputStream fis = file.getInputStream();
			String realPath = request.getServletContext().getRealPath("/chatting");
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
		if(session.getAttribute("loginUser")!=null) {
			id=((userDTO)session.getAttribute("loginUser")).getUser_id();
		}
		else if(session.getAttribute("loginExpert")!=null){
			id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
		}
		else {
			out.print("<script>alert('로그인상태가 아닙니다.')location.href='main.jsp';</script>");
		}
		if(chatText==null||chatText.equals("")) {
			response.getWriter().write("0");
		}
		else {
			chatDTO chatDTO=new chatDTO(tuw_idx,id,chatText);
			if (originName!=null||!"".equals(originName)) {
				chatDTO.setCh_file(originName);
			}
			response.getWriter().write(new chatDAO().submit(chatDTO)+"");
		}
	}
}