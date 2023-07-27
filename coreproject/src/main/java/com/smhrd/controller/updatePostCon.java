package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.domain.workDAO;
import com.smhrd.domain.workDTO;
public class updatePostCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int idx=Integer.valueOf(request.getParameter("w_idx"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String file=request.getParameter("file");
		String kind=request.getParameter("w_kind");		
		String img=request.getParameter("img");		
		int price=Integer.valueOf(request.getParameter("price"));
		workDTO update=new workDTO(idx,title,content,file,price,kind,img);
		workDAO workDAO=new workDAO();
		int cnt=workDAO.updateWork(update);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(cnt>0) {
			out.println("<script>alert('게시글 수정'); location.href='postDetail.jsp?w_idx="+idx+"';</script>");
		}
		else{
			out.println("<script>alert('게시글 수정 실패'); location.href='postDetail.jsp?w_idx="+idx+"';</script>");
		}
	}
}