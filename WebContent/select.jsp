<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>수강신청 조회</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%@ include file="info.jsp" %>
<%
if(session_id == null)
	response.sendRedirect("login.jsp");
%>
<table class="course-table" width="75%" align="center" border>
	<tr>
		<th>과목번호</th><th>분반</th><th>과목명</th><th>교시</th><th>학점</th><th>담당교수</th><th>장소</th>
	</tr>
	<%
	try{
		String sql = "SELECT * from timeTable WHERE s_id = '" + session_id + "' ORDER BY t_time";
		ResultSet rs = stmt.executeQuery(sql);
	
		while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getInt(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getInt(6) %></td>
				<td align="center"><%=rs.getInt(5) %></td>
				<td align="center"><%=rs.getString(7) %></td>
				<td align="center"><%=rs.getString(8) %></td>
			</tr>
		<%
	}
}catch(SQLException e){
	System.err.println("SQLException: " + e.getMessage());
}finally{
	if(stmt != null)
		stmt.close();
	if(cstmt != null)
		cstmt.close();
	if(conn != null)
		conn.close();
}
%>
</table>
</body>
</html>