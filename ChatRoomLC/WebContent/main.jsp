<%@page import="com.lichang.test5.*"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ include file="safe.jsp"%>
<% request.setCharacterEncoding("gbk"); 
int maxTime=50*60*1000;		
String loginTime2 = (String)session.getAttribute("loginTime");
SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
long loginTime=s.parse(loginTime2).getTime();
String path=request.getContextPath();
%>
<script type="text/javascript" src="<%=path %>/jquery-3.1.1.min.js"></script>

<link href="CSS/mainstyle.css" rel="stylesheet">
<link href="CSS/style.css" rel="stylesheet">

<%
if(!UserListener.isOnline(request.getSession()))
{
	//request.getSession().invalidate();
}
if(request.getSession().getAttribute("username")==null)
{
	//response.sendRedirect("index.jsp");
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>lc聊天室</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/AjaxRequest.js"></script>
<script language="javascript">
window.setInterval("showContent();",1000); 
window.setInterval("showOnline();",10000); 
var sysBBS="<span style='font-size:14px; line-height:30px;'>请遵守聊天室规则，不要使用不文明用语,网络环境由大家守护!</span><br><span style='line-height:22px;'>";
function showOnline(){
	var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
}
function showContent(){
	var loader1=new net.AjaxRequest("MessagesAction?action=getMessages&nocache="+new Date().getTime(),deal_content,onerror,"GET");
}
function onerror(){
	alert("很抱歉，服务器出现错误，当前窗口将关闭！");
	window.opener=null;
	window.close();
}
function deal_online(){
	online.innerHTML=this.req.responseText;
}
function deal_content(){
	var returnValue=this.req.responseText;		//获取Ajax处理页的返回值
	var h=returnValue.replace(/\s/g,"");	//去除字符串中的Unicode空白符
	if(h=="error"){
		//alert("您的账户已经过期，请重新登录！");
		Exit();
	}else{
		content.innerHTML=sysBBS+returnValue+"</span>";
	}
}
//控制是否滚屏
function checkScrollScreen(){
	if(!form1.scrollScreen.checked){
		document.getElementById("content").style.overflow='auto';
	}else{
		document.getElementById("content").style.overflow='auto';
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	}
	setTimeout('checkScrollScreen()',500);
}
window.onload=function(){
	checkScrollScreen();				
	showContent();						
	showOnline();						
}
</script>

<script language="javascript">
<!--
	function send(){	
		if(form1.to.value==""){
			alert("请选择聊天对象！");return false;
		}
		if(form1.content1.value==""){
			alert("发送信息不可以为空！");form1.content1.focus();return false;
		}
		if(form1.isPrivate.checked){
			isPrivate="true";
		}else{
			isPrivate="false";
		}
		var param="from="+form1.from.value+"&face="+form1.face.value+"&color="+form1.color.value+"&to="+form1.to.value+"&content="+	form1.content1.value+"&isPrivate="+isPrivate; 
		var loader=new net.AjaxRequest("MessagesAction?action=sendMessage",deal_send,onerror,"POST",param);

	}
function deal_send(){
content.innerHTML=sysBBS+this.req.responseText+"</span>";
	if(form1.scrollScreen.checked){
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	
	}
	clearTimeout(timer);
	timer = window.setTimeout("Exit()",<%=maxTime%>); 
	form1.content1.value="";
}	
	function Exit(){
		window.location.href="leave.jsp";
		alert("即将退出聊天室！");
	}
-->
</script>
<script language="javascript">
function set(selectPerson){	
	if(selectPerson!="<%=session.getAttribute("username")%>"){
		if(form1.isPrivate.checked && selectPerson=="所有人"){
			alert("请选择至少一个私聊对象！");
		}else{
			form1.to.value=selectPerson;
		}
	}else{
		alert("请重新选择聊天对象！");
	}
}
function checkIsPrivate(){
	if(form1.isPrivate.checked){
		if(form1.to.value=="所有人"){	
			alert("请选择私聊对象！");
			form1.to.value="";
		}
		
	}	
}
</script>
<script language="jscript"> 
timer = window.setTimeout("Exit()",<%=maxTime%>); 		

window.onbeforeunload=function(){   
	if(event.clientY<0 && event.clientX>document.body.scrollWidth){  
	 	Exit();		
	}   
}   
</script> 

<script language="javascript">
var ss = 0;  
var mm = 0;  
var hh = 0;  
var quartz = "";  
  
$(document).ready(function() {  
        var now = new Date();
       
        var loginTime= '<%=loginTime%>' ;  
        var nowTime = now.getTime();  
        var onlineTime = nowTime-loginTime;   

        ss = MillisecondToSecond(onlineTime);  
        mm = MillisecondToMinute(onlineTime);  
        hh = MillisecondToHour(onlineTime);  
          
        $('#h').html(hh+'小时');  
        $('#m').html(mm+'分');  
        $('#s').html(ss+'秒');  
          
        quartz = setInterval(timing,1000);  
});   
function timing(){  
    ss++;  
    $('#h').html(hh+'小时');  
    $('#m').html(mm+'分');  
    $('#s').html(ss+'秒');  
      
    if(ss==59){  
        mm++;  
        ss=-1;  
    }  
    if(mm==59){  
        hh++;  
        mm=0;  
          
    }  
    
}

function MillisecondToHour(msd) {  
    var timeHour = parseFloat(msd) / 1000;  
    if (null != timeHour && "" != timeHour) {  
        timeHour = parseInt(timeHour / 3600.0);  
    }  
    return timeHour;  
}  
function MillisecondToMinute(msd) {  
    var timeMinute = parseFloat(msd) / 1000;  
   if (null != timeMinute && "" != timeMinute) {  
   		timeMinute = parseInt((parseFloat(timeMinute/3600.0)-parseInt(timeMinute/3600.0)) * 60) ; 
    }  
    return timeMinute;  
}  
function MillisecondToSecond(msd) {  
   var timeSecond = parseFloat(msd) / 1000;  
  if (null != timeSecond && "" != timeSecond) {  
    timeSecond = parseInt((parseFloat((parseFloat(timeSecond/3600.0) - parseInt(timeSecond/3600.0)) * 60) -  
            parseInt((parseFloat(timeSecond/3600.0)-parseInt(timeSecond/3600.0)) * 60)) * 60);  
    }  
    return timeSecond;  
}     
</script>  

<body>
<table width="934" height="678"  align="center">
  <tr>
    <td height="529" background="images/9.jpg"><table width="926" height="488"  align="left">
      <tr>
        <td width="38" height="54">&nbsp;</td>
        <td colspan="2"><h1 align="center" class="STYLE1">LC聊天室</h1></td>
        <td width="210"><strong><span >该用户的登录时间为:<br></span><%=loginTime2 %><br><span >累计在线时长：</span> <span id="m"></span> <span id="s"></span></strong></td>
      </tr>
      <tr>
        <td height="395">&nbsp;</td>
        <td width="184" valign="top" id="online" bgcolor="#CCFFFF"><div align="center">
          <h3><span class="STYLE2">当前在线用户：</span></h3>
        </div></td>
        <td width="464" valign="top" id="content" bgcolor="#FFFF66"><div align="center">
          <h3><span class="STYLE2">聊天内容：</span></h3>
        </div></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td> &nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="141" background="images/7.jpeg">
	<form id="form1" name="form1" method="post" action="">
      <table width="925" height="116" border="1" bordercolor="#FF66FF">
        <tr>
          <td colspan="3"><div align="left"><strong>用户</strong>
            <input name="from" type="hidden" value="<%=session.getAttribute("username")%>">
            <strong><span class="STYLE4">[<%=session.getAttribute("username")%> ]</span></strong><strong>向</strong>
            <input name="to" type="text" value="所有人" size="35" readonly="readonly">
            <strong>发送消息	  </strong></div></td>
          <td width="180"><div align="center"><strong>滚屏</strong>
            <input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
          </div></td>
        </tr>
        <tr>
          <td colspan="3"><div align="left"><strong>内容为</strong>：
            <input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
              
          </div></td>
          <td><div align="center">
            <input name="Submit2" type="button" class="btn_orange" value="发送(Ctrl+Enter)" onclick="send()" />
          </div></td>
        </tr>
        <tr>
          <td width="218"><div align="center"><strong>私人对话</strong>
            <input name="isPrivate" type="checkbox" class="noborder" id="isPrivate" value="true" onClick="checkIsPrivate()">
          </div></td>
          <td width="244"><div align="center"><strong>对话表情</strong>
              <select name="face" class="wenbenkuang">
                <option  value="无表情的">无表情的</option>
                <option value="微笑着" selected>微笑着</option>
                <option value="笑呵呵地">笑呵呵地</option>
                <option value="热情的">热情的</option>
                <option value="温柔的">温柔的</option>
                <option value="红着脸">红着脸</option>
                <option value="幸福的">幸福的</option>
                <option value="嘟着嘴">嘟着嘴</option>
                <option value="热泪盈眶的">热泪盈眶的</option>
                <option value="依依不舍的">依依不舍的</option>
                <option value="得意的">得意的</option>
                <option value="神秘兮兮的">神秘兮兮的</option>
                <option value="恶狠狠的">恶狠狠的</option>
                <option value="大声的">大声的</option>
                <option value="生气的">生气的</option>
                <option value="幸灾乐祸的">幸灾乐祸的</option>
                <option value="同情的">同情的</option>
                <option value="遗憾的">遗憾的</option>
                <option value="正义凛然的">正义凛然的</option>
                <option value="严肃的">严肃的</option>
                <option value="慢条斯理的">慢条斯理的</option>
                <option value="无精打采的">无精打采的</option>
                </select>
          </div></td>
          <td width="255"><div align="center"><strong>字体颜色：</strong>            
                <select name="color" size="1" class="wenbenkuang" id="select">
                        <option selected>默认颜色</option>
                        <option style="color:#FF0000" value="FF0000">红色热情</option>
                        <option style="color:#0000FF" value="0000ff">蓝色开朗</option>
                        <option style="color:#ff00ff" value="ff00ff">桃色浪漫</option>
                        <option style="color:#009900" value="009900">绿色青春</option>
                        <option style="color:#009999" value="009999">青色清爽</option>
                        <option style="color:#990099" value="990099">紫色拘谨</option>
                        <option style="color:#990000" value="990000">暗夜兴奋</option>
                        <option style="color:#000099" value="000099">深蓝忧郁</option>
                        <option style="color:#999900" value="999900">卡其制服</option>
                        <option style="color:#ff9900" value="ff9900">镏金岁月</option>
                        <option style="color:#0099ff" value="0099ff">湖波荡漾</option>
                        <option style="color:#9900ff" value="9900ff">发亮蓝紫</option>
                        <option style="color:#ff0099" value="ff0099">爱的暗示</option>
                        <option style="color:#006600" value="006600">墨绿深沉</option>
                        <option style="color:#999999" value="999999">烟雨蒙蒙</option>
                        </select>
          </div></td>
          <td><div align="center">
            <input name="button_exit" type="button" class="btn_orange" value="退出聊天室" onClick="Exit()">
          </div></td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
</table>
</body>
</html>
