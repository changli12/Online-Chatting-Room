<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*"%>
<%@ page import="com.lichang.test5.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<%
	request.setCharacterEncoding("gbk");
   String username=request.getParameter("username");	
    UserInfo user=UserInfo.getInstance();		
    session.setMaxInactiveInterval(600);		
    Vector vector = user.getList();  
    boolean flag = false; 
    if(vector!=null&&vector.size()>0){
    	for(int i=0;i<vector.size();i++){
		if(user.equals(vector.elementAt(i))){
			out.println("<script language='javascript'>alert('该用户已经登录');window.location.href='index.jsp';</script>");
			flag=false;
			break;
		}
	}
    }
    if(!flag){
    	UserListener ul=new UserListener();
		ul.setUser(username);
		session.setAttribute("user",ul);
		session.setAttribute("username",username);
		user.addUser(ul.getUser());	
	session.setAttribute("loginTime",new Date().toLocaleString());		
	response.sendRedirect("MessagesAction?action=loginRoom");
    }
    
	 %>
  </head>
  
  <body>
  </body>
</html>
