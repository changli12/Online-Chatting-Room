<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*"%>

<% request.setCharacterEncoding("gbk"); %>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>