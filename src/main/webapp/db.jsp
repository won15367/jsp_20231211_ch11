<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%	
		// db접속에 필요한 변수 4개: 드라이버 이름, db가 설치된 주소, 계정이름, 계정비밀번호
		String driverName="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/addr_db";
		String username="root";
		String password="12345";
		
		Connection conn = null;
		
		
		try {
			//드라이버 불러오기
			Class.forName(driverName);
			// db와 커넥션을 생성
			conn = DriverManager.getConnection(url, username, password);
			out.println(conn);
		} catch(Exception e) {
			out.println("DB연결 실패");
			e.printStackTrace();  // 에러의 내용을 콘솔창에 출력
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	%>
	
</body>
</html>