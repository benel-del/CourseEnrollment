<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String s_id = (String) session.getAttribute("user");
String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));

Connection conn = null;
CallableStatement cstmt = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "db1812284", "oracle");
	cstmt = conn.prepareCall("{call InsertEnroll(?, ?, ?, ?)}");
	cstmt.setString(1, s_id);
	cstmt.setString(2, c_id);
	cstmt.setInt(3, c_id_no);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);

	cstmt.execute();
	String rs = cstmt.getString(4);
	%>
	<script>
	alert("<%= rs%>");
	location.href="insert.jsp";
	</script>
	<%
}catch(SQLException e){
	System.err.println("SQLException: " + e.getMessage());
}finally{
	if(cstmt != null)
		try{
			conn.commit();
			cstmt.close();
			conn.close();
		}catch(SQLException e){}
}
%>