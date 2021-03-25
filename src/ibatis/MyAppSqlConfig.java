package ibatis;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MyAppSqlConfig {
	private static final SqlMapClient sqlMap;
	static {	// 초기화 블록
		// final로 선언된 변수는 프로그램에서 값을 변경할 수 없는 상수로 선언시 반드시 초기화를 시켜야 한다.
		// final로 선언된 변수를 초기화 할 때 2줄 이상이 필요하면 static { ~ } 사이의 초기화 블록에서 초기화 시킨다.
		try {
			String resource = "ibatis/SqlMapConfig.xml";				// 환경 설정 파일의 경로
			String test = null;
			
			Reader reader = Resources.getResourceAsReader(resource);	// 환경 설정 파일을 읽어들인다.
			
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);		// 읽어들인 환경으로 매퍼를 얻어낸다.
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException ("Error : " + e);
		}
	}
	public static SqlMapClient getSqlMapInstance(){
		return sqlMap;
	}
}
