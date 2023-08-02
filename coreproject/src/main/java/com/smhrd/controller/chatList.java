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
		int tuw_idx=Integer.valueOf(request.getParameter("tuw_idx"));
		if(listType==null || listType.equals("")) {
			response.getWriter().write("");
		}
		else if(listType.equals("today")) {
			response.getWriter().write(getWork(tuw_idx));
		}
	}
	public String getWork(int tuw_idx) {
		StringBuffer result=new StringBuffer();
		result.append("{\"result\":[");
		chatDAO chatDAO=new chatDAO();
		ArrayList<chatDTO> chatList=(ArrayList<chatDTO>) chatDAO.selectEachChattingRoom(tuw_idx);
		for(int i=0;i<chatList.size();i++) {
			result.append("[{\"value\":\""+chatList.get(i).getTalker()+"\"},");
			result.append("{\"value\":\""+chatList.get(i).getTalk()+"\"},");
			result.append("{\"value\":\""+chatList.get(i).getCreated_at()+"\"}]");
			if(i!=chatList.size()-1) result.append(",");
		}
		
		return "";
	}
}