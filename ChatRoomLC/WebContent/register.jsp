<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>聊天室注册</title>
<link href="CSS/registerstyle.css" rel="stylesheet">
<script>
function Name()
{name1=document.getElementById("name").value;
if(name1=="") 
   alert("请输入您的用户名！")
}
function password()
{mima1=document.getElementById("mima").value;
if(mima1=="") 
     alert("请输入您的密码！");
else 
     if(!/[a-z]/.test(mima1) && !/[A-Z]/.test(mima1)&&!/[0-9]/.test(mima1))alert( "密码只允许输入a-z,A-Z,0-9的字符。");
}
function F1()
{
mima1=document.getElementById("mima").value;
mima2=document.getElementById("remima").value;

if(mima1==mima2)
  alert("密码一致！ok")
else
  alert("密码不一致") 
}
function phone()
{phone=document.getElementById("phonenumber").value;
if(phone=="") 
     alert( "请输入您的手机号码！");
else if(!/[0-9]/.test(phone))
     alert( "手机号码只允许输入0-9的字符。");
}
function email1()
{email=document.getElementById("email2").value;
if(email=="") 
	alert("请输入您的电子邮件地址！");
else if(!((email.indexOf(".")>0)&&(email.indexOf("@")>0))||/[^a-zA-Z0-9.@_-]/.test(email))
     alert( "电子邮件地址不正确");

}
</script>
</head>
</head>

<body>
<form name="form1" method="post" action="RegisterSer">
  <table width="764" height="542" border="1" align="center" background="images/7.jpg">
    <tr>
      <td width="698" valign="top"><br><br><br><br><br><br>
        <h1 align="center" class="STYLE1"> 注册个人信息!</h1><br><br>
        <table width="301" height="226" border="0" align="center" cellpadding="5" bordercolor="#0033FF">
          <tr>
            <td width="103"><span class="STYLE3">用户名：</span></td>
            <td width="182"><label>
              <input type="text" name=name id=name onblur="Name();" />
            </label></td>
          </tr>
          <tr>
            <td class="STYLE3">性别：</td>
            <td><label>
              <span class="STYLE3">
              <input type="radio" name=xb value="女">
              <span class="STYLE4">              女              </span></span></label>
              <span class="STYLE5">
              <label>
            <input type="radio" name=xb value="男">
            男            </label>
              </span>
              <span class="STYLE4">
              <label></label>
              </span></td>
          </tr>
          <tr>
            <td class="STYLE3">手机号码：</td>
            <td><input type="text" name=phonenumber id=phonenumber maxlength=11 onblur="phone();" /></td>
          </tr>
          <tr>
            <td class="STYLE3">电子邮箱：</td>
            <td><input type="text" name=email id=email2 onblur="email1();"></td>
          </tr>
          <tr>
            <td class="STYLE3">密码：</td>
            <td><input type=password name=mima id=mima maxlength=6 onblur="password();"></td>
          </tr>
          <tr>
            <td class="STYLE3">确认密码：</td>
            <td><input type=password id=remima maxlength=6 onblur="F1();"/></td>
          </tr>
          <tr>
            <td class="STYLE3">所在地：</td>
            <td><select name=address>
<option value="0"></option>
<option value="1">河北省</option>
<option value="2">山西省</option>
<option value="3">辽宁省</option>
<option value="4">吉林省</option>
<option value="5">黑龙江省</option>
<option value="6">江苏省</option>
<option value="7">浙江省</option>
<option value="8">安徽省</option>
<option value="9">福建省</option>
<option value="10">江西省</option>
<option value="11">山东省</option>
<option value="12">河南省</option>
<option value="13">湖北省</option>
<option value="14">湖南省</option>
<option value="15">广东省</option>
<option value="16">海南省</option>
<option value="17">四川省</option>
<option value="18">贵州省</option>
<option value="19">云南省</option>
<option value="20">陕西省</option>
<option value="21">甘肃省</option>
<option value="22">青海省</option> 
<option value="23">台湾省</option>
<option value="24">北京市</option>
<option value="25">天津市</option>
<option value="26">上海市</option>
<option value="27">重庆市市</option>  
<option value="28">广西壮族自治区</option>
<option value="29">内蒙古自治区</option>
<option value="30">西藏自治区</option>
<option value="31">宁夏回族自治区</option>
<option value="32">新疆维吾尔族自治区</option>
<option value="33">香港特别行政区</option>
<option value="34">澳门特别行政区</option>
</select>
            </td>
          </tr>
        </table>
        <table width="297" height="93" border="0" align="center">
          <tr>
            <td width="94"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="submit" value="注册"/></td>
            <td width="98"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type=reset value=重填></td>
            <td width="83"><a href="index.jsp">
            <input style=" font-size:100%; width:120px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="button" value=返回登录界面></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>