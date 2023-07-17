<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="java.util.*"
    import="jspz.util.*"
    import="java.sql.*" 
    import ="javax.sql.DataSource"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbcpTest.jsp</title>
</head>
<body>

전체 회원 수 : <%= getMemberCount() %>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
// ... 이하의 로그인 관련 코드
%>

<%-- 전체 회원 수를 가져오는 메서드 --%>
<%! 
  private int getMemberCount() {
    int count = 0;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
      conn = (Connection) applicationScope.getAttribute("con"); // applicationScope로 수정
      String query = "SELECT COUNT(*) FROM T_MEMBER";
      pstmt = conn.prepareStatement(query);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        count = rs.getInt(1);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }

    return count;
  }
%>

</body>
</html>
