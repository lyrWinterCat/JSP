package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.DeptVO;

public class DeptDAO {
	
	// 1. factory 생성
	SqlSessionFactory factory;
	
	// 2. singleton 생성
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	// 3. 기본생성자
	public DeptDAO() {
		//connector에서 factory가 db에 접근할 수 있는 내용(mapconfig파일)을 알고있다고 했음.
		// 해당 factory를 호출해서 사용하기
		factory = MyBatisConnector.getInstance().getFactory();
	}
	// -------------------------------여기까지 DAO 기본 생성
	
	//부서테이블 조회
	public List<DeptVO> select(){
		//SqlSession : DB에 쿼리문을 실제로 요청하는 객체
		
		//factory는 db까지 가는 길을 알고 있음
		//SqlSession은 DB에 쿼리문을 요청할 수 있음 (DB접근)
		// 두 개가 합쳐져서 DB에서 정보를 가져올 수 있음
		SqlSession sqlSession = factory.openSession();
		
		// DB접근을 통해 얻어온 결과를 list에 저장
		// sqlSession.selectList("여기 들어갈 값이 중요. dept.xml에서 만들어 준 값")
		List<DeptVO> list = sqlSession.selectList("dept.dept_list");
		
		//DB접근을 위해 사용한 sqlSession은 마지막에 꼭 닫아주어야 함
		sqlSession.close();
		
		return list;
		
	}

}
