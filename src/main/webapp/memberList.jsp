<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 리스트</title>
</head>
<body>
	<h2>회원 리스트</h2>
	<hr>
	<% 
		
		String sql = "SELECT * FROM members";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_project";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				count ++; //count = count + 1;
				String userid = rs.getString("userid");
				String userpw = rs.getString("userpw");				
				String useremail = rs.getString("useremail");
				
				out.println(count + ")" +userid+ " / " + userpw + " / " + useremail + "<br>");
			}
						
			out.println("<hr>"+"총 회원수:" + count + "명");
			
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