<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.memberDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDTO"%>
<%@page import="Model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
   background-color: #efefef;
   scrollbar-width: none;
   -ms-overflow-style: none;
}

table {

}
.mtable1{
   width: 100%;
	padding: 100px;
        }
   .mtable2{
   width: 700px;
   border : 1px solid black;
  border-collapse : collapse;
  
         }
tr, td {
   /* padding: 5px; */
   
}

.topicon {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 15px;
}
h1{
   padding: 70px;
   }

a {
   width: 330px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

div {
   /* padding: 10px */
   margin-left: auto;
   margin-right: auto;
}

.tex {
   width: 330px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.stex1 {
   width: 270px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.stex2 {
   width: 220px;
   height: 25px;
   margin: 4px 2px;
   border: none;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   border-radius: 12px;
}

.button {
   background-color: #2DB400;
   width: 330px;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 12px;
}

.dbutton {
   background-color: #2DB400;
   border: none;
   color: white;
   padding: 10px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 12px;
}
</style>
</head>
<body>
<%
memberDTO info = (memberDTO)session.getAttribute("info");

System.out.println("������������ ������ �� �Ѿ� �Դ��� Ȯ�� : " + info.getMemberId());
String id = request.getParameter("memberId");
boardDAO dao = new boardDAO();



ArrayList<boardDTO> board_list = dao.showBoard(info.getMemberId());
System.out.println("board_list�� �α����� ���̵� �� ���� ��� �ִ��� Ȯ�� ");
for(int i =0; i<board_list.size();i++){
   System.out.println( i + "��° ���̵� : " +board_list.get(i).getMemberId());
}



reviewBoardDAO dao1 = new reviewBoardDAO();

ArrayList<reviewBoardDTO> reviewBoard_list = dao1.showBoard1(info.getMemberId());
System.out.println("reviewBoard_list�� �α����� ���̵� �� ���� ��� �ִ��� Ȯ�� ");
for(int i =0; i<reviewBoard_list.size();i++){
   System.out.println( i + "��° ���̵� : " +reviewBoard_list.get(i).getMemberId());
}

%>
   <div>
      <table class="mtable1">
         <tr>
            <td><h2>Plogging</h2></td>
            <td style="text-align:right;">
            <input  type="button" class="topicon" value="ȸ����������"
            onclick="location.href='update.jsp'">
            <input type="button" class="topicon" value="�˻�">
            <input type="button" class="topicon" value="������"
               onClick="location.href='myPage.jsp'"></td>
         </tr>
      </table>
   </div>
   <table align="center">
      <tr>
         <td><h3 align="center"><%=info.getMemberId() %>�� ����������</h3></td>
      </tr>
      </table>
      <br><br>
   <div>
      <table style='height:50px;' align="center">
      <tr>
         <td><%if(info !=null){%><span><%=info.getMemberPlogCount() %>�� �÷α뿡 �����ϼ̽��ϴ�!</span><%}else{ %><span>0ȸ �����ϼ̽��ϴ�.</span><%} %></td>
         <!-- �ߴ� �÷α� Ƚ�� -->
      </tr>
      </table>
   </div>
   <br><br><br>
   <div >
   
        <table border='1px'>
      
      <% for(int i = 0; i<board_list.size();i++){ %>
         <%if(info.getMemberId().equals(board_list.get(i).getMemberId())) {%> 
         <th align="left" style='height:30px;' colspan="2">���� �� �����Խ� ��</th>     
            <tr>
               <td>-<a href="viewBoard.jsp?board_num=<%=board_list.get(i).getBoardNum()%>"><%=board_list.get(i).getBoardTitle()%></a></td>
            </tr>
     <%}} %>
            </table>
            <table border='1px'>
         <% for(int i = 0; i<reviewBoard_list.size();i++){ %>
           <%if(info.getMemberId().equals(reviewBoard_list.get(i).getMemberId())) {%>
                    <th align="left" style='height:30px;' colspan="2">���� �� �ı�Խ� ��</th>     
            <tr>
             <td>-<a href="Review8.jsp?reviewNumber=<%=reviewBoard_list.get(i).getReviewNumber()%>"><%=reviewBoard_list.get(i).getTitle()%></a></td>
            </tr>
        <%}} %>
         </table>
         <br>
   </div>   
   <br><br><br><br>
   <br>

   <div>
      <table align="center">
         <tr>
            <td><input type="button" class="dbutton" value="����" name="main"
               onClick="location.href='Main.jsp'"></td>
            <td><input type="button" class="dbutton" value="��ȸ" name="inquiry"
               onClick="location.href='inquiryMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="�ı�" name="review"
               onClick="location.href='reviewMain.jsp'"></td>
            <td><input type="button" class="dbutton" value="�Խ���" name="board"
               onClick="location.href='Board.jsp'"></td>
            <td><input type="button" class="dbutton" value="����" name="report"
               onClick="location.href='reportPostWrite.jsp'"></td>
         </tr>
      </table>
   </div>
</body>
</html>