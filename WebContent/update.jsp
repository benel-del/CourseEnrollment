<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<title>수강신청 사용자 정보 수정</title>

</head>
<body>
<%@ include file="top.jsp" %>

<%
Connection conn = null;
Statement stmt = null;
String addr = null;
String pwd = null;
if(session_id == null)
	response.sendRedirect("login.jsp");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "db1812284", "oracle");
	stmt = conn.createStatement();
	String sql = "SELECT NVL(s_addr, '-'), s_pwd FROM student WHERE s_id='" + session_id + "'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	addr = rs.getString(1);
	pwd = rs.getString(2);
}catch(SQLException e){
	System.err.println("SQLException");
}finally{
	if(stmt != null)
		stmt.close();
	if(conn != null)
		conn.close();
}
%>

<div id=update>
<div class="container" style="width:440px; background-color:white">
	<div class="col-lg-4" style="width:fit-content; border:2px solid #ccc; border-radius: 10px;">
		<div class="jumbotron" style="padding:40px 40px; background-color:white; margin-bottom:0">
		<form method="post" action="update_verify.jsp">
		<table >
			<tr>
			<td><div align="right" class="form-group" style="padding-right:10px;">메일 주소</div></td>
			<td><div align="center" class="form-group"><%=addr %></div></td>
			</tr>
			<tr>
			<td><div align="right" class="form-group" style="padding-right:6px;">현재 비밀번호</div></td>
			<td><div align="center" class="form-group"><%=pwd %></div></td>
			</tr>
			<tr>
			<td><div align="right" class="form-group" style="padding-right:10px;">새 비밀번호</div></td>
			<td><div align="center"><input type="password" name="userPassword" class="form-control"></div></td>
			</tr>
			</table>
			<div style="text-align:center;">
				<div align="center" style="display:inline-block"><input type="submit" name="submit" value="수정" class="btn btn-primary form-control"></div>
				<div align="center" style="display:inline-block"><input type="reset" value="취소" class="btn btn-primary form-control"></div>
			</div>
		</form>
		</div>
	</div>
</div>
</div>


</body>
</html>