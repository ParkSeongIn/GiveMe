package service.allboard;

import java.util.ArrayList;

public interface AllBoardService {

    AllBoardVo getAllBoard(int abidx);
    int updateAllBoardHit(int abidx);
    int getPaging();
    int getPaging1();
	ArrayList<AllBoardVo> getAllBoardList(String keyField, String keyWord, int page_num);
	ArrayList<AllBoardVo> getAllBoardMainList();
}
