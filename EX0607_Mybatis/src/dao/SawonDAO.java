package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public SawonDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	public List<SawonVO> select() {
		// SQL을 요청할 sqlSession 객체 생성
		SqlSession sqlSession = factory.openSession();
		
		List<SawonVO> list = sqlSession.selectList("sawon.sawon_list");
		
		// conn, pstmt, rs를 close()하는 내용이 포함되어 있다.
		// 반드시 마지막에 닫아주어야 한다 ! 
		sqlSession.close();
		return list;
	}
	
	//부서별 사원 목록
	public List<SawonVO> select(int deptno) {
		// SQL을 요청할 sqlSession 객체 생성
		SqlSession sqlSession = factory.openSession();
		
		// 파라미터는 단 한개만 보낼 수 있음
		List<SawonVO> list = sqlSession.selectList("sawon.sawon_list_no",deptno);
		
		// conn, pstmt, rs를 close()하는 내용이 포함되어 있다.
		// 반드시 마지막에 닫아주어야 한다 ! 
		sqlSession.close();
		return list;
	}

}
