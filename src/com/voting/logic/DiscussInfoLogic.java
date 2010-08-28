package com.voting.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.voting.javabean.Discuss_info;
import com.voting.util.DataBaseConnection;

public class DiscussInfoLogic {
	public ArrayList getDiscussInfo(int works_id){
		ArrayList list=new ArrayList();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select discuss_commond,discuss_time from discuss_info where works_id=? and discuss_status=1";
		try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setInt(1,works_id);
		rs=ps.executeQuery();
		while(rs.next()){
			Discuss_info discuss_info=new Discuss_info();
			discuss_info.setDiscuss_commond(rs.getString("discuss_commond"));
			discuss_info.setDiscuss_time(rs.getString("discuss_time"));
			list.add(discuss_info);
		}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();rs=null;}
				if(ps!=null){ps.close();ps=null;}
				if(conn!=null){conn.close();conn=null;}
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return list;
	}

}
