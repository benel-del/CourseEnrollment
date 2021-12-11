<!-- update_verify.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
Statement stmt = null;
String addr = null;
String pwd = null;
String session_id = (String) session.getAttribute("user");
String sMessage = null;
try{
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "db1812284", "oracle");
   stmt = conn.createStatement();

   pwd = request.getParameter("userPassword");
   if(pwd.length() == 0){
      sMessage = "비밀번호를 입력하세요.";
   }
   else{
      String sql = "UPDATE student SET s_pwd='" + pwd + "' WHERE s_id='" + session_id + "'";
      stmt.execute(sql);
      sMessage = "수정 완료";
   }
}catch(SQLException ex){
   if(ex.getErrorCode() == 20002)
      sMessage = "암호는 4자리 이상이어야 합니다.";
   else if(ex.getErrorCode() == 20003)
      sMessage = "암호에 공란은 입력되지 않습니다.";
   else if(ex.getErrorCode() == 20004)
      sMessage = "비밀번호를 입력하세요.";
   else
      sMessage = "잠시 후 다시 시도하십시오.";
   System.err.println(ex.getMessage());
}finally{
   conn.commit();
   stmt.close();
   conn.close();
}
%>
<script>
alert("<%=sMessage %>");
location.href="update.jsp";
</script>   