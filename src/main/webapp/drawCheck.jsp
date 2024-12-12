<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 DB 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String userid = request.getParameter("userID");
		
		String sql = "DELETE FROM members WHERE userid = ?";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_project";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			int resultNum = pstmt.executeUpdate();  // 성공하면 1, 실패하면 0을 반환 
			
			if (resultNum ==1) {
				response.sendRedirect("drawSuccess.jsp");
				// DB 삭제가 성공하면 drawSuccess.jsp로 이동
			} else {
				response.sendRedirect("drawErr.jsp");
				// DB 삭제가 실패하면 drawErr.jsp로 이동				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		
		
	%>



</body>
</html>