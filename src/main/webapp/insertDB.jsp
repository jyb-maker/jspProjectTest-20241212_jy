<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 DB</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String userid = request.getParameter("userID");
		String userpw = request.getParameter("userPW");
		String useremail = request.getParameter("userEmail");
		
		String sql = "INSERT INTO members values(?,?,?)";
		
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
			pstmt.setString(2, userpw);
			pstmt.setString(3, useremail);
			
			int resultNum = pstmt.executeUpdate();  // 성공하면 1, 실패하면 0을 반환 
			
			if (resultNum ==1) {
				response.sendRedirect("signupSuccess.jsp");
				// DB 삽입이 성공하면 signupSuccess.jsp로 이동
			} else {
				response.sendRedirect("signup.jsp");
				// DB 삽입이 실패하면 signup.jsp로 이동				
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