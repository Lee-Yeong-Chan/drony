package com.smhrd.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.chatDAO;
import com.smhrd.domain.chatDTO;
public class chatList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String listType=request.getParameter("listType");
		if(listType==null || listType.equals("")) {
			response.getWriter().write("");
		}
		else if(listType.equals("today")) {
			response.getWriter().write(getToday());
		}
	}
	public String getToday() {
		StringBuffer result=new StringBuffer();
		result.append("{\"result\":[");
		chatDAO chatDAO=new chatDAO();
		// ArrayList<chatDTO> chatList=chatDAO.selectEachChattingRoom(tuw_idx)
		return "";
	}
}