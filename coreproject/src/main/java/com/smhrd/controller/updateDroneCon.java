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

import com.smhrd.domain.expertDroneDTO;
import com.smhrd.domain.mypageDAO;
@MultipartConfig(
//		location = "/",
//		fileSizeThreshold =1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5	
		)
public class updateDroneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String model= request.getParameter("model");
		String maker= request.getParameter("maker");
		String serial= request.getParameter("serial");
		String desc= request.getParameter("desc");
		if (model.equals("")) {
			model=null;
		}
		if (maker.equals("")) {
			maker=null;
		}
		if (serial.equals("")) {
			serial=null;
		}
		if (desc.equals("")) {
			desc=null;
		}
		Part file=request.getPart("file");
		String originName = file.getSubmittedFileName();
		if (!"".equals(originName)) {
			InputStream fis = file.getInputStream();
			String realPath = request.getServletContext().getRealPath("/upload");
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
		HttpSession session=request.getSession();
		int drone_idx=(Integer)session.getAttribute("dr_idx");
		expertDroneDTO updateDrone=new expertDroneDTO(drone_idx,model,maker,serial, desc, originName);
		mypageDAO mypageDAO=new mypageDAO();
		int cnt =mypageDAO.updateDrone(updateDrone);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('드론 수정 완료'); location.href='droneList.jsp';</script>");
		}
		else {			
			out.println("<script>alert('드론 수정 실패'); location.href='droneList.jsp';</script>");
		}
	}
}