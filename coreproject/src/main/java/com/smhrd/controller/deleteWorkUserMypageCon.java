package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.mypageDAO;
public class deleteWorkUserMypageCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tuw_idx=Integer.valueOf(request.getParameter("tuw_idx"));
		mypageDAO mypageDAO=new mypageDAO();
		int cnt=mypageDAO.deleteWorkUserMypage(tuw_idx);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('의뢰 취소'); location.href='workUser.jsp';</script>");
		}
		else {
			out.println("<script>alert('의뢰 취소 실패'); location.href='workUser.jsp';</script>");
		}
	}
}