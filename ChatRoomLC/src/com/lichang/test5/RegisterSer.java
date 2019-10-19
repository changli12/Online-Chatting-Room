package com.lichang.test5;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterSer
 */
public class RegisterSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html;charset=GBK");
		StringUtils su=new StringUtils();//转化编码的格式
		String username=su.toGBK(request.getParameter("name"));	//获得登录用户名
		String xb=su.toGBK(request.getParameter("xb"));	
		String phone=su.toGBK(request.getParameter("phonenumber"));	
		String email=su.toGBK(request.getParameter("email"));	
		int address = Integer.parseInt(request.getParameter("address"));	
		String userpwd=su.toGBK(request.getParameter("mima"));
		User user=new User();
		user.setAddress(address);
		user.setEmail(email);
		user.setPhone(phone);
		user.setSex(xb);
		user.setUsername(username);
		user.setPassword(userpwd);
		try {
			if(UserDao.AddUser(user))
			{
				PrintWriter out =null;
				out = response.getWriter();
				out.println("<script language='javascript'>alert('注册成功，请登录！');window.location.href='index.jsp';</script>");
			}
			else
			{
				PrintWriter out =null;
				out = response.getWriter();
				out.println("<script charset='gbk' language='javascript'>alert('注册失败，请重新注册！');window.location.href='register.jsp';</script>");
			
			}
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

}
