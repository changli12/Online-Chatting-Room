<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*" errorPage="" %>
<% request.setCharacterEncoding("gbk"); %>
<%out.println("<h3>"+request.getAttribute("messages").toString()+"<h3>");
%>