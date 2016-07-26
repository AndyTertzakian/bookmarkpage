<!-- 
/*
 * Author Andre Tertzakian
 * December, 2013
 */
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookmarker</title>
</head>

<%
	ArrayList<String> ar = (ArrayList<String>) session.getAttribute("urls");
	ArrayList<String> imgs = (ArrayList<String>) session.getAttribute("imgs");
	if(ar==null){
		ar=new ArrayList<String>();
	}
	if(imgs==null){
		imgs=new ArrayList<String>();
	}
	session.setAttribute("urls", ar);
	session.setAttribute("imgs", imgs);
%>

<body>
	<form action="http://localhost:8080/BookmarkPage/BookmarkServlet"
		method="post">
		url: <input type="text" name="url" placeholder="url"> <br>
		type: <input type="radio" name="type" value="link"> Link <input type="radio" name="type" value="img"> Image 
		<%=session.getAttribute("typeErr") != null ? session.getAttribute("typeErr") : "" %>
		<br>
		<input type="submit">
	</form>
	<br>

	<% if(!ar.isEmpty()) {%>
		<table border="1">
			<%for(String url : ar) {%>
			<tr>
				<td>
					<a href="<%= url %>"> 
						<%= url %>
					</a>
				</td>
			</tr>
			<%} %>
		</table>
	<%}%>
	<% if(!imgs.isEmpty()) {%>
		<table border="1">
			<%for(String url : imgs) {%>
			<tr>
				<td>
					<img src="<%=url %>" width="200px">
				</td>
			</tr>
			<%} %>
		</table>
	<%}%>

</body>
</html>