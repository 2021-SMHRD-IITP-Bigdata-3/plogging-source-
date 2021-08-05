package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.memberDAO;
import Model.memberDTO;


@WebServlet("/mypageServiceCon")
public class mypageServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");

		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		String memberName = request.getParameter("name");
		int memberAge = Integer.parseInt(request.getParameter("memberAge"));
		String memberAddr = request.getParameter("memberAddr");
		String memberPlogOwn = request.getParameter("memberPlogOwn");
		String memberPlogCount = request.getParameter("memberPlogCount");

		System.out.println("id : "+memberId);
		System.out.println("pw : "+memberPw);
		System.out.println("name : "+memberName);
		System.out.println("age : "+memberAge);
		
		System.out.println("addr : "+memberAddr);
		System.out.println("plogown : "+memberPlogOwn);
		System.out.println("memberPlogCount : "+memberPlogCount);
//
		memberDTO dto = new memberDTO(memberId, memberPw,memberName, memberAge, memberAddr,memberPlogOwn,memberPlogCount);
		memberDAO dao = new memberDAO();
		
		response.sendRedirect("myPage.jsp");
		
	}

}
