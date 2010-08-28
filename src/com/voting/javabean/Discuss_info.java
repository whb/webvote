package com.voting.javabean;

public class Discuss_info {
	private int discuss_id;                                    //投票序号
	private int works_id;                                      //作品ID
	private String discuss_commond;                            //评论内容
	private String discuss_time;                                //评论时间
	private String discuss_status;                             //评论发布状态0未发表 1发布
	public int getDiscuss_id() {
		return discuss_id;
	}
	public void setDiscuss_id(int discussId) {
		discuss_id = discussId;
	}
	public int getWorks_id() {
		return works_id;
	}
	public void setWorks_id(int worksId) {
		works_id = worksId;
	}
	public String getDiscuss_commond() {
		return discuss_commond;
	}
	public void setDiscuss_commond(String discussCommond) {
		discuss_commond = discussCommond;
	}
	public String getDiscuss_time() {
		return discuss_time;
	}
	public void setDiscuss_time(String discussTime) {
		discuss_time = discussTime;
	}
	public String getDiscuss_status() {
		return discuss_status;
	}
	public void setDiscuss_status(String discussStatus) {
		discuss_status = discussStatus;
	}
	private int discuss_info;
	public int getDiscuss_info() {
		return discuss_info;
	}
	public void setDiscuss_info(int discussInfo) {
		discuss_info = discussInfo;
	}
	
}
