package com.voting.javabean;

public class Discuss_info_bean {
    private int discuss_id;
    private int works_id;
    private String discuss_commond;
    private String discuss_time;
    private String discuss_status;
    public int getDiscuss_id() {
        return discuss_id;
    }

    public int getWorks_id() {
        return works_id;
    }

    public String getDiscuss_commond() {
        return discuss_commond;
    }

    public String getDiscuss_time() {
        return discuss_time;
    }

    public String getDiscuss_status() {
        return discuss_status;
    }

    public void setDiscuss_id(int discuss_id) {
        this.discuss_id = discuss_id;
    }

    public void setWorks_id(int works_id) {
        this.works_id = works_id;
    }

    public void setDiscuss_commond(String discuss_commond) {
        this.discuss_commond = discuss_commond;
    }

    public void setDiscuss_time(String discuss_time) {
        this.discuss_time = discuss_time;
    }

    public void setDiscuss_status(String discuss_status) {
        this.discuss_status = discuss_status;
    }
}
