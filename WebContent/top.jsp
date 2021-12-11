<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String session_id = (String) session.getAttribute("user");
String log;
if(session_id == null)
	log = "<a href=login.jsp class=\"text-white\">로그인</a>";
else
	log = "<a href=logout.jsp class=\"text-white\">로그아웃</a>";
%>

<table id="nav" width="75%" align="center" bgcolor="#2766db" border=0>
	<tr>
		<td align="center" class="nav_item"><b><%=log %></b></td>
		<td align="center" class="nav_item"><b><a href="update.jsp" class="text-white">사용자 정보 수정</a></b></td>
		<td align="center" class="nav_item"><b><a href="insert.jsp" class="text-white">수강신청 입력</a></b></td>
		<td align="center" class="nav_item"><b><a href="delete.jsp" class="text-white">수강신청 삭제</a></b></td>
		<td align="center" class="nav_item"><b><a href="select.jsp" class="text-white">수강신청 조회</a></b></td>
	</tr>
</table>