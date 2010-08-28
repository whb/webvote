package com.voting.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.voting.javabean.Video_info;
import com.voting.javabean.Works_info;
import com.voting.util.DataBaseConnection;

public class WorksInfoLogic {
	public boolean addWorksInfo(Works_info works_info){
		boolean flag=false;
		Connection conn=null;
		PreparedStatement ps=null;
		
		String sql="insert into works_info(works_title,works_author,works_recommond,works_file_name,works_type) values(?,?,?,?,?)";
		try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setString(1,works_info.getWorks_title());
		ps.setString(2,works_info.getWorks_author());
		ps.setString(3,works_info.getWorks_recommond());
		ps.setString(4,works_info.getWorks_file_name());
		ps.setString(5,works_info.getWorks_type());
		int i=ps.executeUpdate();
		if(i>0){flag=true;
		
		if(works_info.getWorks_type().equals("flv")){
		VideoInfoLogic videoInfoLogic=new VideoInfoLogic();
		Video_info video_info=new Video_info();
		video_info.setWorks_id(getNewId());
		video_info.setVideo_url(works_info.getWorks_addr());
		flag=videoInfoLogic.addVideoInfo(video_info);
		}
		}
		}
		catch(Exception ex){
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
	public ArrayList getWorksInfoMsg(){
		ArrayList list=new ArrayList();
		
		VideoInfoLogic videoInfoLogic=new VideoInfoLogic();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from works_info order by works_id desc";
		try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			Works_info worksinfo=new Works_info();
			worksinfo.setWorks_id(rs.getInt("works_id"));
			worksinfo.setWorks_author(rs.getString("works_author"));
			worksinfo.setWorks_file_name(rs.getString("works_file_name"));
			worksinfo.setWorks_recommond(rs.getString("works_recommond"));
			worksinfo.setWorks_release_time(rs.getString("works_release_time"));
			worksinfo.setWorks_title(rs.getString("works_title"));
			worksinfo.setWorks_type(rs.getString("works_type"));
			if(rs.getString("works_type").equals("flv")){
				String works_addr=videoInfoLogic.getVideo_url(rs.getInt("works_id"));
				worksinfo.setWorks_addr(works_addr);
				}
			list.add(worksinfo);
			
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
	public Works_info getWorksInfoMsgByID(int works_id){
		ArrayList list=new ArrayList();
		
		VideoInfoLogic videoInfoLogic=new VideoInfoLogic();
		Works_info worksinfo=new Works_info();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql="select * from works_info where works_id=?";
		try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setInt(1,works_id);
		rs=ps.executeQuery();
		while(rs.next()){
			
			worksinfo.setWorks_id(rs.getInt("works_id"));
			worksinfo.setWorks_author(rs.getString("works_author"));
			worksinfo.setWorks_file_name(rs.getString("works_file_name"));
			worksinfo.setWorks_recommond(rs.getString("works_recommond"));
			worksinfo.setWorks_release_time(rs.getString("works_release_time"));
			worksinfo.setWorks_title(rs.getString("works_title"));
			worksinfo.setWorks_type(rs.getString("works_type"));
			if(rs.getString("works_type").equals("flv")){
				String works_addr=videoInfoLogic.getVideo_url(rs.getInt("works_id"));
				worksinfo.setWorks_addr(works_addr);
				}
			
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
		return worksinfo;
		
	}
	public boolean delWorksInfo(int works_id){
		boolean flag=false;
		Connection conn=null;
		PreparedStatement ps=null;
		String sql="delete from works_info where works_id=?";
		try{
		conn=DataBaseConnection.getConnection();
		ps=conn.prepareStatement(sql);
		ps.setInt(1,works_id);
		int i=ps.executeUpdate();
		if(i>0){flag=true;}
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
	public boolean editWorksInfo(Works_info works_info){
		VideoInfoLogic videoInfoLogic=new VideoInfoLogic();
		boolean flag=false;
		Connection conn=null;
		PreparedStatement ps=null;
		String sql="update works_info set works_title=?,works_author=?,works_recommond=?,works_file_name=?,works_type=? where works_id=?";
		try{
			conn=DataBaseConnection.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1,works_info.getWorks_title());
			ps.setString(2,works_info.getWorks_author());
			ps.setString(3,works_info.getWorks_recommond());
			ps.setString(4,works_info.getWorks_file_name());
			ps.setString(5,works_info.getWorks_type());
			ps.setInt(6,works_info.getWorks_id());
			int f=ps.executeUpdate();
			
			if(f>0){flag=true;}
			if(works_info.getWorks_type().equals("flv")){
				Video_info video_info=new Video_info();
				video_info.setVideo_url(works_info.getWorks_addr());
				video_info.setWorks_id(works_info.getWorks_id());
				flag=videoInfoLogic.editVideoInfo(video_info);
			}
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
	public int getNewId(){
		int newId=0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select works_id from works_info order by works_id desc limit 1";		
		try{
			conn = DataBaseConnection.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){newId = rs.getInt(1);}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(rs!=null){rs.close();rs=null;}
				if(ps!=null){ps.close();ps=null;}
				if(conn!=null){conn.close();conn=null;}
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		return newId;
	}
}
