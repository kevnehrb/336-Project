<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

try{

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.cvguwph9zu1e.us-east-2.rds.amazonaws.com:3306/AirlineFlight","admin", "Thomert1!");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from Ticket order by Price ASC;");

%><table border=1 align=center style="text-align:center">
<thead>
    <tr>
       <th>Unique Number</th>
		       <th>Fare</th>
		       <th>Booking Fee</th>
		      <th>Class</th>
		      <th>Price</th>
    </tr>
</thead>
<tbody>
  <%while(rs.next())
  {
      %>
      <tr>
          <td><%=rs.getInt("Unique_number") %></td>
		          <td><%=rs.getFloat("Fare") %></td>
		          <td><%=rs.getFloat("Booking_fee") %></td>
		          <td><%=rs.getString("class") %></td>
		          <td><%=rs.getFloat("Price") %></td>
      </tr>
      <%}%>
     </tbody>
  </table><br>
<%}
catch(Exception e){
  out.print(e.getMessage());%><br><%
}

%>



<form action='home.jsp'><input type='submit' value='Return to Home'/></form>

<br>

<br>

<form action='Logout.jsp'><input type='submit' value='Logout'/></form>

<br>