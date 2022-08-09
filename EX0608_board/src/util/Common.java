package util;

public class Common {
	//내부클래스
	
	//일반 게시판용
	public static class Board{
		//한 페이지에 보여줄 수 있는 게시물 수
		public final static int BLOCKLIST=10;
		
		//Common.Board.BLOCKLIST 로 호출해서 사용 가능
		
		// 페이지 메뉴 수 >> 총 글 수에 맞게 설정
		// <- 1 2 3 ->
		public final static int BLOCKPAGE=5;
		
	}
	
	//공지사항 게시판용
	public static class Notice{
		//Common.Notice.BLOCKLIST 로 호출해서 사용 가능
		public final static int BLOCKLIST=20;
		
		public final static int BLOCKPAGE=5;
	}

}
