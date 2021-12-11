<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");

Connection conn = null;
PreparedStatement pstmt = null;

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "db1812284", "oracle");

	String sql = "SELECT s_id FROM student WHERE s_id=? AND s_pwd=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPassword);
	ResultSet rs = pstmt.executeQuery();

	if(rs.next()){
		session.setAttribute("user", userID);
		out.print("<script>");
		out.print("location.href='main.jsp'");
		out.print("</script>");
	}
	else{
		out.print("<script>");
		out.print("alert('아이디와 비밀번호가 일치하지 않습니다.');");
		out.print("location.href='login.jsp'");
		out.print("</script>");
	}
}catch(Exception e){
	System.err.println(e);
}finally{
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
}

%>