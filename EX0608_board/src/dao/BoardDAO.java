package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public BoardDAO() {
		factory=MyBatisConnector.getInstance().getFactory();
	}
	
	//게시판 목록 조회 (전체조회)
//	public List<BoardVO> selectList(){
//		SqlSession sqlSession = factory.openSession();
//		List<BoardVO> list = sqlSession.selectList("b.board_list");
//		
//		sqlSession.close();
//		return list;
//	}
	
	//페이지 번호에 맞는 게시판 목록 조회
	public List<BoardVO> selectList(HashMap<String, Integer> map) {
		SqlSession sqlSession = factory.openSession();
		List<BoardVO> list = sqlSession.selectList("b.board_list",map);
		
		sqlSession.close();
		return list;
	}
	
	//전체 게시물 수 조회
	public int getRowTotal() {
		SqlSession sqlSession = factory.openSession();
		int count=sqlSession.selectOne("b.board_count");
		sqlSession.close();
		return count;
	}
	
	
	
	// 게시글 작성
	public int insert(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true); //true:자동커밋
		int res=sqlSession.insert("b.board_insert", vo);
		sqlSession.close();
		return res;
		
	}
	
	//한가지 글 조회
	public BoardVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		BoardVO vo = sqlSession.selectOne("b.board_one",idx);
		sqlSession.close();
		return vo;
	}
	
	//조회수 증가
	public int update_readhit(int idx) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.update("b.update_readhit",idx);
		sqlSession.close();
		return res;
	}
	
	//댓글 추가를 위한 step+1
	public int update_step(BoardVO vo) {
		SqlSession sqlSession=factory.openSession(true);
		int res=sqlSession.update("b.board_update_step",vo);
		sqlSession.close();
		return res;
	}
	
	//댓글 추가
	public int reply(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res=sqlSession.insert("b.board_reply",vo);
		sqlSession.close();
		return res;
	}
	
	//게시글 삭제(가 된 것처럼  update해주기)
	public int del_update(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res=sqlSession.update("b.del_update",vo);
		return res;
	}


}
