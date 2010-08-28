package com.voting.javabean;

public class Works_info {
	
	private int works_id;                                        //作品ID
	private String works_title;                            //作品名称标题
	private String works_author;                           //作者
	private String works_recommond ;                       //作品介绍
	private String works_file_name;                        //作品文件名(图片名)
	private String works_type;                             //作品类型
	private String works_release_time;                     //作品发布时间
	private String works_addr;   
	public int getWorks_id() {
		return works_id;
	}
	public void setWorks_id(int worksId) {
		works_id = worksId;
	}
	public String getWorks_addr() {
		return works_addr;
	}
	public void setWorks_addr(String worksAddr) {
		works_addr = worksAddr;
	}
	
	public String getWorks_title() {
		return works_title;
	}
	public void setWorks_title(String worksTitle) {
		works_title = worksTitle;
	}
	public String getWorks_author() {
		return works_author;
	}
	public void setWorks_author(String worksAuthor) {
		works_author = worksAuthor;
	}
	public String getWorks_recommond() {
		return works_recommond;
	}
	public void setWorks_recommond(String worksRecommond) {
		works_recommond = worksRecommond;
	}
	public String getWorks_file_name() {
		return works_file_name;
	}
	public void setWorks_file_name(String worksFileName) {
		works_file_name = worksFileName;
	}
	public String getWorks_type() {
		return works_type;
	}
	public void setWorks_type(String worksType) {
		works_type = worksType;
	}
	public String getWorks_release_time() {
		return works_release_time;
	}
	public void setWorks_release_time(String worksReleaseTime) {
		works_release_time = worksReleaseTime;
	}

}
