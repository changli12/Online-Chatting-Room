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
<title>lc������</title>
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/AjaxRequest.js"></script>
<script language="javascript">
window.setInterval("showContent();",1000); 
window.setInterval("showOnline();",10000); 
var sysBBS="<span style='font-size:14px; line-height:30px;'>�����������ҹ��򣬲�Ҫʹ�ò���������,���绷���ɴ���ػ�!</span><br><span style='line-height:22px;'>";
function showOnline(){
	var loader=new net.AjaxRequest("online.jsp?nocache="+new Date().getTime(),deal_online,onerror,"GET");
}
function showContent(){
	var loader1=new net.AjaxRequest("MessagesAction?action=getMessages&nocache="+new Date().getTime(),deal_content,onerror,"GET");
}
function onerror(){
	alert("�ܱ�Ǹ�����������ִ��󣬵�ǰ���ڽ��رգ�");
	window.opener=null;
	window.close();
}
function deal_online(){
	online.innerHTML=this.req.responseText;
}
function deal_content(){
	var returnValue=this.req.responseText;		//��ȡAjax����ҳ�ķ���ֵ
	var h=returnValue.replace(/\s/g,"");	//ȥ���ַ����е�Unicode�հ׷�
	if(h=="error"){
		//alert("�����˻��Ѿ����ڣ������µ�¼��");
		Exit();
	}else{
		content.innerHTML=sysBBS+returnValue+"</span>";
	}
}
//�����Ƿ����
function checkScrollScreen(){
	if(!form1.scrollScreen.checked){
		document.getElementById("content").style.overflow='auto';
	}else{
		document.getElementById("content").style.overflow='auto';
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//��������Ϣ����һ��ʱ���������ȷ��͵�������Ϣ����ʾ
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
			alert("��ѡ���������");return false;
		}
		if(form1.content1.value==""){
			alert("������Ϣ������Ϊ�գ�");form1.content1.focus();return false;
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
		alert("�����˳������ң�");
	}
-->
</script>
<script language="javascript">
function set(selectPerson){	
	if(selectPerson!="<%=session.getAttribute("username")%>"){
		if(form1.isPrivate.checked && selectPerson=="������"){
			alert("��ѡ������һ��˽�Ķ���");
		}else{
			form1.to.value=selectPerson;
		}
	}else{
		alert("������ѡ���������");
	}
}
function checkIsPrivate(){
	if(form1.isPrivate.checked){
		if(form1.to.value=="������"){	
			alert("��ѡ��˽�Ķ���");
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
          
        $('#h').html(hh+'Сʱ');  
        $('#m').html(mm+'��');  
        $('#s').html(ss+'��');  
          
        quartz = setInterval(timing,1000);  
});   
function timing(){  
    ss++;  
    $('#h').html(hh+'Сʱ');  
    $('#m').html(mm+'��');  
    $('#s').html(ss+'��');  
      
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
        <td colspan="2"><h1 align="center" class="STYLE1">LC������</h1></td>
        <td width="210"><strong><span >���û��ĵ�¼ʱ��Ϊ:<br></span><%=loginTime2 %><br><span >�ۼ�����ʱ����</span> <span id="m"></span> <span id="s"></span></strong></td>
      </tr>
      <tr>
        <td height="395">&nbsp;</td>
        <td width="184" valign="top" id="online" bgcolor="#CCFFFF"><div align="center">
          <h3><span class="STYLE2">��ǰ�����û���</span></h3>
        </div></td>
        <td width="464" valign="top" id="content" bgcolor="#FFFF66"><div align="center">
          <h3><span class="STYLE2">�������ݣ�</span></h3>
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
          <td colspan="3"><div align="left"><strong>�û�</strong>
            <input name="from" type="hidden" value="<%=session.getAttribute("username")%>">
            <strong><span class="STYLE4">[<%=session.getAttribute("username")%> ]</span></strong><strong>��</strong>
            <input name="to" type="text" value="������" size="35" readonly="readonly">
            <strong>������Ϣ	  </strong></div></td>
          <td width="180"><div align="center"><strong>����</strong>
            <input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
          </div></td>
        </tr>
        <tr>
          <td colspan="3"><div align="left"><strong>����Ϊ</strong>��
            <input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
              
          </div></td>
          <td><div align="center">
            <input name="Submit2" type="button" class="btn_orange" value="����(Ctrl+Enter)" onclick="send()" />
          </div></td>
        </tr>
        <tr>
          <td width="218"><div align="center"><strong>˽�˶Ի�</strong>
            <input name="isPrivate" type="checkbox" class="noborder" id="isPrivate" value="true" onClick="checkIsPrivate()">
          </div></td>
          <td width="244"><div align="center"><strong>�Ի�����</strong>
              <select name="face" class="wenbenkuang">
                <option  value="�ޱ����">�ޱ����</option>
                <option value="΢Ц��" selected>΢Ц��</option>
                <option value="Ц�Ǻǵ�">Ц�Ǻǵ�</option>
                <option value="�����">�����</option>
                <option value="�����">�����</option>
                <option value="������">������</option>
                <option value="�Ҹ���">�Ҹ���</option>
                <option value="�����">�����</option>
                <option value="����ӯ����">����ӯ����</option>
                <option value="���������">���������</option>
                <option value="�����">�����</option>
                <option value="���������">���������</option>
                <option value="��ݺݵ�">��ݺݵ�</option>
                <option value="������">������</option>
                <option value="������">������</option>
                <option value="�����ֻ���">�����ֻ���</option>
                <option value="ͬ���">ͬ���</option>
                <option value="�ź���">�ź���</option>
                <option value="������Ȼ��">������Ȼ��</option>
                <option value="�����">�����</option>
                <option value="����˹���">����˹���</option>
                <option value="�޾���ɵ�">�޾���ɵ�</option>
                </select>
          </div></td>
          <td width="255"><div align="center"><strong>������ɫ��</strong>            
                <select name="color" size="1" class="wenbenkuang" id="select">
                        <option selected>Ĭ����ɫ</option>
                        <option style="color:#FF0000" value="FF0000">��ɫ����</option>
                        <option style="color:#0000FF" value="0000ff">��ɫ����</option>
                        <option style="color:#ff00ff" value="ff00ff">��ɫ����</option>
                        <option style="color:#009900" value="009900">��ɫ�ഺ</option>
                        <option style="color:#009999" value="009999">��ɫ��ˬ</option>
                        <option style="color:#990099" value="990099">��ɫ�н�</option>
                        <option style="color:#990000" value="990000">��ҹ�˷�</option>
                        <option style="color:#000099" value="000099">��������</option>
                        <option style="color:#999900" value="999900">�����Ʒ�</option>
                        <option style="color:#ff9900" value="ff9900">�ֽ�����</option>
                        <option style="color:#0099ff" value="0099ff">��������</option>
                        <option style="color:#9900ff" value="9900ff">��������</option>
                        <option style="color:#ff0099" value="ff0099">���İ�ʾ</option>
                        <option style="color:#006600" value="006600">ī�����</option>
                        <option style="color:#999999" value="999999">��������</option>
                        </select>
          </div></td>
          <td><div align="center">
            <input name="button_exit" type="button" class="btn_orange" value="�˳�������" onClick="Exit()">
          </div></td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
</table>
</body>
</html>
