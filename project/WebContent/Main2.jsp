<%@page import="java.util.ArrayList"%>
<%@page import="Model.memberDTO"%>
<%@page import="Model.notice_BoardDAO"%>
<%@page import="Model.reviewBoardDAO"%>
<%@page import="Model.boardDAO"%>
<%@page import="Model.reviewBoardDTO"%>
<%@page import="Model.notice_BoardDTO"%>
<%@page import="Model.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script>
    $(function () {
        $(".left_sub_menu").hide();
        $(".has_sub").click(function () {
            $(".left_sub_menu").fadeToggle(300);
        });
        // ���ʸ޴� ��Ӵٿ�
        $(".sub_menu ul.small_menu").hide();
        $(".sub_menu ul.big_menu").click(function () {
            $("ul", this).slideToggle(300);
        });
        // �ܺ� Ŭ�� �� ���� ���̵� �޴� �����
        $('.overlay').on('click', function () {
            $('.left_sub_menu').fadeOut();
            $('.hide_sidemenu').fadeIn();
        });
    });
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.side-menu {
            top: 50px;
            width: 45px;
            z-index: 10;
            background: #ff5858;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 70px;
            position: fixed;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
        }

        .sidebar-inner {
            height: 100%;
            padding-top: 30px;
        }

        #sidebar-menu,
        #sidebar-menu ul,
        #sidebar-menu li,
        #sidebar-menu a {
            border: 0;
            font-weight: normal;
            line-height: 1;
            list-style: none;
            margin: 0;
            padding: 0;
            position: relative;
            text-decoration: none;
        }

        #sidebar-menu>ul>li a {
            color: #fff;
            font-size: 20px;
            display: block;
            padding: 14px 0px;
            margin: 0px 0px 0px 8px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            width: 28px;
            cursor: pointer;
        }

        #sidebar-menu .fas {
            padding-left: 6px;
        }

        /* ���̵� �޴� */
        input[type="search"] {
            width: 180px;
            margin: 0 auto;
            margin-left: 9px;
            border: 2px solid #797979;
            font-size: 14px;
            margin-top: 10px;
            padding: 4px 0 4px 14px;
            border-radius: 50px;
        }

        .left_sub_menu {
            position: fixed;
            top: 50px;
            width: 200px;
            z-index: 10;
            left: 45px;
            background: white;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 0px;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
            color: black;
        }

        .sub_menu {
            margin-top: 50px;
        }

        .left_sub_menu>.sub_menu li:hover {
            color: ff5858;
            background-color: #e1e1e1;
        }

        .left_sub_menu>.sub_menu li {
            color: #333;
            font-size: 17px;
            font-weight: 600;
            padding: 20px 0px 8px 14px;
            border-bottom: 1px solid #e1e1e1;
        }

        .sub_menu>h2 {
            padding-bottom: 4px;
            border-bottom: 3px solid #797979;
            margin-top: 30px;
            font-size: 21px;
            font-weight: 600;
            color: #333;
            margin-left: 10px;
            margin-right: 10px;
            font-family: 'NotoKrB';
            line-height: 35px;
        }

        .sub_menu .fas {
            color: #ff5858;
            font-size: 20px;
            line-height: 20px;
            float: right;
            margin-right: 20px;
        }

        .sub_menu>.big_menu>.small_menu li {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 0px solid #e1e1e1;
            margin-left: 14px;
            padding-top: 8px;
        }

        .big_menu {
            cursor: pointer;
        }

        ul {
            padding-inline-start: 0px;
        }

        a {
            color: #797979;
            text-decoration: none;
            background-color: transparent;
        }

        ul {
            list-style: none;
        }

        ol,
        ul {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .has_sub {
            width: 100%;
        }

        .overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            /* background: rgba(0, 0, 0, 0.7); */
        }

        .hide_sidemenu {
            display: none;
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
table{
	width: 100%;

}
td{

}
</style>
</head>
<body>
<%
   memberDTO info = (memberDTO)session.getAttribute("info");   
   ArrayList<notice_BoardDTO> n_list = new ArrayList<notice_BoardDTO>();
   if (info!=null){
	  double memberLat = info.getMemberLat();
	  double memberLng = info.getMemberLng();
      System.out.println("(������������ ������� ������ �� �Ѿ������) memberLat : "+ memberLat);
      System.out.println("(������������ ������� �浵�� �� �Ѿ������) memberLng : "+ memberLng);
      notice_BoardDAO n_dao = new notice_BoardDAO();
      // �켱 ���ֿ��� ���� 57, �س� 69 ������ - ������ ���� ����ؼ� ��������~ => �ٽ� �켱�� 
      n_list = n_dao.match(memberLat, memberLng, 1000);
         for(int i = 0; i<n_list.size(); i++) {
            System.out.println(n_list.get(i).getNoticeNumber());
            System.out.println(n_list.get(i).getAddr());
         }
   }

%>
 <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- ���� �޴� -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                <i class="fas fa-bars"></i>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- ���� ���� �޴� -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    <input type="search" name="SEARCH" placeholder="SEARCH">
                    <h2>TITLE</h2>
                    <ul class="big_menu">
                        <li>MENU 1 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="Main.jsp">����</a></li>
                            <li><a href="inquiryMain.jsp">��ȸ</a></li>
                            <li><a href="reviewMain.jsp">�ı�</a></li>
                            <li><a href="Board.jsp">�Խ���</a></li>
                            <li><a href="reportPostWrite.jsp">����</a></li>
                        </ul>
                    </ul>
                    <!--   <ul class="big_menu">
                        <li>MENU 2 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">�Ҹ޴�2-1</a></li>
                            <li><a href="#"></a>�Ҹ޴�2-2</a></li>
                        </ul>
                    </ul> -->
                    <ul class="big_menu">
                        <li><a href="myPage.jsp" class="a001">MYPAGE</a></li>
                    </ul>
                </div>
            </div>
            <div class="overlay"></div>
        </div>
        
<div id="wrapper">
  <div id="contents">
  
<table style="padding:0 0 0 50px;">
	<tr >
   		<td colspan="2" ><h2 style="padding:0 0 0 50px;">Plogging</h2></td>
   		<td style="text-align:right;">
        <input type="button" class="topicon" value="�˻�">
		<input type ="button" class="topicon" value = "ä�ø��" onClick="location.href='chatChoice.jsp'"></td>
	</tr>
<tr>
   <% if(info != null) { %>
   <td><%=info.getMemberId() %>��</td>
      <% }else { %>
   <td style="padding:0 0 0 50px;"> �α������ּ��� </td>
      <% } %>
   <% if(info != null) { %>
   <td colspan="2" style="text-align:right;"><input  type ="button" class="topicon"  value = "�α׾ƿ�" onClick="location.href='logoutServiceCon'">
      <% }else { %>
   <td colspan="2" style="text-align:right;"> <input  type ="button" class="topicon" value = "�α���" onClick="location.href='Login.jsp'"> 
      <% } %>
   <input type ="button" class="topicon" value = "ȸ������" onClick="location.href='Join.jsp'"></td>
</tr>
</table>


<br><br><br><br><br>

<br>
<table>
<th>������� �� Į��</th>
<tr>
<td><a href="https://www.news1.kr/articles/?4391799">LG��κ���, #�������ƻ�å ķ���� ���ࡦ"�÷α� �Բ��ؿ�"</a></td>
</tr>
<tr>
<td><a href="https://www.etoday.co.kr/news/view/2050450">GS�Ŀ�, ���� '�÷α�' ķ���� ����</a></td>
</tr>
<tr>
<td><a href="http://www.kbsm.net/default/index_view_page.php?idx=319697&part_idx=320">��õ�� ����, �����ü�� ȯ����ȭ �÷α� Ȱ��</a></td>
</tr>
</table>
<br>
<table>
<th>�÷α� �����ڵ��� ��α� & ī��</th>
<tr>
<td><a href="https://blog.naver.com/happyhouse2u/222359846153">�뼼�� ���븻�� �ݱ�! ����õ �÷α� �ı� (���� ���� A-7 & ���� û�� �ູ����)</a></td>
</tr>
<tr>
<td><a href="https://post.naver.com/viewer/postView.naver?volumeNo=31743685&memberNo=25324157&vType=VERTICAL">���� � Ʈ����� '�÷α�'?, '�÷�ŷ'? �ǰ��� ȯ�� ��� ��Ű��!</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/sku-cast/222439716410">�÷α����� ���������� ���� ���������?</a></td>
</tr>
<tr>
<td><a href="https://blog.naver.com/baekjeun/222452172788">���� �������� �ϴ� ���� ���� �̻��� ��õ�ϴ� ����� ������</a></td>
</tr>

</table>

<!-- ������ ���� ���̺� ���� -->

<br><br><br><br>
</body>
</html>