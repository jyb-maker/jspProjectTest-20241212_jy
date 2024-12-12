<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 성공</title>
</head>
<body>
	<h2>관리자 로그인</h2>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
		String adminid = request.getParameter("adminID");
		String adminpw = request.getParameter("adminPW");
		
		String sql = "SELECT * FROM admins WHERE adminid = ? AND adminpw = ?";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_project";
		String username = "root";
		String password = "12345";
		
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpw);
			
			rs = pstmt.executeQuery();
			
			//int count = 0;
			//while(rs.next()) {
			//	count ++; // count = count + 1;
			//}
			// count = 1이면 로그인 성공, 0이면 로그인 실패
			if (rs.next()) { //rs내에 반환된 레코드가 1개 존재하면 true->로그인 성공
				session.setAttribute("admin", "yes");
				out.println("새로운 세션 생성 성공!"+"<br>");
				out.println("관리자 [" + adminid + "]님이 입장하셨습니다.");
			} else {
				response.sendRedirect("loginErr.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if (rs != null ) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	
	%>
	
	<table border="0">
		<tr>
			<td>
				<form action="memberList.jsp">
					<input type="submit" value="◀ 등록 회원 관리하기">
				</form>
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그 아웃 ▶">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>