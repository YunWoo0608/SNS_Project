package Service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import DAO.PageDAO;
import DAO.ReplyDAO;
import VO.PageVO;
import VO.ReplyVO;
import ibatis.MyAppSqlConfig;

public class ModifyService {
	private static ModifyService instance = new ModifyService();
	private ModifyService() { }
	public static ModifyService getInstance() { return instance; }
	
	//page 내용 수정
	public void modifyPage(PageVO vo)
			{
				SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
				
				PageDAO dao = PageDAO.getInstance();

				//mapper 예외처리
				try{
					dao.modifyPage(mapper, vo);
				}catch(SQLException e){
					System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
					e.printStackTrace();
				}
	}
		//reply 깊이 수정
		public void modifyDepth(int replyNO, int depth)
				{
					SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
					
					ReplyDAO dao = ReplyDAO.getInstance();
					HashMap<String, Integer> map = new HashMap<>();
					map.put("nReplyNO", replyNO);
					map.put("nDepth", depth);
					
					//mapper 예외처리
					try{
						dao.modifyDepth(mapper, map);
					}catch(SQLException e){
						System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
						e.printStackTrace();
					}
		}
		//댓글 부모 번호 수정 modifyPreReplyNO
		public void modifyPreReplyNO(int rePlyNO, int preReplyNO)
		{
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
			
			ReplyDAO dao = ReplyDAO.getInstance();
			HashMap<String, Integer> map = new HashMap<>();
			map.put("rePlyNO", rePlyNO);
			map.put("preReplyNO", preReplyNO);
			//mapper 예외처리
			try{
				dao.modifyPreReplyNO(mapper, map);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
}

}
