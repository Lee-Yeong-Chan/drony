package com.smhrd.controller;
import java.io.IOException;
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
		if(cnt>0) {
			System.out.println("삭제성공");
		}
		else {
			System.out.println("삭제실패");			
		}
		response.sendRedirect("droneList.jsp");
	}
}