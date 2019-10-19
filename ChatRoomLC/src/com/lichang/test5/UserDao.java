package com.lichang.test5;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Connection connection;
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/user?"+"&user=root&password=123&useUnicode=true&amp;characterEncoding=GBK;";
		connection=DriverManager.getConnection(url,"root","123");//数据库地址连接数据库
		System.out.println("");
		
		return connection;
	}
	public static boolean AddUser(User c) throws ClassNotFoundException
	{
		
		try
		{
			if(SelectUsername(c.getUsername()))
			{
				System.out .println("该用户名已被注册");
				return false;
			}
			String sql="insert into userinfo values(?,?,?,?,?,?)";
			PreparedStatement ptmt=getConnection().prepareStatement(sql);
			ptmt.setString(1,c.getUsername());
			ptmt.setString(2,c.getPassword());
			ptmt.setString(3,c.getEmail());
			ptmt.setInt(4,c.getAddress());
			ptmt.setString(5,c.getSex());
			ptmt.setString(6,c.getPhone());
			ptmt.executeUpdate();
			System.out.println("注册成功");
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("添加用户信息异常");
		}
	}
	public static boolean SelectUser(String name,String pwd) throws ClassNotFoundException
	{
		try
		{
			String sql="select * from userinfo where username=? and userpwd=?";
			PreparedStatement ptmt=getConnection().prepareStatement(sql);
			ptmt.setString(1, name);
			ptmt.setString(2, pwd);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next())
			{
				System.out.println("登录正确");
				return true;
			}
			System.out.println("账户密码不对");
			return false;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("读取用户信息异常");
		}

	}
	public static boolean SelectUsername(String name) throws ClassNotFoundException
	{
		try
		{
			String sql="select * from userinfo where username=?";
			PreparedStatement ptmt=getConnection().prepareStatement(sql);
			ptmt.setString(1, name);
			ResultSet rs=ptmt.executeQuery();
			if(rs.next())
			{
				System.out.println("用户名已被占用，请换一个用户名");
				return true;
			}
			System.out.println("无重复用户名");
			return false;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("读取用户信息异常");
		}

	}
}
