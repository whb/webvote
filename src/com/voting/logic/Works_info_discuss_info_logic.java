package com.voting.logic;

import java.sql.Connection;
import java.util.ArrayList;
import com.voting.util.DataBaseConnection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.voting.javabean.Works_info_discuss_info_bean;

//查询 竞赛作品基本信息表works_info 和 评论基本信息表discuss_info
//序号 作品id 作品名称 作者 评论内容 评论时间 评论发布状态

public class Works_info_discuss_info_logic {
    Connection conn = null;
    public ArrayList getWorks_info_discuss_info(){
       ArrayList list = null;
       try {
            conn = new DataBaseConnection().getConnection();
            PreparedStatement ps = conn.prepareStatement("select a.works_id,discuss_id,works_title,works_author,discuss_commond,discuss_time,discuss_status from works_info a,discuss_info b where a.works_id=b.works_id order by discuss_time desc");
            ResultSet rs = ps.executeQuery();
            list = new ArrayList();
            while(rs.next()){
                Works_info_discuss_info_bean widib = new Works_info_discuss_info_bean();
                widib.setWorks_id(rs.getInt("works_id"));
                widib.setDiscuss_id(rs.getInt("discuss_id"));
                widib.setWorks_title(rs.getString("works_title"));
                widib.setWorks_author(rs.getString("works_author"));
                widib.setDiscuss_commond(rs.getString("discuss_commond"));
                widib.setDiscuss_time(rs.getString("discuss_time"));
                widib.setDiscuss_status(rs.getString("discuss_status"));
                list.add(widib);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception ex) {
            return list = null;
        }
       return list;
   }
   //修改信息审核状态
   public int update_discuss_status(String id,String status){
      int count = 0;
      try {
           conn = new DataBaseConnection().getConnection();
           PreparedStatement ps = conn.prepareStatement("update discuss_info set discuss_status=? where discuss_id=?");
           ps.setString(1,status);
           ps.setString(2,id);
           count = ps.executeUpdate();
           //ResultSet rs = ps.executeQuery();
           //rs.close();
           ps.close();
           conn.close();
       } catch (Exception ex) {
           return count = 0;
       }
      return count;
  }

}
