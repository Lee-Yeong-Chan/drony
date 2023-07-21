package com.smhrd.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.userDAO;
import com.smhrd.domain.userDTO;
public class updateUserCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String id = ((userDTO)session.getAttribute("loginUser")).getUser_id();
		String pw =request.getParameter("pw");
		String name =request.getParameter("name");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		if (pw.equals("")) {
			pw=null;
		}
		if (name.equals("")) {
			name=null;
		}
		if (email.equals("")) {
			email=null;
		}
		if (phone.equals("")) {
			phone=null;
		}
		userDTO updateUser=new userDTO(id,pw,name,email,phone);
		userDAO userDAO=new userDAO();
		int cnt=userDAO.updateUser(updateUser);
		if(cnt>0) {
			request.setAttribute("loginUser", updateUser);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}
		else{
			response.sendRedirect("updateUser.jsp");
		}
	}
}