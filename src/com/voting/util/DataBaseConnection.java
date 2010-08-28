package com.voting.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DataBaseConnection {
    public static synchronized Connection getConnection(){
    	Connection conn=null;
    	String url="jdbc:mysql://192.168.1.168:3306/oushi_vote?user=root&password=adzzz&useUnicode=true&characterEncoding=utf8";
    	try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return conn;
    }
   
}
