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
		connection=DriverManager.getConnection(url,"root","123");//���ݿ��ַ�������ݿ�
		System.out.println("");
		
		return connection;
	}
	public static boolean AddUser(User c) throws ClassNotFoundException
	{
		
		try
		{
			if(SelectUsername(c.getUsername()))
			{
				System.out .println("���û����ѱ�ע��");
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
			System.out.println("ע��ɹ�");
			return true;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("����û���Ϣ�쳣");
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
				System.out.println("��¼��ȷ");
				return true;
			}
			System.out.println("�˻����벻��");
			return false;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("��ȡ�û���Ϣ�쳣");
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
				System.out.println("�û����ѱ�ռ�ã��뻻һ���û���");
				return true;
			}
			System.out.println("���ظ��û���");
			return false;
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			throw new RuntimeException("��ȡ�û���Ϣ�쳣");
		}

	}
}
