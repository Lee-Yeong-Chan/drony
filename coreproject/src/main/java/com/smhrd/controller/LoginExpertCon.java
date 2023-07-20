package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.expertDAO;
import com.smhrd.domain.expertDTO;
public class LoginExpertCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id =request.getParameter("id");
		String pw =request.getParameter("pw");
		expertDTO loginExpert =new expertDTO(id,pw);
		expertDAO expertDAO=new expertDAO();
		expertDTO login=expertDAO.selectExpert(loginExpert);
		if(login!=null) {
	         HttpSession session = request.getSession();
	         session.setAttribute("loginExpert", login);
		}
		response.sendRedirect("main.html");
	}
}