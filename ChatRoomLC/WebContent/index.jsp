<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%if(request.getSession().getAttribute("username") != null) {
	request.setAttribute("message", "ͬһ�����ֻ�ܵ�¼һ���˺�");
	request.getRequestDispatcher("error.jsp").forward(request, response);
	return;} %>
<title>������</title>
</head>
<link href="CSS/indexstyle.css" rel="stylesheet">
<script language="javascript">
importClass(com.cheney.chat.UserDao);
function check(){
	if(form1.username.value==""){
		alert("�������û�����");form1.username.focus();return false;	
	}else if(form1.userpwd.value==""){
		alert("���������룡");form1.username.focus();return false;
	}
}
</script>
</head>

<body>
<form  name="form1" method="post" action="MessagesAction?action=loginRoom" onSubmit="return check()">
  <div align="center">
    <table width="435" height="579" border="1">
      <tr>
        <td width="499" height="363" background="images/2.jpg"><h1 align="center" class="STYLE4">LC������</h1>
          <label></label>
          <table width="288" height="89" border="1" align="center" cellpadding="5" bgcolor="#FAFF33">
          <tr>
            <td width="75" height="44" class="STYLE1"><span class="STYLE5">�û���</span>��</td>
            <td width="181"><label>
              <input type="text" name="username" />
            </label></td>
          </tr>
          <tr>
            <td height="37"><span class="STYLE3"><span class="STYLE5">����</span>��</span></td>
            <td><input name="userpwd" type="password" /></td>
          </tr>
        </table>
		<table width="182" align="center" cellpadding="15">
          <tr>
            <td width="84" height="101"><input style=" font-size:100%; width:100px; height:44px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="submit" name="Submit" value="��¼" /></td>
            <td width="82">
                <a href ="register.jsp"><input style=" font-size:100%; width:100px; height:44px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="button" value="ע��" /></a>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>