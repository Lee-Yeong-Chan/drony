package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.mypageDAO;
import com.smhrd.domain.userDTO;
import com.smhrd.domain.userWorkDTO;
import com.smhrd.domain.workDTO;
public class insertWorkUserMypageCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String user_id=((userDTO)session.getAttribute("loginUser")).getUser_id();
		int w_idx=Integer.valueOf(request.getParameter("w_idx"));
		String exp_id=request.getParameter("exp_id");
		workDTO workDTO=new workDTO(w_idx,exp_id);
		userWorkDTO userWorkDTO=new userWorkDTO(w_idx,user_id);
		mypageDAO mypageDAO=new mypageDAO();
		int cnt=mypageDAO.insertWorkUserMypage(userWorkDTO, workDTO);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('의뢰 신청 완료'); location.href='workUser.jsp';</script>");
		}
		else {
			out.println("<script>alert('의뢰 신청 실패'); location.href='postDetail.jsp?w_idx='"+w_idx+";</script>");
		}
	}
}