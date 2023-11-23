<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
    <script type="text/javascript">
    function check(){
    	let frm = document.myform;
    	let userpw = frm.userpw;
    	let userphone = frm.userphone;
    	let username = frm.username;
		
		/* ��й�ȣ ��ȿ�� �˻� */
		if(userpw.value == ""){
			alert("��й�ȣ�� �Է����ּ���");
			myform.userpw.focus();
			return false;
		}
		
		/* �޴�����ȣ ��ȿ�� �˻� */
		if(userphone.value == ""){
			alert("��ȭ��ȣ�� �Է����ּ���");
			myform.userphone.focus(); 
			return false;
		}
		
		/* �̸� ��ȿ�� �˻� */
		if(username.value == ""){
			alert("�̸��� �Է����ּ���");
			myform.username.focus(); 
			return false;
		}
		else{
			frm.submit();			
		}
    }
    </script>
</head>
<body style="display: flex; justify-content: center; margin: 0px;">

<!-- �⺻ Ʋ 80% -->
    <div style="width: 80vw; display: flex; flex-direction: column; align-items: center;">

        <header style="display: flex; justify-content: center; width: 99.9vw; background-color: #FED14F;">
	        <div style="display: flex; align-items: center; width: 90vw; justify-content: space-between; margin: 30px;">

		        <!-- �ΰ� -->
	        	<a href="MainPage.jsp">
                	<img src="images/Logo.png" alt="�ΰ�" style="width: 10vw;">
	            </a>
	            
	            <!-- �׺���̼� -->
	            <div style="display: flex; align-items: center; width: 50vw; justify-content: space-around;">
		                <a href="HealthPage.jsp" style='color: black; cursor: pointer; font-weight: bold; font-size: large; text-decoration: none;'>
		                �ｺ ��Ʃ��</a>
			            <a href="DietPage.jsp" style='color: black; cursor: pointer; font-weight: bold; font-size: large; text-decoration: none;'>
			            ���̾�Ʈ ��Ʃ��</a>
			            <a href="" style='color: black; cursor: pointer; font-weight: bold; font-size: large; text-decoration: none;'>
			            �Խ���</a>
			    </div>
			            
			    <!-- ȸ������ -->
			    <div style="display: flex; align-items: center; width: 25vw; justify-content: space-around;">
					<%	String username = (String) session.getAttribute("username");	%>
						<div style="display: flex; align-items: center; font-weight: bold; font-size: medium; cursor: default;">
							<p><h3 style="padding-right:5px;"><%= username %>��</h3> �������</p>
						</div>
					<a href='Logout.jsp' style='color: black; font-weight: bold; font-size: medium; cursor: pointer; text-decoration: none;'>�α׾ƿ�</a>
		        	<a href='MyPage.jsp' style='color: black; font-weight: bold; font-size: medium; cursor: pointer; text-decoration: none;'>����������</a>
	            </div>
	        </div>
        </header>
<%	 
try {
 	 String DB_URL="jdbc:mysql://localhost:3306/user";  
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("com.mysql.jdbc.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
	
 	 String key = (String) session.getAttribute("userid");
	 String jsql = "select * from signup where userid = ?";
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,key);

	 ResultSet rs = pstmt.executeQuery();
	 rs.next();
			
	 String id = rs.getString("userid");
	 String name = rs.getString("username");
	 String phone = rs.getString("userphone");
%>
	<main style="margin-top: 30px; display: flex; flex-direction: column; width: 80vw; justify-content: center; align-items: center;">
	<div style="font-size: 40px;">ȸ�� ���� ����</div>
            <form method="post" action="UserUpdateClear.jsp" name="myform"
                style="display: flex; flex-direction: column; margin-top: 30px; align-items: center;">
                <div style="display: flex; flex-direction: column; width: 30vw; height: 50vh; justify-content: space-around; margin-left: 10vw;">
                
	                	<div style="display: flex;">���̵� : <div style="margin-left: 5vw;"><%=id%></div> </div>
	                	
                        <div style="font-weight: bold; font-size: large;">�� ��й�ȣ :
                        <input type="password" name="userpw" style="border: none; width: 15vw; height: 6.7vh; padding-left: 10px; outline: none;" placeholder="��й�ȣ�� �Է��ϼ���"></div>
                        
                        <div style="display: flex;">���� �ڵ��� ��ȣ : <div style="margin-left: 1vw;"><%=phone%></div> </div>
                        
                        <div style="font-weight: bold; font-size: large;">������ �ڵ��� ��ȣ : 
                        <input type="text" name="userphone" style="border: none; width: 15vw; height: 6.7vh; padding-left: 10px; outline: none;" placeholder="�޴��� ��ȣ�� �Է��ϼ��� (- ���� 11�ڸ�)"></div>
                        
                        <div style="display: flex;">���� �̸� : <div style="margin-left: 3vw;"><%=name%></div> </div>
                        
                        <div style="font-weight: bold; font-size: large;">������ �̸� :
                        <input type="text" name="username" style="border: none; width: 15vw; height: 6.7vh; padding-left: 10px; outline: none;" placeholder="�г����� �Է��ϼ���"></div>
                </div>
                <div style="display: flex; width: 40vw; justify-content: space-around; align-items: center; margin-top: 30px;">
                    <button type="button" onclick="check()"
                        style="border: solid 1px; background-color: white; width: 10vw; height: 7vh; cursor: pointer; border-radius: 10px;">ȸ�� ���� ����
                    </button>
                    <button type="button" style="border: solid 1px; background-color: white; width: 10vw; height: 7vh; border-radius: 10px;">
                    	<a href="MyPage.jsp" style="text-decoration: none; color: black; cursor: pointer; padding: 20px;">���</a>
                    </button>
                </div>
            </form>
        </main>
<%
    } catch (Exception e) {
      out.println(e);	
}
%>
</body>
</html>