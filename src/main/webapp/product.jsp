<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		String t5=request.getParameter("t5");
		String t6=request.getParameter("t6");
		String t7=request.getParameter("t7");
		String t8=request.getParameter("t8");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.setString(5,t5);
			psmt.setString(6,t6);
			psmt.setString(7,t7);
			psmt.setString(8,t8);
			psmt.executeQuery();
			out.println("<script>alert('Record Saved....')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	
	//Delete tde record
			if(btnval.equalsIgnoreCase("delete"))
			{
				String t1=request.getParameter("t1");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					PreparedStatement psmt=conn.prepareStatement("delete from product where id=?");
					psmt.setString(1,t1);
					psmt.executeQuery();
					out.println("<script>alert('Record delete......')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of delete
			
			//Update record
			if(btnval.equalsIgnoreCase("update"))
			{
				String t1=request.getParameter("t1");
				String t2=request.getParameter("t2");
				String t3=request.getParameter("t3");
				String t4=request.getParameter("t4");
				String t5=request.getParameter("t5");
				String t6=request.getParameter("t6");
				String t7=request.getParameter("t7");
				String t8=request.getParameter("t8");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					PreparedStatement psmt=conn.prepareStatement("update product set barcode=?,name=?,desc1=?,category=?,qty=?,weight=?,refrigerated=? where id=?");
					psmt.setString(1,t2);
					psmt.setString(2,t3);
					psmt.setString(3,t4);
					psmt.setString(4,t5);
					psmt.setString(5,t6);
					psmt.setString(6,t7);
					psmt.setString(7,t8);
					psmt.setString(8,t1);
					psmt.executeQuery();
					out.println("<script>alert('Record Updated....')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of update
			
			
			if(btnval.equalsIgnoreCase("allsearch"))
			{
				out.println("sdfsd00");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					ResultSet rs=smt.executeQuery("select * from product");
					%>
					<table border=2>
					<tr>
						<td> ID</td>
						<td>BARCODE</td>
						<td>NAME</td>
						<td>DESC1</td>
						<td>CATEGORY</td>
						<td>QTY</td>
						<td>WEIGHT</td>
						<td>REFRIGERATED</td>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getString(8)%></td>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//end of all search
			
			
			
			//psearch
			if(btnval.equalsIgnoreCase("psearch"))
			{
				out.println("sdfsd00");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					String t1=request.getParameter("t1");
					ResultSet rs=smt.executeQuery("select * from product where id='"+t1+"'");
					%>
					<table border=2>
					<tr>
						<td> ID</td>
						<td>BARCODE</td>
						<td>NAME</td>
						<td>DESC</td>
						<td>CATEGORY</td>
						<td>QTY</td>
						<td>WEIGHT</td>
						<td>REFRIGERATED</td>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getString(8)%></td>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//end of p search
			
			
			//Record of special search
			if(btnval.equalsIgnoreCase("search"))
			{
				String s1 = request.getParameter("s1");
				String t1 = request.getParameter("t1");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					ResultSet rs;
					if(s1.equalsIgnoreCase("all"))
					{	
					 rs=smt.executeQuery("select * from product");
					}
					else
					{
						rs=smt.executeQuery("select * from product where "+s1+" = '"+t1+"'");
					}	
					%>
					<table border=2>
					<tr>
						<td> ID</td>
						<td>BARCODE</td>
						<td>NAME</td>
						<td>DESC</td>
						<td>CATEGORY</td>
						<td>QTY</td>
						<td>WEIGHT</td>
						<td>REFRIGERATED</td>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<td><%=rs.getString(1)%></td>
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3)%></td>
							<td><%=rs.getString(4)%></td>
							<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getString(8)%></td>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of special search
			

%>
</body>
</html>