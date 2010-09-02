package com.voting.logic;

import java.sql.Connection;
import com.voting.util.DataBaseConnection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

//查询管理员表
public class Admin_login_logic {
    Connection conn = null;
    public int admin_login(String admin_name,String admin_pwd){
        int count = 0;
        try {
             conn = new DataBaseConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement("select * from admin_login where admin_name=? and admin_pwd=?");
             ps.setString(1,admin_name);
             ps.setString(2,admin_pwd);
             ResultSet rs = ps.executeQuery();
             if(rs.next()){
                 count = 1;
             }
             rs.close();
             ps.close();
             conn.close();
         } catch (Exception ex) {
             count = 0;
         }
        return count;
    }

}


/**
 ublic Member login(String userName,String password){
                 Member member = new Member();
                 Connection conn = null;
                 PreparedStatement pstmt = null;
                 ResultSet rs = null;
                 String sql = "select * from Member where userName=? and password=?";
                 try{
                         conn = DatabaseConn.getConnection();
                         pstmt = conn.prepareStatement(sql);
                         pstmt.setString(1, userName);
                         pstmt.setString(2, password);
                         rs = pstmt.executeQuery();
                         if(rs.next()){
                                 member.setId(rs.getString("id"));
                                 member.setEnterpriseName(rs.getString("enterpriseName"));
                                 member.setUserName(rs.getString("userName"));
                                 member.setMemberSite(rs.getString("memberSite"));
                                 member.setUserType(rs.getString("userType"));
                                 member.setAgentId(rs.getString("agentId"));
                                 member.setMemberSiteMod(rs.getString("memberSiteMod"));//2008-10-10
                                 member.setLinkman(rs.getString("linkman"));//2009.1.9
                                 member.setAddress(rs.getString("address"));
                                 member.setTelephone(rs.getString("telephone"));
                                 member.setEmail(rs.getString("email"));
//				String logo="0";                    //2009.2.28
//				if(rs.getString("logo")!=null){
//					logo="1";
//				}

                                 //2009-08-04
                                 member.setMemberSiteMod(rs.getString("memberSiteMod"));
                                 member.setLogo(rs.getString("logo"));
                                 member.setIsFlag(rs.getString("isFlag"));			//2009-10-30
                         }
                 }catch(Exception ex){
                         ex.printStackTrace();
                 }finally{
                         try{
                                 if(rs!=null){rs.close();rs=null;}
                                 if(pstmt!=null){pstmt.close();pstmt=null;}
                                 if(conn!=null){conn.close();conn=null;}
                         }catch(SQLException ex){
                                 ex.printStackTrace();
                         }
                 }
                 return member;
	}

 *
 */

