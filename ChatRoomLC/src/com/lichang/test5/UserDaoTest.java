package com.lichang.test5;

public class UserDaoTest {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		try {
		User user = new User();
		user.setUsername("b");
		user.setPassword("1");
		user.setEmail("email");
		user.setAddress(23);
		user.setPhone("13000000000");
		user.setSex("女");
		UserDao.AddUser(user);
		if(UserDao.SelectUser("a","1"))
			System.out.println("test success");
		else
			System.out.println("fail");
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}

}
