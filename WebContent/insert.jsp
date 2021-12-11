<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>수강신청 입력</title>
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
		<th>과목번호</th><th>분반</th><th>과목명</th><th>교시</th><th>학점</th><th>담당교수</th><th>정원</th><th>여석</th><th>수강신청</th>
	</tr>
	<%
	try{
		String sql = "SELECT c.c_id, c.c_id_no, c.c_name, c.c_unit, t.t_time, t.t_max, p.p_name FROM course c, teach t, professor p WHERE (c.c_id, c.c_id_no) NOT IN (SELECT c_id, c_id_no FROM enroll WHERE s_id ='" + session_id + "') AND t.c_id = c.c_id AND t.c_id_no = c.c_id_no AND t.p_id = p.p_id ORDER BY c.c_id, t.t_time";
		ResultSet rs = stmt.executeQuery(sql);
	
		while(rs.next()){
			%>
			<tr>
				<td align="center"><%=rs.getString(1) %></td><!-- 과목번호 -->
				<td align="center"><%=rs.getInt(2) %></td><!-- 분반 -->
				<td align="center"><%=rs.getString(3) %></td><!-- 과목명 -->
				<td align="center"><%=rs.getInt(5) %></td><!-- 교시 -->
				<td align="center"><%=rs.getInt(4) %></td><!-- 학점 -->
				<td align="center"><%=rs.getString(7) %></td><!-- 담당교수 -->
				<td align="center"><%=rs.getInt(6) %></td><!-- 정원 -->
				<%
				cstmt = conn.prepareCall("{call cntEnroll(?, ?, ?)}");
				cstmt.setString(1, rs.getString(1));
				cstmt.setInt(2, rs.getInt(2));
				cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
				
				cstmt.execute();
				%>
				<td align="center"><%=(rs.getInt(6) - cstmt.getInt(3)) %></td><!-- 여석 -->
				<td align="center"><%
				if(cstmt.getInt(3) != rs.getInt(6)){
				%><a href="insert_verify.jsp?c_id=<%=rs.getString(1) %>&c_id_no=<%=rs.getInt(2) %>">신청</a><%
				}%></td>
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