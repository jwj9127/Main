<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �����Ϸ�</title>
</head>
<body>
	<%
		String postId = request.getParameter("postId");
		String userpw = request.getParameter("userpw");
	
		try{
			
			String DB_URL = "jdbc:mysql://localhost:3306/user";	//  ������ DB��
			String DB_ID = "root";	//  ������ ���̵�
			String DB_PASSWORD = "1234";	// ������ �н�����
			
			Class.forName("com.mysql.jdbc.Driver");  // JDBC ����̹� �ε�
			Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);	// DB�� ����
			
			String sql = "select * from USERES where userpw = ?";	//SQL�� �ۼ�
			
			//PreparedStatement ����(SQL���� ��Ʋ�� ����)
			PreparedStatement pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, userpw);
			// sql�� ����
			ResultSet rs = pstmt1.executeQuery();
			
			if(rs.next()){ // ����
				String jsql = "delete from post where postId=?";
				PreparedStatement  pstmt3 = con.prepareStatement(jsql);
				pstmt3.setString(1, postId);
				
				pstmt3.executeUpdate();
				%>
				<script>
					alert("�Խù� ������ �Ϸ�Ǿ����ϴ�.");
					location.href = "Post.jsp"
				</script>
			<% }else{	// ���� %>
				<script>
					alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					location.href = "PostDelete.jsp?postId=<%=postId%>"
				</script>
			<% }
			
		} catch (Exception e) {
	        out.println(e);
		}
	%>
</body>
</html>