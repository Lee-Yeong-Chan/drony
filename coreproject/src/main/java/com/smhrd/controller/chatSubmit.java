package com.smhrd.controller;
import java.io.IOException;
import java.net.URLDecoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.chatDAO;
import com.smhrd.domain.chatDTO;
import com.smhrd.domain.expertDTO;
import com.smhrd.domain.userDTO;
/* @MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		) */
public class chatSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		int tuw_idx=Integer.valueOf(request.getParameter("tuw_idx"));
		String chatText=URLDecoder.decode(request.getParameter("chatText").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"),"utf-8");
		String id="";
		/*String originName="";
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
		}*/
		HttpSession session=request.getSession();
		if(session.getAttribute("loginUser")!=null) {
			id=((userDTO)session.getAttribute("loginUser")).getUser_id();
		} 
		else if(session.getAttribute("loginExpert")!=null){
			id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
		}
		if(chatText==null||chatText.equals("")) {
			response.getWriter().write("0");
		}
		else {
			chatDTO chatDTO=new chatDTO(tuw_idx,id,chatText);
			/*if (originName!=null||!"".equals(originName)) {
				chatDTO.setCh_file(originName);
			}*/
			response.getWriter().write(new chatDAO().submit(chatDTO)+"");
		}
	}
}