package com.lichang.test5;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

public class UserListener implements
javax.servlet.http.HttpSessionBindingListener{
	private String user;
	private UserInfo container = UserInfo.getInstance();
	private static HashMap<String, String> map = new HashMap<String, String>();

	public static boolean isAlreadyLogin(HttpSession session, String username) {
		boolean flag = false;
		if (map.containsValue(username)) {
			flag = true;
			Iterator<Entry<String, String>> it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry<String, String> entry = it.next();
				String key = entry.getKey();
				String val = entry.getValue();
				if (val.equals(username)) {
					map.remove(key);
				}
			}
			map.put(session.getId(), username);
		} else {
			flag = false;
			map.put(session.getId(), username);
		}
		return flag;
	}

	public static boolean isOnline(HttpSession session) {
		boolean flag = true;
		if (map.containsKey(session.getId())) {
			flag = true;
		} else {
			flag = false;
		}
		return flag;
	}
	public UserListener() {
		user = "";
	}
	public void setUser(String user) {
		this.user = user;
	}

	public String getUser() {
		return this.user;
	}
	
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("上线用户为"+ user);
		
	}
	public void valueUnbound(HttpSessionBindingEvent event) {
		System.out.println(this.user+"用户已下线");
		if (user!="") {
			container.removeUser(user);
		}
		
	}

}
