<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż��</title>
</head>
<body>
	<%
		String userid = (String) session.getAttribute("userid");
		String userpw = request.getParameter("userpw");
		try{
			
			String DB_URL = "jdbc:mysql://localhost:3306/user";	//  ������ DB��
			String DB_ID = "root";	//  ������ ���̵�
			String DB_PASSWORD = "1234";	// ������ �н�����
			
			Class.forName("com.mysql.jdbc.Driver");  // JDBC ����̹� �ε�
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);	// DB�� ����
			
			String sql = "select * from signup where userid = ? and userpw = ?";	//SQL�� �ۼ�
			
			//PreparedStatement ����(SQL���� ��Ʋ�� ����)
			PreparedStatement pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, userid);
			pstmt1.setString(2, userpw);
			// sql�� ����
			ResultSet rs = pstmt1.executeQuery();
			
			if(rs.next()){ // ����
				String jsql = "delete from signup where userid=?";
				PreparedStatement  pstmt2 = con.prepareStatement(jsql);
				pstmt2.setString(1, userid);
				
				pstmt2.executeUpdate();
				%>
				<script>
					alert("ȸ��Ż�� �Ϸ�Ǿ����ϴ�.");
					window.location.href = "<%= request.getContextPath() %>/Logout.jsp";
				</script>
			<% }else{	// ���� %>
				<script>
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					window.location.href = "<%= request.getContextPath() %>/DeleteUser.jsp";
				</script>
			<% }
			
		} catch (Exception e) {
	        out.println(e);
		}
	%>
</body>
</html>