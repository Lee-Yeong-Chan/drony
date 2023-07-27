package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.domain.mypageDAO;
public class deleteDroneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int dr_idx=Integer.valueOf(request.getParameter("dr_idx"));
		mypageDAO mypageDAO=new mypageDAO();
		int cnt=mypageDAO.deleteDrone(dr_idx);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('드론 삭제 완료'); location.href='droneList.jsp';</script>");
		}
		else {
			out.println("<script>alert('드론 삭제 실패'); location.href='droneList.jsp';</script>");
		}
	}
}