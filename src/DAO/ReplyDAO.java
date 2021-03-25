package DAO;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.ReplyVO;

public class ReplyDAO {
		//싱글톤 사용
		private static ReplyDAO instance = new ReplyDAO();
		private ReplyDAO(){}
		public static ReplyDAO getInstance() { return instance;}
		
		//페이지 번호 주고 리플 리스트 얻어오기
		public List<ReplyVO> selectReply(SqlMapClient mapper, int replyNO) throws SQLException{
			return mapper.queryForList("selectReply",replyNO);
		}
		
		//리플 번호 주고 리플에서 이름 얻어오기
		public String getReplyName(SqlMapClient mapper, String replyID) throws SQLException{
			return (String)mapper.queryForObject("getReplyName",replyID);
		}
		//리플 쓰기
		public void writeReply(SqlMapClient mapper, ReplyVO vo) throws SQLException{
			mapper.insert("writeReply",vo);
		}	
		//리플 쓰기
		public void writeReply_r(SqlMapClient mapper, ReplyVO vo) throws SQLException{
			mapper.insert("writeReply_r",vo);
		}
		//리플 depth 수정
		public void modifyDepth(SqlMapClient mapper, HashMap<String, Integer> map) throws SQLException{
			mapper.insert("modifyDepth",map);
		}
		//리플 depth 얻기
		public int selectReplyDepth(SqlMapClient mapper, int depth) throws SQLException{
			return (int) mapper.queryForObject("selectReplyDepth",depth);
		}
		//리플 부모댓글번호 얻기
		public int selectReply_PreNO(SqlMapClient mapper, int preReplyNO) throws SQLException{
			return (int) mapper.queryForObject("selectReply_PreNO",preReplyNO);
		}	
		//리플 부모 댓글번호 수정
		public void modifyPreReplyNO(SqlMapClient mapper, HashMap<String,Integer> map) throws SQLException{
			mapper.insert("modifyPreReplyNO",map);
		}	
}
