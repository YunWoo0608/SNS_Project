package Service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import DAO.MemberDAO;
import DAO.PageDAO;
import DAO.ReplyDAO;
import VO.MemberVO;
import VO.PageVO;
import VO.ReplyVO;
import ibatis.MyAppSqlConfig;

public class WriteService {

	private static WriteService instance = new WriteService();
	private WriteService() { }
	public static WriteService getInstance() { return instance; }
	
	//DB에 회원 정보 쓰기
	public void writeMeber(String sID, String sPW, String sName, String sEmail){
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberVO vo = new MemberVO();
		vo.setsEmail(sEmail);
		vo.setsMID(sID);
		vo.setsName(sName);
		vo.setsPW(sPW);
		
		//mapper 예외처리
		try{
			dao.insertGuest(mapper, vo);
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
	}
	//DB에 리플 쓰기
	public void writeReply(ReplyVO vo) {
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		//mapper 예외처리
		try{
			dao.writeReply(mapper, vo);
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
	}
		//DB에 리플 쓰기
		public void writeReply_r(ReplyVO vo) {
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
			
			ReplyDAO dao = ReplyDAO.getInstance();
			
			//mapper 예외처리
			try{
				dao.writeReply_r(mapper, vo);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
		}
	//DB에 페이지 쓰기
		public void writePage(PageVO vo) {
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
			
			PageDAO dao = PageDAO.getInstance();
			
			//mapper 예외처리
			try{
				dao.writePage(mapper, vo);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
		}
}
