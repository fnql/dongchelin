<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="vo1" class="board.VO"/>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	VO vo = dao.getView(idx);
%>

<script language = "javascript">  // �ڹ� ��ũ��Ʈ ����

function modifyCheck()			//��� �޽��� ���
  {
   var form = document.modifyform;
   
   if( !form.password.value )
   {
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "������ �����ּ���" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "������ �����ּ���" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  }
 </script>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 </head>
 <body>
<table>
<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>&pg=<%=pg%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>����</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
      <td>&nbsp;</td>
      <td align="center">����</td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=vo.getTitle()%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">�̸�</td>
      <td><%=vo.getName()%><input type=hidden name=name size=50  maxlength=50 value="<%=vo.getName()%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">��й�ȣ</td>
      <td><input type=password name="password" id="pass" size=50  maxlength=50 ></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
      <td>&nbsp;</td>
      <td align="center">�Ĵ��</td>
      <td><input type=text name="shop" size=50  maxlength=50 value="<%=vo.getShop()%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">��������</td>
      <td>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='koreafood' id='kfood'><label for='kfood'>�ѽ�</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='chinafood' id='cfood'><label for='cfood'>�߽�</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='japanfood' id='jfood'><label for='jfood'>�Ͻ�</label>
      	<input type="radio" name="checklist" size="50" maxlength="50" value='datefood' id='dfood'><label for='dfood'>����Ʈ��õ�Ĵ�</label>
      </td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">����</td>
      <td><textarea name=memo cols=50 rows=13><%= vo.getMemo() %></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="����" OnClick="javascript:modifyCheck();">
      <input type=button value="���" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
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