package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.PageVO;

public class PageDAO {
	//싱글톤 사용
	private static PageDAO instance = new PageDAO();
	private PageDAO(){}
	public static PageDAO getInstance() { return instance;}
	
	//ID를 주고 Page List로 가져오기
	public List<PageVO> selectPage(SqlMapClient mapper, String nID) throws SQLException{
		return mapper.queryForList("selectPage_ID",nID);
	}
	//현재 페이지 번호를 이용해서 Page List로 가져오기
	public List<PageVO> selectPage(SqlMapClient mapper, HashMap<String, Integer> map) throws SQLException{
		return mapper.queryForList("selectPage_INT_INT", map);
	}
	
	//페이지 번호주고 삭제
	public void deletePage(SqlMapClient mapper, int pageNO) throws SQLException{
		mapper.insert("deletePage",pageNO);
	}
	//페이지 번호 주고 수정
	public void modifyPage(SqlMapClient mapper, PageVO vo) throws SQLException{
		mapper.insert("modifyPage",vo);
	}
	
	//글 쓰기
	public void writePage(SqlMapClient mapper, PageVO vo) throws SQLException{
		mapper.insert("writePage",vo);
	}
}
