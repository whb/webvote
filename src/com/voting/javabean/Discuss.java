package com.voting.javabean;

import java.util.Date;

public class Discuss {

	private int discussId;
	private int worksId;
	private String discussCommond;
	private Date discussTime;
	
	
	public int getDiscussId() {
		return discussId;
	}
	public void setDiscussId(int discussId) {
		this.discussId = discussId;
	}
	public int getWorksId() {
		return worksId;
	}
	public void setWorksId(int worksId) {
		this.worksId = worksId;
	}
	public String getDiscussCommond() {
		return discussCommond;
	}
	public void setDiscussCommond(String discussCommond) {
		this.discussCommond = discussCommond;
	}
	public Date getDiscussTime() {
		return discussTime;
	}
	public void setDiscussTime(Date discussTime) {
		this.discussTime = discussTime;
	}
}
