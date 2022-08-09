package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	// 전역변수 영역
	DataSource ds;
	
	// 생성자
	public DBService() {
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
			
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}//생성자
	
	// 생성자에서 준비해둔 정보를 기반으로 DB에 연결
	public Connection getConnection() {
		Connection conn = null;
		try {
			// 혹시라도 쿼리문이 잘못되거나 오라클 아이디/비밀번호가 잘못되는 경우
			// catch로 보내서 잡아주어야 하기 때문
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn; // conn=null이면 연결이 안된 것. null이 아닐 경우 연결 성공!
	}

}
