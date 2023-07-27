package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.domain.expertDTO;
import com.smhrd.domain.workDAO;
import com.smhrd.domain.workDTO;
public class insertPostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		String img=request.getParameter("img");
		int price=Integer.valueOf(request.getParameter("price"));
		HttpSession session=request.getSession();
		String kind=request.getParameter("w_kind");
		String exp_id=((expertDTO)session.getAttribute("loginExpert")).getExp_id();
		workDTO insert=new workDTO(title,content,file,exp_id,price,kind,img);
		workDAO postDAO=new workDAO();
		int cnt=postDAO.insertWork(insert);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if (cnt>0) {
			workDAO workDAO=new workDAO();
			List<Integer> allWork = workDAO.selectRecentWork(insert);
			int max=0;
			for(int i=0;i<allWork.size();i++) {
				max=Math.max(max, allWork.get(i));
			}
			out.println("<script>alert('게시글 추가'); location.href='postDetail.jsp?w_idx="+max+"';</script>");
		}
		else {
			out.println("<script>alert('게시글 추가 실패'); location.href='postInsert.jsp';</script>");
		}
	}
}