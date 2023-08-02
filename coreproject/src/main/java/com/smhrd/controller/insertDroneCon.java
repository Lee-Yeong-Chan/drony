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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.smhrd.domain.expertDTO;
import com.smhrd.domain.expertDroneDTO;
import com.smhrd.domain.mypageDAO;
@MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		)
public class insertDroneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String model= request.getParameter("model");
		String maker= request.getParameter("maker");
		String serial= request.getParameter("serial");
		String desc= request.getParameter("desc");
		HttpSession session=request.getSession();
		expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
		String exp_id=loginExpert.getExp_id();
		expertDroneDTO insertDrone=new expertDroneDTO();
		insertDrone.setDr_model(model);
		insertDrone.setDr_maker(maker);
		insertDrone.setDr_serial(serial);
		insertDrone.setDr_desc(desc);
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
		insertDrone.setExp_id(exp_id);
		insertDrone.setDr_img(originName);
		mypageDAO mypageDAO=new mypageDAO();
		int cnt =mypageDAO.insertDrone(insertDrone);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			out.println("<script>alert('드론 수정 완료'); location.href='droneList.jsp';</script>");
		}
		else {	
			out.println("<script>alert('드론 수정 실패'); location.href='droneList.jsp';</script>");
		}
	}
}