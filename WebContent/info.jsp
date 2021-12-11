<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
Statement stmt = null;
CallableStatement cstmt = null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "db1812284", "oracle");
	stmt = conn.createStatement();
	cstmt = conn.prepareCall("{call EnrollResult(?, ?, ?)}");
	cstmt.setString(1, session_id);
	cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
	cstmt.registerOutParameter(3, java.sql.Types.INTEGER);

	cstmt.execute();
	%>
	<table class="info" width="75%" align="center" border>
	<tr>
		<th>학번: <%=session_id %></th>
		<th>총 신청 과목수 : <%=cstmt.getInt(2) %></th>
		<th>총 신청 학점 : <%=cstmt.getInt(3) %></th>
		<th>수강 가능 학점 : 18</th>
	</tr>
</table>
	<%
}catch(SQLException e){
	System.err.println("SQLException: " + e.getMessage());
}finally{
	
}

%>
