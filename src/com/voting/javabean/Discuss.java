package com.voting.javabean;

import java.util.Date;

import com.voting.util.Constant;

public class Discuss {
	private int discussId;
	private int worksId;
	private String discussCommond;
	private Date discussTime;
	private String discussUsername;
	private String discussIp;

	// Virtual Property
	public String getDiscussTimeString() {
		return Constant.TIME_FORMAT.format(getDiscussTime());
	}
	
	public String getNational() {
		return National.parse(getDiscussIp());
	}
	
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

	public String getDiscussUsername() {
		return discussUsername;
	}

	public void setDiscussUsername(String discussUsername) {
		this.discussUsername = discussUsername;
	}

	public String getDiscussIp() {
		return discussIp;
	}

	public void setDiscussIp(String discussIp) {
		this.discussIp = discussIp;
	}
}
