package common;

public interface Values {

    String GRADE_GUEST="G";
    String GRADE_ADMIN="A";
    int VALUE_IN = 1;
    int VALUE_OUT = 2;
    
    // 로그인 상태값
    int login_fali_id = 1;
    int login_fail_pw = 2;
    int login_success = 3;
    
    // 페이지당 글의 개수
 	int CNT_PER_PAGE = 10;
 	int CNT_PER_PAGE_N = 3;
 	// 게시판 인디케이터의 개수
 	int BOARD_INDICATOR_CNT = 5;
 	// 게시판 타입
 	String NOTIC = "I";
 	String NEWS= "N";
 	// 삭제 상태
 	int DEL = 1;
 	int NON_DEL = 2;
 	
 	// 기부완료상태
  	String Result = "후원완료";
}
