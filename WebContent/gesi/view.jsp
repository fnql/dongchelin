<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:useBean id="dao" class="board.DAO"/>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	VO vo = dao.getView(idx);	
	dao.UpdateHit(idx);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table style="margin-left:30%;">
  <tr>
   <td>
    <table style="margin-left:30%;" cellpadding="0" cellspacing="0" border="0" >
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
    <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
   <table style="margin-left:30%;">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=vo.getHit()%></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=vo.getName()%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">가게명</td>
      <td width="319"><%=vo.getShop()%></td>
      <td width="0">&nbsp;</td>
     </tr>
     
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
      <td>&nbsp;</td>
      <td align="center">음식종류</td>
      <td>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='koreafood' id='kfood'><label for='kfood'>한식</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='chinafood' id='cfood'><label for='cfood'>중식</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='japanfood' id='jfood'><label for='jfood'>일식</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='datefood' id='dfood'><label for='dfood'>데이트추천식당</label>
      </td>
      <td>&nbsp;</td>
     </tr>
     
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=vo.getTitle()%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=vo.getMemo() %>
                </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기"  OnClick="window.location='write.jsp'">
	<input type=button value="답글" OnClick="window.location='reply.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="목록" OnClick="window.location='list.jsp?pg=<%=pg%>'">
	<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
  <script>
  $(document).ready(function() {
		switch("<%=vo.getChecklist()%>") {
			case "koreafood":
				$('#kfood').prop('checked', true);
				break;
				
			case "chinafood":
				$('#cfood').prop('checked', true);
				break;
				
			case "japanfood":
				$('#jfood').prop('checked', true);
				break;
				
			case "datefood":
				$('#dfood').prop('checked', true);
				break;
		} 
	});
 </script>
</body>
 </html>
