<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÁÄÌìÊÒ×¢²á</title>
<link href="CSS/registerstyle.css" rel="stylesheet">
<script>
function Name()
{name1=document.getElementById("name").value;
if(name1=="") 
   alert("ÇëÊäÈëÄúµÄÓÃ»§Ãû£¡")
}
function password()
{mima1=document.getElementById("mima").value;
if(mima1=="") 
     alert("ÇëÊäÈëÄúµÄÃÜÂë£¡");
else 
     if(!/[a-z]/.test(mima1) && !/[A-Z]/.test(mima1)&&!/[0-9]/.test(mima1))alert( "ÃÜÂëÖ»ÔÊÐíÊäÈëa-z,A-Z,0-9µÄ×Ö·û¡£");
}
function F1()
{
mima1=document.getElementById("mima").value;
mima2=document.getElementById("remima").value;

if(mima1==mima2)
  alert("ÃÜÂëÒ»ÖÂ£¡ok")
else
  alert("ÃÜÂë²»Ò»ÖÂ") 
}
function phone()
{phone=document.getElementById("phonenumber").value;
if(phone=="") 
     alert( "ÇëÊäÈëÄúµÄÊÖ»úºÅÂë£¡");
else if(!/[0-9]/.test(phone))
     alert( "ÊÖ»úºÅÂëÖ»ÔÊÐíÊäÈë0-9µÄ×Ö·û¡£");
}
function email1()
{email=document.getElementById("email2").value;
if(email=="") 
	alert("ÇëÊäÈëÄúµÄµç×ÓÓÊ¼þµØÖ·£¡");
else if(!((email.indexOf(".")>0)&&(email.indexOf("@")>0))||/[^a-zA-Z0-9.@_-]/.test(email))
     alert( "µç×ÓÓÊ¼þµØÖ·²»ÕýÈ·");

}
</script>
</head>
</head>

<body>
<form name="form1" method="post" action="RegisterSer">
  <table width="764" height="542" border="1" align="center" background="images/7.jpg">
    <tr>
      <td width="698" valign="top"><br><br><br><br><br><br>
        <h1 align="center" class="STYLE1"> ×¢²á¸öÈËÐÅÏ¢!</h1><br><br>
        <table width="301" height="226" border="0" align="center" cellpadding="5" bordercolor="#0033FF">
          <tr>
            <td width="103"><span class="STYLE3">ÓÃ»§Ãû£º</span></td>
            <td width="182"><label>
              <input type="text" name=name id=name onblur="Name();" />
            </label></td>
          </tr>
          <tr>
            <td class="STYLE3">ÐÔ±ð£º</td>
            <td><label>
              <span class="STYLE3">
              <input type="radio" name=xb value="Å®">
              <span class="STYLE4">              Å®              </span></span></label>
              <span class="STYLE5">
              <label>
            <input type="radio" name=xb value="ÄÐ">
            ÄÐ            </label>
              </span>
              <span class="STYLE4">
              <label></label>
              </span></td>
          </tr>
          <tr>
            <td class="STYLE3">ÊÖ»úºÅÂë£º</td>
            <td><input type="text" name=phonenumber id=phonenumber maxlength=11 onblur="phone();" /></td>
          </tr>
          <tr>
            <td class="STYLE3">µç×ÓÓÊÏä£º</td>
            <td><input type="text" name=email id=email2 onblur="email1();"></td>
          </tr>
          <tr>
            <td class="STYLE3">ÃÜÂë£º</td>
            <td><input type=password name=mima id=mima maxlength=6 onblur="password();"></td>
          </tr>
          <tr>
            <td class="STYLE3">È·ÈÏÃÜÂë£º</td>
            <td><input type=password id=remima maxlength=6 onblur="F1();"/></td>
          </tr>
          <tr>
            <td class="STYLE3">ËùÔÚµØ£º</td>
            <td><select name=address>
<option value="0"></option>
<option value="1">ºÓ±±Ê¡</option>
<option value="2">É½Î÷Ê¡</option>
<option value="3">ÁÉÄþÊ¡</option>
<option value="4">¼ªÁÖÊ¡</option>
<option value="5">ºÚÁú½­Ê¡</option>
<option value="6">½­ËÕÊ¡</option>
<option value="7">Õã½­Ê¡</option>
<option value="8">°²»ÕÊ¡</option>
<option value="9">¸£½¨Ê¡</option>
<option value="10">½­Î÷Ê¡</option>
<option value="11">É½¶«Ê¡</option>
<option value="12">ºÓÄÏÊ¡</option>
<option value="13">ºþ±±Ê¡</option>
<option value="14">ºþÄÏÊ¡</option>
<option value="15">¹ã¶«Ê¡</option>
<option value="16">º£ÄÏÊ¡</option>
<option value="17">ËÄ´¨Ê¡</option>
<option value="18">¹óÖÝÊ¡</option>
<option value="19">ÔÆÄÏÊ¡</option>
<option value="20">ÉÂÎ÷Ê¡</option>
<option value="21">¸ÊËàÊ¡</option>
<option value="22">Çàº£Ê¡</option> 
<option value="23">Ì¨ÍåÊ¡</option>
<option value="24">±±¾©ÊÐ</option>
<option value="25">Ìì½òÊÐ</option>
<option value="26">ÉÏº£ÊÐ</option>
<option value="27">ÖØÇìÊÐÊÐ</option>  
<option value="28">¹ãÎ÷×³×å×ÔÖÎÇø</option>
<option value="29">ÄÚÃÉ¹Å×ÔÖÎÇø</option>
<option value="30">Î÷²Ø×ÔÖÎÇø</option>
<option value="31">ÄþÏÄ»Ø×å×ÔÖÎÇø</option>
<option value="32">ÐÂ½®Î¬Îá¶û×å×ÔÖÎÇø</option>
<option value="33">Ïã¸ÛÌØ±ðÐÐÕþÇø</option>
<option value="34">°ÄÃÅÌØ±ðÐÐÕþÇø</option>
</select>
            </td>
          </tr>
        </table>
        <table width="297" height="93" border="0" align="center">
          <tr>
            <td width="94"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="submit" value="×¢²á"/></td>
            <td width="98"><input style=" font-size:100%; width:80px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type=reset value=ÖØÌî></td>
            <td width="83"><a href="index.jsp">
            <input style=" font-size:100%; width:120px; height:25px; border:#008B8B 1px solid; background:#6495ED; color:#FFF" type="button" value=·µ»ØµÇÂ¼½çÃæ></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>