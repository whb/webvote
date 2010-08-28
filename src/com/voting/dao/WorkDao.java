package com.voting.dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.voting.javabean.Discuss;
import com.voting.javabean.Work;


public class WorkDao {

	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}


	public Work findWork(String workId){
		String sql = "select works_id, works_title, works_author,works_file_name,works_release_time, works_recommond, works_type from works_info where works_id=?";
		
		RowMapper<Work> mapper = new RowMapper<Work>() {
			public Work mapRow(ResultSet rs, int rowNum) throws SQLException {
				Work work = new Work();
				work.setWorkId(rs.getInt("works_id"));
				work.setWorkTitle(rs.getString("works_title"));
				work.setWorkAuthor(rs.getString("works_author"));
				work.setWorkFileName(rs.getString("works_file_name"));
				work.setWorkReleaseTime(rs.getDate("works_release_time"));
				work.setWorksRecommond(rs.getString("works_recommond"));
				work.setWorkType(rs.getString("works_type"));
				return work;
			}
		};
		
		return this.jdbcTemplate.queryForObject(sql, mapper, workId);
	}
	

	public int findTotalCount(String type) {
		String sql = "select count(*) from works_info where works_type=?";
		return this.jdbcTemplate.queryForInt(sql, type);
	}	

	
	public List<Work> findWorks(String type, int startLineNo, int step){
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT works.works_id as 'works_id', works.works_title as 'works_title', works.works_author as 'works_author',works.works_file_name as 'works_file_name',works.works_release_time as 'works_release_time', count(vote_info.vote_id) as 'count', works.works_type as 'works_type'")
			.append(" from")
			.append(" (select works_id, works_title, works_author,works_file_name,works_release_time,works_type from works_info where works_info.works_type = ?) works")
			.append(" left join vote_info on vote_info.works_id = works.works_id GROUP BY works.works_id order by count desc, works.works_release_time desc")
			.append(" limit ?,?");
		
		
		RowMapper<Work> mapper = new RowMapper<Work>() {
			public Work mapRow(ResultSet rs, int rowNum) throws SQLException {
				Work work = new Work();
				work.setWorkId(rs.getInt("works_id"));
				work.setWorkTitle(rs.getString("works_title"));
				work.setWorkAuthor(rs.getString("works_author"));
				work.setWorkFileName(rs.getString("works_file_name"));
				work.setWorkReleaseTime(rs.getDate("works_release_time"));
				work.setWorkType(rs.getString("works_type"));
				work.setVoteCount(rs.getInt("count"));
				return work;
			}
		};
		
		List<Work> works = this.jdbcTemplate.query(sql.toString(), mapper, type, startLineNo, step);
		return works;
	}


	public int saveVotes(HashMap<String, String>voteInfosMap, String ip) {
	
		String sql = "insert into vote_info (works_id, vote_ip) values(?, ?)";
		
		int count = 0;
		Iterator<String> it = voteInfosMap.keySet().iterator();
		while(it.hasNext()){
			count += this.jdbcTemplate.update(sql, it.next(), ip);
		}
        return count;
	}


	public int findVoteTime(String ip) {
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) from")
				.append(" (select MAX(vote_time) as max_vote_time from vote_info where vote_ip = ?) max")
				.append(" where DATE_ADD(max.max_vote_time, INTERVAL 3 MINUTE) > now()");
		
		return this.jdbcTemplate.queryForInt(sql.toString(), ip);
	}


	public List<Discuss> findDisusses(String workId) {
		
		String sql = "select discuss_commond, discuss_time from discuss_info where discuss_status='1' and works_id=?";
		RowMapper<Discuss> mapper = new RowMapper<Discuss>() {
			public Discuss mapRow(ResultSet rs, int rowNum) throws SQLException {
				Discuss discuss = new Discuss();
				discuss.setDiscussCommond(rs.getString("discuss_commond"));
				discuss.setDiscussTime(rs.getDate("discuss_time"));
				return discuss;
			}
		};
		return  this.jdbcTemplate.query(sql, mapper, workId);
	}


	public int saveDisuss(String workId, String discussCommond) {
		String sql = "insert into discuss_info (works_id, discuss_commond) values(?, ?)";

		return this.jdbcTemplate.update(sql, workId, discussCommond);
	}


	public List<Work> findVideoUrl(int workId) {
		String sql = "select video_url from video_info where works_id = ?";
		RowMapper<Work> mapper = new RowMapper<Work>() {
			public Work mapRow(ResultSet rs, int rowNum) throws SQLException {
				Work work = new Work();
				work.setVideoUrl(rs.getString("video_url"));
				return work;
			}
		};
		return this.jdbcTemplate.query(sql,mapper , workId);
	}

}
