package com.lichang.test5;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Random;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;


public class MessagesAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MessagesAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("getMessages".equals(action)) {		
			this.getMessages(request, response);
		} else if ("sendMessage".equals(action)) {	
			this.sendMessages(request, response);
		} else if ("loginRoom".equals(action)) {	
				try {
					this.loginRoom(request, response);
				} catch (ClassNotFoundException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
		}
	}
	// 读取保存聊天信息的XML文件
	public void getMessages(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html;charset=GBK");
		String fileURL = createFile(request, response); 
		
		/*******************开始解析保存聊天内容的XML文件**********************/
		Document feedDoc =null;
		try {
			SAXBuilder builder = new SAXBuilder();
			feedDoc = builder.build(fileURL); 
			Element root = feedDoc.getRootElement();			
			Element channel = root.getChild("messages");		
			Iterator items = channel.getChildren("message").iterator();		
			String messages = "";
			// 获取当前用户
			HttpSession session = request.getSession();
			String userName = "";
			if (null == session.getAttribute("username")) {
				request.setAttribute("messages", "error");		
			} else {
				userName = session.getAttribute("username").toString();
				DateFormat df = DateFormat.getDateTimeInstance();
				while (items.hasNext()) {
					Element item = (Element) items.next();
					String sendTime = item.getChildText("sendTime");	
					try {
						if (df.parse(sendTime).after(
								df.parse(session.getAttribute("loginTime").toString()))
								|| sendTime.equals(session.getAttribute("loginTime").toString())) {
							String from = item.getChildText("from");	
							String face = item.getChildText("face");	
							String to = item.getChildText("to");		
							String content = item.getChildText("content");	
							boolean isPrivate = Boolean.valueOf(item.getChildText("isPrivate"));
							if (isPrivate) {		
								if (userName.equals(to)
										|| userName.equals(from)) {
									messages += "<font color='red' >[私人对话]</font><font color='blue'><b>"
											+ from
											+ "</b></font><font color='#CC0000'>"
											+ face
											+ "</font>对<font color='green'>["
											+ to
											+ "]</font>说"
											+ "&nbsp;<font color='gray'>["
											+ sendTime + "]</font><br>"
											+ content+"<br/>";
								}
							} else if ("[系统公告]".equals(from)) {	
								messages += "[系统公告]：" + content
										+ "&nbsp;<font color='gray'>["
										+ sendTime + "]</font><br>";
							} else {		
								messages += "<font color='blue'><b>" + from
										+ "</b></font><font color='#CC0000'>"
										+ face
										+ "</font>对<font color='green'>[" + to
										+ "]</font>说"
										+ "&nbsp;<font color='gray'>["
										+ sendTime + "]</font><br>"
										+ content+"<br/>";
							}
						}
					} catch (Exception e) {
						System.out.println("错误" + e.getMessage());
					}
				}
				request.setAttribute("messages", messages);		
			}
			request.getRequestDispatcher("content.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	public void loginRoom(HttpServletRequest request,
			HttpServletResponse response) throws ClassNotFoundException, IOException, ServletException  {
		response.setContentType("text/html;charset=GBK");
		HttpSession session = request.getSession();
		
		StringUtils su=new StringUtils();
		
		String username=su.toGBK(request.getParameter("username"));	
		String userpwd=su.toGBK(request.getParameter("userpwd"));	
		
		if(UserDao.SelectUser(username, userpwd))
		{
		
		UserInfo user=UserInfo.getInstance();		
		session.setMaxInactiveInterval(600);		
		Vector vector=user.getList();
		boolean flag=true;		
	
		if(vector!=null&&vector.size()>0){
			for(int i=0;i<vector.size();i++){
				System.out.println(username);
				System.out.println(vector.elementAt(i));
				if(username.equals(vector.elementAt(i))){
					PrintWriter out = null;
					try {
						user.removeUser(username);
						out = response.getWriter();
						out.println("<script language='javascript'>alert('该用户已登录！');window.location.href='index.jsp';</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
					flag=false;
					break;
				}
			}
		}
		
		if(flag){
			UserListener ul=new UserListener();					
			ul.setUser(username);								
			user.addUser(ul.getUser());							
			session.setAttribute("user",ul);					
			session.setAttribute("username",username);			
			DateFormat ddtf = DateFormat.getDateTimeInstance();     
			Date date1 = new Date();
			session.setAttribute("loginTime",new Date().toLocaleString());		
			
		/** *******************开始系统公告********************************** */
		String fileURL = createFile(request, response); 
		// 获取当前用户
		System.out.println(fileURL);
		SAXBuilder builder = new SAXBuilder();
		try {
			Document feedDoc = builder.build(fileURL);

		Element root = feedDoc.getRootElement();
		Element channel = root.getChild("messages");
		Element newNode = new Element("message");
		channel.addContent(newNode); // 创建messages节点
		Element fromNode = new Element("from").setText("[系统公告]");
		newNode.addContent(fromNode);
		Element faceNode = new Element("face").setText("");
		newNode.addContent(faceNode);
		Element toNode = new Element("to").setText("");
		newNode.addContent(toNode);
		Element contentNode = new Element("content")
				.setText("<font color='gray'>[" + username + "]走进了聊天室！</font>");
		newNode.addContent(contentNode);
		// 登录时间
		Element sendTimeNode = new Element("sendTime").setText(ddtf.format(date1));
		newNode.addContent(sendTimeNode);
		Element isPrivateNode = new Element("isPrivate").setText("false");
		newNode.addContent(isPrivateNode);
		//跳转到登陆成功的界面
		request.getRequestDispatcher("login_ok.jsp").forward(request, response);
		XMLOutputter xml = new XMLOutputter(Format.getPrettyFormat());
		xml.output(feedDoc, new FileOutputStream(fileURL));
		} catch (Exception e) {
			e.printStackTrace();
		}}
		
		}
		else
		{
			PrintWriter out =null;
			out = response.getWriter();
			out.println("<script language='javascript'>alert('用户名或密码不正确！');window.location.href='index.jsp';</script>");
		}
		} 

	public void sendMessages(HttpServletRequest request,
			HttpServletResponse response){
		response.setContentType("text/html;charset=GBK");
		StringUtils su = new StringUtils();
		Random random = new Random();
		String from = su.toUTF8(request.getParameter("from"));			
		String face = su.toUTF8(request.getParameter("face"));			
		String to = su.toUTF8(request.getParameter("to"));				
		String color = request.getParameter("color");					
		String content = su.toUTF8(request.getParameter("content"));	
		String isPrivate = request.getParameter("isPrivate");
		DateFormat ddtf = DateFormat.getDateTimeInstance();     
		Date date = new Date();
		String sendTime = ddtf.format(date);					
		String fileURL = createFile(request, response); 
		SAXBuilder builder = new SAXBuilder();
		Document feedDoc;
		try {
			feedDoc = builder.build(fileURL);
		
		Element root = feedDoc.getRootElement();
		Element channel = root.getChild("messages");
		Element newNode = new Element("message");
		channel.addContent(newNode); 
		Element fromNode = new Element("from").setText(from);
		newNode.addContent(fromNode);		
		Element faceNode = new Element("face").setText(face);
		newNode.addContent(faceNode);			
		Element toNode = new Element("to").setText(to);
		newNode.addContent(toNode);			
		Element contentNode = new Element("content").setText("<font color='"
				+ color + "'>" + content + "</font>");
		newNode.addContent(contentNode);			
		Element sendTimeNode = new Element("sendTime").setText(sendTime);
		newNode.addContent(sendTimeNode);			
		Element isPrivateNode = new Element("isPrivate").setText(isPrivate);
		newNode.addContent(isPrivateNode);			
		//转发的界面
		request.getRequestDispatcher(
				"MessagesAction?action=getMessages&nocache="
						+ random.nextInt(10000)).forward(request, response);
		XMLOutputter xml = new XMLOutputter(Format.getPrettyFormat());
		xml.output(feedDoc, new FileOutputStream(fileURL));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String createFile(HttpServletRequest request,
			HttpServletResponse response) {
		Date date = new Date();
		String newTime = new  SimpleDateFormat("yyyyMMdd").format(date);
		String fileURL = getServletContext().getRealPath("/")+"xml\\"+newTime + ".xml";
		File file = new File(fileURL);
		if (!file.exists()) {
			try {
				PrintWriter out =null;
				try {
					out = response.getWriter();
					out.println("<script language='javascript'>alert('第一个登录');window.location.href='index.jsp';</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
				file.createNewFile(); 
				String dataStr = "<?xml version=\"1.0\" encoding=\"GBK\"?>\r\n";
				dataStr = dataStr + "<chat>\r\n";
				dataStr = dataStr + "<messages></messages>";
				dataStr = dataStr + "</chat>\r\n";
				byte[] content = dataStr.getBytes();
				FileOutputStream fout = new FileOutputStream(file);
				fout.write(content); 
				fout.flush(); 
				fout.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			PrintWriter out =null;
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>alert('有了。');</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return fileURL;
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
