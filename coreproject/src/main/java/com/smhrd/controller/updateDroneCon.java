package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.expertDroneDTO;
import com.smhrd.domain.mypageDAO;
public class updateDroneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String model= request.getParameter("model");
		String maker= request.getParameter("maker");
		String serial= request.getParameter("serial");
		String desc= request.getParameter("desc");
		String img= request.getParameter("img");
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
		if (img.equals("")) {
			img=null;
		}
		HttpSession session=request.getSession();
		int drone_idx=(Integer)session.getAttribute("dr_idx");
		expertDroneDTO updateDrone=new expertDroneDTO(drone_idx,model,maker,serial, desc, img);
		mypageDAO mypageDAO=new mypageDAO();
		int cnt =mypageDAO.updateDrone(updateDrone);
		if(cnt>0) {
			System.out.println("드론수정성공");
		}
		else {			
			System.out.println("드론수정실패");
		}
		response.sendRedirect("droneList.jsp");
	}
}