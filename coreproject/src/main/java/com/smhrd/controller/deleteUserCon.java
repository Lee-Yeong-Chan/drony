package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.userDAO;
import com.smhrd.domain.userDTO;
public class deleteUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		userDTO loginUser=(userDTO)session.getAttribute("loginUser");
		userDAO userDAO=new userDAO();
		int cnt=userDAO.deleteUser(loginUser.getUser_id());
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			session.removeAttribute("loginUser");
			out.println("<script>alert('탈퇴되었습니다.'); location.href='workUser.jsp';</script>");
		}
		else {
			out.println("<script>alert('탈퇴 실패'); location.href='mypageUser.jsp';</script>");			
		}
	}
}