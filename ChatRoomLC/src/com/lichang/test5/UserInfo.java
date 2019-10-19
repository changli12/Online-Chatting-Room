package com.lichang.test5;



import java.io.Serializable;
import java.util.Vector;
/**
 * �������û�����Ϣ��  �����¼�������û�
 * @author Administrator
 *
 */
public class UserInfo implements Serializable {
	private static UserInfo user = new UserInfo();
	private Vector vector = null;
	public UserInfo() {
		this.vector = new Vector();
	}
	public static UserInfo getInstance() {
		return user;
	}

	public boolean addUser(String user) {
		if (user != null) {
			this.vector.add(user);
			return true;
		} else {
			return false;
		}
	}
	public Vector getList() {
		return vector;
	}
	public void removeUser(String user) {
		if (user != null) {
			vector.removeElement(user);
		}
	}
}
