package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.boardDAO;
import Model.boardDTO;
import Model.boardReDAO;
import Model.boardReDTO;
import Model.memberDTO;

@WebServlet("/ReBoardServiceCon")
public class ReBoardServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("EUC-KR");
	      HttpSession session = request.getSession();
	      String memberId=null;

	      String content = request.getParameter("content");
	      memberDTO info = (memberDTO) session.getAttribute("info");
	      if(info!=null) {
	    	  memberId=info.getMemberId();
	      }else {
	    	  memberId=request.getParameter("name");
	      }
	      String password = request.getParameter("password");
	      
	      boardDAO dao = new boardDAO();
	      boardDTO dto = dao.showboard1();
	      int boardNum = dto.getBoardNum();
	      
	      
	      System.out.println(memberId);
	      System.out.println(content);
	      System.out.println(boardNum);
	      System.out.println(password);
	      
	      boardReDTO dto1 = new boardReDTO(boardNum, memberId, password,content);
	      boardReDAO dao1 = new boardReDAO();
	      int cnt = dao1.upload(dto1);
	      
	      String moveURL = "";
	      if(cnt>0) {
	         System.out.println("댓글 업로드 전송 성공");
	         moveURL = "viewBoard.jsp";
	      }else {
	         System.out.println("댓글 업로드 전송 실패");
	         moveURL = "Board.jsp";
	      }
	      response.sendRedirect(moveURL);
	   }//

	}

