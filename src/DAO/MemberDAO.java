package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.MemberVO;
import VO.PageVO;

//Guest 객체 접근 방식 정의
public class MemberDAO {
	//싱글톤 사용
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO(){}
	public static MemberDAO getInstance() { return instance;}
	//회원 삽입
	public void insertGuest(SqlMapClient mapper, MemberVO vo) throws SQLException {
		mapper.insert("insertMember",vo);
	}
	//삭제
	public void DeleteGuest(SqlMapClient mapper, String nID) throws SQLException{
		mapper.insert("DeletMember",nID);
	}
	//ID 주고 guestVO 얻기
	public ArrayList<MemberVO> selectGuest(SqlMapClient mapper, String nID) throws SQLException{
		return (ArrayList<MemberVO>)mapper.queryForList("selectMember",nID);
	}
	//ID PW주고 DB에 존재 여부
	public Boolean boolGuest(SqlMapClient mapper, Map<String, String> map) throws SQLException{
		
		if(mapper.queryForObject("selectMember_ID_PW", map) != null){
			return true;
		}
		else{
			return false;
		}						
	}
	
	//ID만 주고 DB 존재여부
	public Boolean boolGuest(SqlMapClient mapper, String nID) throws SQLException{
		
		if(mapper.queryForObject("selectMember_ID", nID) != null){
			return true;
		}
		else{
			return false;
		}						
	}
}
