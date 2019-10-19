package com.lichang.test5;

public class StringUtils {
	public String toGBK(String strvalue) {
		try {
			if (strvalue == null) {			
				return "";					
			} else {
				strvalue = new String(strvalue.getBytes("ISO-8859-1"), "GBK");
				return strvalue;			
			}
		} catch (Exception e) {
			return "";
		}
	}

	public String toUTF8(String strvalue) {
		try {
			if (strvalue == null) {			
				return "";					
			} else {
				strvalue = new String(strvalue.getBytes("ISO-8859-1"), "UTF-8");
				return strvalue;		
			}
		} catch (Exception e) {
			return "";
		}
	}
}
