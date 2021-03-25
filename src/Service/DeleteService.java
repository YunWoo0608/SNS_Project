package Service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;

import DAO.MemberDAO;
import DAO.PageDAO;
import ibatis.MyAppSqlConfig;

public class DeleteService {
	private static DeleteService instance = new DeleteService();
	private DeleteService() { }
	public static DeleteService getInstance() { return instance; }
	
		//page 삭제
		public void deletePage(int pageNO)
		{
			SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
			
			PageDAO dao = PageDAO.getInstance();
			

			//mapper 예외처리
			try{
				dao.deletePage(mapper, pageNO);
			}catch(SQLException e){
				System.out.println("에러@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				e.printStackTrace();
			}
		}
		//댓글 삭제
}
