package service.allboard;

import java.util.ArrayList;

public interface AllBoardService {

    AllBoardVo getAllBoard(int abidx);
    int updateAllBoardHit(int abidx);
    int getPaging(String abtype);
//	ArrayList<AllBoardVo> getAllBoardList(String abtype, String keyField, String keyWord);
	ArrayList<AllBoardVo> getAllBoardList(String keyField, String keyWord);
}
