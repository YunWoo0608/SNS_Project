package Service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import DAO.MemberDAO;
import DAO.PageDAO;
import DAO.ReplyDAO;
import Service.SelectService;
import VO.MemberVO;
import VO.PageList;
import VO.PageVO;
import VO.ReplyList;
import VO.ReplyVO;
import ibatis.MyAppSqlConfig;

public class SelectService {

	private static SelectService instance = new SelectService();
	private SelectService() { }
	public static SelectService getInstance() { return instance; }
	
	//ID주고 name 얻어오기
	public String getMemberID(String nID){
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		MemberDAO dao = MemberDAO.getInstance();
		//mapper 예외처리
		try{
			return dao.selectGuest(mapper, nID).get(0).getsName();
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		return null;
	}
	//ID와 PW로 DB와 비교
	public Boolean CompareTo_ID_PW(String nID, String nPW)
	{
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("nID", nID);
		map.put("nPW", nPW);

		//mapper 예외처리
		try{
			return dao.boolGuest(mapper, map);
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		return false;
	}
	
	//ID만으로 있나없나 확인
	public Boolean CompareTo_ID(String nID)
	{
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
		MemberDAO dao = MemberDAO.getInstance();

		//mapper 예외처리
		try{
			return dao.boolGuest(mapper, nID);
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		return false;
	}
	//ID로 Page 조회
	public PageList getPageList(String nID)
	{	
		//mapper얻기
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
	
		PageList list = new PageList();		
		
		PageDAO dao = PageDAO.getInstance();
		
		//mapper 예외처리
		try{
			//ID로 Page 조회
			list.setPageList(dao.selectPage(mapper, nID));
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//현재 페이지 번호와 끝 페이지 번호를 이용해서 Page List로 가져오기
	public PageList getPageList(String nID, int currentPage, int endPage)
	{	
		//mapper얻기
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
	
		PageList list = new PageList();		
		
		PageDAO dao = PageDAO.getInstance();
		
		//mapper 예외처리
		try{

			HashMap<String, Integer> hmap = new HashMap<>();
			hmap.put("startNo", currentPage);
			hmap.put("endNo", endPage);
			
			list.setPageList(dao.selectPage(mapper, hmap));
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//page번호 주고 댓글 가져오기
	public ReplyList getReplyList(int pageNO){
		//mapper얻기
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
	
		ReplyList list = new ReplyList();		
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		//mapper 예외처리
		try{
			list.setReplyList(dao.selectReply(mapper, pageNO));
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//댓글의 참조 id주고 이름 얻어오기
	public String getReplyName(String replyID) throws SQLException{
		//mapper얻기
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
				
		
		ReplyDAO dao = ReplyDAO.getInstance();
		
		try{
			return dao.getReplyName(mapper,replyID);
		}catch(SQLException e){
			System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//댓글의 번호주고 깊이 얻어오기
		public int selectReplyDepth(int depth) throws SQLException{
			//mapper얻기
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
					
			
			ReplyDAO dao = ReplyDAO.getInstance();
			
			try{
				return dao.selectReplyDepth(mapper,depth);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
			
			return 0;
		}
		
		
		//댓글 번호 주고 부모 댓글 번호 얻어오기
		public int selectReply_PreNO(int preReplyNO) throws SQLException{
			//mapper얻기
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
					
			
			ReplyDAO dao = ReplyDAO.getInstance();
			
			try{
				return dao.selectReply_PreNO(mapper,preReplyNO);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
			
			return 0;
		}
}
	
