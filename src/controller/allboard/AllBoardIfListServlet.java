package controller.allboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Values;
import service.allboard.AllBoardServiceImpl;
import service.allboard.AllBoardVo;

/**
 * Servlet implementation class AllBoardIfListServlet
 */
@WebServlet("/AllBoardIfListServlet")
public class AllBoardIfListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardIfListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		AllBoardServiceImpl ab = new AllBoardServiceImpl();
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		
		int pageCnt = ab.getPaging();
		request.setAttribute("page_cnt", pageCnt);

		String page_num_str = request.getParameter("page_num");
		int page_num = 1;
		if(page_num_str != null && page_num_str.length() > 0){
			page_num = Integer.parseInt(page_num_str);
		}
		// 페이지 번호가 페이지의 개수보다 클 경우
		if(page_num > pageCnt){
			page_num = pageCnt;
		}
		ArrayList<AllBoardVo> ablist = ab.getAllBoardList(keyField, keyWord,page_num);
		request.setAttribute("ablist", ablist);
		// 페이지의 개수가 인디케이터의 개수보다 작을 경우를 위해..
		
	 	int indi_middle = Values.BOARD_INDICATOR_CNT / 2 + 1;
	 	int indi_min = 1;
	 	int indi_max = Values.BOARD_INDICATOR_CNT;
	 					
	 	// 마지막 페이지 - 중간값
	 	if(pageCnt - indi_middle < page_num){
	 		indi_max = pageCnt;
	 		indi_min = pageCnt - Values.BOARD_INDICATOR_CNT + 1;	
	 	} else if(page_num <= indi_middle){
	 		indi_min = 1;
	 		indi_max = Values.BOARD_INDICATOR_CNT;
	 	} else {
	 		indi_min = (page_num - (indi_middle - 1));
	 		indi_max = indi_min + Values.BOARD_INDICATOR_CNT - 1 ;
	 	}
	 			
	 	// 총 페이지 수가 인디케이터 개수보다 적을 경우
	 	if(pageCnt < Values.BOARD_INDICATOR_CNT){
	 		indi_min = 1;
	 		indi_max = pageCnt;
	 	}
	 	request.setAttribute("indi_min", indi_min);
	 	request.setAttribute("indi_max", indi_max);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}