package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.noticeJoinDTO;
import Model.noticejoinDAO;
import Model.memberDTO;

@WebServlet("/inquiryServiceCon")
public class inquiryServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		int noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
		
		
		HttpSession session = request.getSession();
		memberDTO info = (memberDTO)session.getAttribute("info");
		String get_memberId = info.getMemberId();
		
		System.out.println(noticeNumber);
		System.out.println(get_memberId);
		
		
		noticeJoinDTO dto = new noticeJoinDTO(get_memberId,noticeNumber);
		noticejoinDAO dao = new noticejoinDAO();
	    int cnt = dao.upload(dto);
	      
	    if(cnt>0) {
	       System.out.println("성공");
	    }else {
	    System.out.println("실패");
	    }
	    response.sendRedirect("inquiryMain.jsp");
	}

}
