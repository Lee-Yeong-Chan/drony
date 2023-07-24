package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.mypageDAO;
import com.smhrd.domain.mypageDTO;
public class updateMypageCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String status=request.getParameter("status");
		HttpSession session=request.getSession();
		int num=(int)session.getAttribute("updateStatus_idx");
		mypageDTO updateStatus = new mypageDTO(status,num);
		mypageDAO mypageDAO= new mypageDAO();
		int cnt=mypageDAO.updateMypage(updateStatus);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('수정성공'); location.href='workExpert.jsp';</script>");
		}
		else{
			out.println("<script>alert('수정실패'); location.href='workExpert.jsp';</script>");			
		}
	}
}