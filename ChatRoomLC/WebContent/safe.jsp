<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"%>
<%if (null==session.getAttribute("username") || "".equals(session.getAttribute("username"))){
	out.println("<script language='javascript'>alert('�����˻��Ѿ����ڣ������µ�¼!');window.location.href='index.jsp';</script>");
	return;
}%>
