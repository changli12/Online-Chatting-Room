<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>������ע��</title>
<link href="CSS/registerstyle.css" rel="stylesheet">
<script>
function Name()
{name1=document.getElementById("name").value;
if(name1=="") 
   alert("�����������û�����")
}
function password()
{mima1=document.getElementById("mima").value;
if(mima1=="") 
     alert("�������������룡");
else 
     if(!/[a-z]/.test(mima1) && !/[A-Z]/.test(mima1)&&!/[0-9]/.test(mima1))alert( "����ֻ��������a-z,A-Z,0-9���ַ���");
}
function F1()
{
mima1=document.getElementById("mima").value;
mima2=document.getElementById("remima").value;

if(mima1==mima2)
  alert("����һ�£�ok")
else
  alert("���벻һ��") 
}
function phone()
{phone=document.getElementById("phonenumber").value;
if(phone=="") 
     alert( "�����������ֻ����룡");
else if(!/[0-9]/.test(phone))
     alert( "�ֻ�����ֻ��������0-9���ַ���");
}
function email1()
{email=document.getElementById("email2").value;
if(email=="") 
	alert("���������ĵ����ʼ���ַ��");
else if(!((email.indexOf(".")>0)&&(email.indexOf("@")>0))||/[^a-zA-Z0-9.@_-]/.test(email))
     alert( "�����ʼ���ַ����ȷ");

}
</script>
</head>
</head>

<body>
<form name="form1" method="post" action="RegisterSer">
  <table width="764" height="542" border="1" align="center" background="images/7.jpg">
    <tr>
      <td width="698" valign="top"><br><br><br><br><br><br>
        <h1 align="center" class="STYLE1"> ע�������Ϣ!</h1><br><br>
        <table width="301" height="226" border="0" align="center" cellpadding="5" bordercolor="#0033FF">
          <tr>
            <td width="103"><span class="STYLE3">�û�����</span></td>
            <td width="182"><label>
              <input type="text" name=name id=name onblur="Name();" />
            </label></td>
          </tr>
          <tr>
            <td class="STYLE3">�Ա�</td>
            <td><label>
              <span class="STYLE3">
              <input type="radio" name=xb value="Ů">
              <span class="STYLE4">              Ů              </span></span></label>
              <span class="STYLE5">
              <label>
            <input type="radio" name=xb value="��">
            ��            </label>
              </span>
              <span class="STYLE4">
              <label></label>
              </span></td>
          </tr>
          <tr>
            <td class="STYLE3">�ֻ����룺</td>
            <td><input type="text" name=phonenumber id=phonenumber maxlength=11 onblur="phone();" /></td>
          </tr>
          <tr>
            <td class="STYLE3">�������䣺</td>
            <td><input type="text" name=email id=email2 onblur="email1();"></td>
          </tr>
          <tr>
            <td class="STYLE3">���룺</td>
            <td><input type=password name=mima id=mima maxlength=6 onblur="password();"></td>
          </tr>
          <tr>
            <td class="STYLE3">ȷ�����룺</td>
            <td><input type=password id=remima maxlength=6 onblur="F1();"/></td>
          </tr>
          <tr>
            <td class="STYLE3">���ڵأ�</td>
            <td><select name=address>
<option value="0"></option>
<option value="1">�ӱ�ʡ</option>
<option value="2">ɽ��ʡ</option>
<option value="3">����ʡ</option>
<option value="4">����ʡ</option>
<option value="5">������ʡ</option>
<option value="6">����ʡ</option>
<option value="7">�㽭ʡ</option>
<option value="8">����ʡ</option>
<option value="9">����ʡ</option>
<option value="10">����ʡ</option>
<option value="11">ɽ��ʡ</option>
<option value="12">����ʡ</option>
<option value="13">����ʡ</option>
<option value="14">����ʡ</option>
<option value="15">�㶫ʡ</option>
<option value="16">����ʡ</option>
<option value="17">�Ĵ�ʡ</option>
<option value="18">����ʡ</option>
<option value="19">����ʡ</option>
<option value="20">����ʡ</option>
<option value="21">����ʡ</option>
<option value="22">�ຣʡ</option> 
<option value="23">̨��ʡ</option>
<option value="24">������</option>
<option value="25">�����</option>
<option value="26">�Ϻ���</option>
<option value="27">��������</option>  
<option value="28">����׳��������</option>
<option value="29">���ɹ�������</option>
<option value="30">����������</option>
<option value="31">���Ļ���������</option>
<option value="32">�½�ά�����������</option>
<option value="33">����ر�������</option>
<option value="34">�����ر�������</option>
</select>
            </td>
          </tr>
        </table>
        <table width="297" height="93" border="0" align="center">
          <tr>
            <td width="94"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="submit" value="ע��"/></td>
            <td width="98"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type=reset value=����></td>
            <td width="83"><a href="index.jsp">
            <input style=" font-size:100%; width:120px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="button" value=���ص�¼����></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>