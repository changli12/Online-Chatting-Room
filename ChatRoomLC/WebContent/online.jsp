<%@ page contentType="text/html; charset=gbk" language="java" import="java.util.*" %>
<%@ page import="com.lichang.test5.*"%>
<% request.setCharacterEncoding("gbk"); %>
<%
UserInfo list=UserInfo.getInstance();
Vector vector=list.getList();
int amount=0;
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="32" align="center" class="word_orange ">��ӭ����LC�����ң�</td></tr>
  <tr>
  <td height="23" align="center"><a  href="#" onclick="set('������')">������</a></td>
  </tr>  
 <%if(vector!=null&&vector.size()>0){
	String username="";	 
	amount=vector.size();
		for(int i=0;i<amount;i++){
			username=(String)vector.elementAt(i);
%>
  <tr>
    <td height="23" align="center"><h3><a href="#" onclick="set('<%=username%>')"><%=username%></a></h3></td>
  </tr>
<%}}%>
<tr><td height="30" align="center"><strong>��������Ϊ[<font color="#FF6600"><%=amount%></font>]��</strong></td></tr>
</table>