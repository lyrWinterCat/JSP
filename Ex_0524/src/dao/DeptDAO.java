package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.DeptVO;

public class DeptDAO {
	// DAO (Data Acccess Object): DB 접속을 목적으로 하는 클래스
	// Singleton 생성
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	// 1. 내가 첫번째로 지정해야 할 것
	// List 안에 만들어놓은 VO값 넣어서 설정
	public List<DeptVO> selectList() {

		List<DeptVO> list = new ArrayList<DeptVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 2. 쿼리문 작성
		String sql = "select * from dept";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DeptVO vo = new DeptVO();
				//현재레코드값=>Vo저장
				
				// 3. list에 add 해줄 값 설정
	    		vo.setDeptno(rs.getInt("deptno"));
	    		vo.setDname(rs.getString("dname"));
	    		vo.setLoc(rs.getString("loc"));

				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

}
