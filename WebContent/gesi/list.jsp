<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>


<%	
	DAO dao = new DAO();
	ArrayList<VO> alist = new ArrayList<VO>();
	int size=0;
	if (request.getParameter("searchField")==null){
		alist = dao.getMemberList();
	} else{
		alist = dao.getSearch(request.getParameter("searchField"),
				request.getParameter("searchText"));
		
	}
	
	int total = dao.count();
	size = alist.size();
	int size2 = size;
	final int ROWSIZE = 10;
	final int BLOCK = 11;
	int indent = 0;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int end = (pg*ROWSIZE);
	
	int allPage = 0;

	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	size2 -=end;
	if(size2 < 0) {
		end = size;
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/img/logo.png" rel="shortcut icon" type="image/x-icon">

 <title>게시판</title>
 <link rel="stylesheet" href="/dongchelin/css/style.css">
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
 </head>
 <body>
  <jsp:include page="/module/top.jsp" flush="false" />
   <div class="container">
		<div class="row">
			<form method="post" name="search" action="list.jsp">
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="shop">식당</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('/dongchelin/img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="/dongchelin/img/table_left.gif" width="5" height="30" /></td>
   <td width="23">번호</td>
   <td width="375">제목</td>
   <td width="180">종류</td>
   <td width="73">작성자</td>
   <td width="58">조회수</td>
   <td width="7"><img src="/dongchelin/img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {			// 자료가 없다면
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
	 <%
	 	} else {			// 자료가 1개 이상 있을경우
	 		for(int i=ROWSIZE*(pg-1); i<end;i++){
				VO vo = alist.get(i);
				indent = vo.getIndent();
				int idx = vo.getNum();
%>
	<tr height="25" align="center">
	<td align="center">&nbsp;</td>
	<td align="center"><%=idx%></td>
	<td align="left"><% 
		
		
		for(int j=0;j<indent;j++){ 						//답글 읽는 명령어
		%> &nbsp;&nbsp;&nbsp;<%
		}
		if(indent!=0){
			%><img src='/dongchelin/img/reply_icon.gif' width="40" height="15"/><%
		}
	%>
	<%-- 답글 제목 --%>
	<a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=vo.getTitle() %></a>
	
	</td>
	
	<%-- 종류 --%>
	<td align="center"><%=vo.getChecklist()%></td>
	
	<%-- 작성자 --%>
   <td align="center"><%=vo.getName()%></td>
   
   <%-- 조회수 --%>
   <td align="center"><%=vo.getHit() %></td>
   
   <td align="center">&nbsp;</td>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% }} %>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr>
	<td align="center">
		<%
			if(pg>BLOCK) {
		%>
			[<a href="list.jsp?pg=1">◀◀</a>]
			[<a href="list.jsp?pg=<%=startPage-1%>">◀</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="list.jsp?pg=<%=i %>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="list.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="list.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
		</tr>
	<tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>
  </tr>
 </table>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 </body>
</html>
