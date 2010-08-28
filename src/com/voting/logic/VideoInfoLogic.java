package com.voting.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.voting.javabean.Video_info;
import com.voting.util.DataBaseConnection;

public class VideoInfoLogic {
public boolean addVideoInfo(Video_info video_info){
	boolean flag=false;
	Connection conn=null;
	PreparedStatement ps=null;
	String sql="insert into video_info(works_id,video_url) values(?,?)";
	try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setInt(1,video_info.getWorks_id());
		ps.setString(2,video_info.getVideo_url());
		int f=ps.executeUpdate();
		if(f>0){flag=true;}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try{
			if(ps!=null){ps.close();ps=null;}
            if(conn!=null){conn.close();conn=null;}			
		}catch(SQLException se){
			se.printStackTrace();
		}
	}
	return flag;
}
public boolean editVideoInfo(Video_info video_info){
	boolean flag=false;
	Connection conn=null;
	PreparedStatement ps=null;
	String sql1="update video_info set video_url=? where works_id=?";
	String sql2="insert into video_info(video_url,works_id) values(?,?)";
	
	try{
		String url=getVideo_url(video_info.getWorks_id());
		System.out.println("url::"+url);
		conn=DataBaseConnection.getConnection();
		if(url==null||url.equals("")){
	    ps=conn.prepareStatement(sql2);
		}else{
		ps=conn.prepareStatement(sql1);	
		}
	    ps.setString(1,video_info.getVideo_url());
	    ps.setInt(2,video_info.getWorks_id());
	    int f=ps.executeUpdate();
	    System.out.println("f2::"+f);
	    if(f>0){flag=true;}
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try{
			if(ps!=null){ps.close();ps=null;}
			if(conn!=null){conn.close();conn=null;}
			
		}catch(SQLException se){
			se.printStackTrace();
		}
	}
	return flag;
	
}
public String getVideo_url(int works_id){
	String video_url="";
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String sql="select video_url from video_info where works_id=?";
	try{
	conn=DataBaseConnection.getConnection();
	ps=conn.prepareStatement(sql);
	ps.setInt(1,works_id);
	rs=ps.executeQuery();
	if(rs.next()){
		video_url=rs.getString("video_url");
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
	return video_url;
}
}
