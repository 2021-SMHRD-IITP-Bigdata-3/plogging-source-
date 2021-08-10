package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.boardDAO;
import Model.reviewBoardDAO;


@WebServlet("/maingDelete")
public class maingDelete extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  float lat = Float.parseFloat(request.getParameter("lat"));
		  float lng =  Float.parseFloat(request.getParameter("lng"));
	      System.out.println("삭제할메시지고유번호 : "+lat);
	      System.out.println("삭제할메시지고유번호 : "+lng);
	      
	}

}
