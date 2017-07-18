package common;

public interface Values {

    String grade_guest="G";
    String grade_admin="A";
    String value_in = "IN";
    
    // 로그인 상태값
    int login_fali_id = 1;
    int login_fail_pw = 2;
    int login_success = 3;
    
    // 페이지당 글의 개수
 	int CNT_PER_PAGE = 10;
 	// 게시판 인디케이터의 개수
 	int BOARD_INDICATOR_CNT = 5;
 	
 	// 삭제 상태
 	int DEL = 1;
 	int NON_DEL = 2;
 	
 	// 기부완료상태
  	String Result = "후원완료";
}
