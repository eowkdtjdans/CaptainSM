package com.end.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.CustomerVO;
import com.end.vo.RCommentVO;
import com.end.vo.ReviewDataVO;


public class ReviewDAO {
	private static SqlSession ss;
	
	//싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	//게시판=========================================
	
	//전체 데이터 정렬 조회
	public static List<ReviewDataVO> getRangedList(Map<String, Integer> map) {
		return getSql().selectList("reviewRangedList", map);
	}
	
	
	//전체 데이터 조회
	public static List<ReviewDataVO> getList () {
		return getSql().selectList("reviewAll");
	}
	
	public static ReviewDataVO getOneList(String r_idx) {
		//List<GuestbookVO> list = getSql().selectOne("one", r_idx);
		return getSql().selectOne("reviewOne", r_idx);
		
	}
	
	public static int insert(ReviewDataVO vo) {
		int result = getSql().insert("reviewInsert", vo);
		getSql().commit(); //auto commit 상태가 아니므로 명시적 commit처리
		return result;
	}
	
	public static int insert2(ReviewDataVO vo) {
		int result = getSql().insert("reviewInsert2", vo);
		getSql().commit(); //auto commit 상태가 아니므로 명시적 commit처리
		return result;
	}

	public static int update(ReviewDataVO vo) {
		return getSql().update("reviewUpdate", vo);
		
	}
	
	public static int update2(ReviewDataVO vo) {
		return getSql().update("reviewUpdate2", vo);
	}

	public static void delete(String r_idx) {
		getSql().delete("reviewDelete", r_idx);
		getSql().commit();
	}
	
	public static int countAll() {
		return getSql().selectOne("reviewCountAll");
	}
	
	public static int countUp(ReviewDataVO vo) {
		return getSql().update("reviewCountUp", vo);
	}
	
	
	//댓글=======================================
	
	public static List<RCommentVO> getListC (String idx) {
		return getSql().selectList("reviewAllC", idx);
	}

	public static int insertC(RCommentVO vo) {
		int result = getSql().insert("reviewInsertC", vo);
		getSql().commit();
		return result;
	}

	public static RCommentVO getOneListC(String rc_idx) {
		return getSql().selectOne("reviewOneC", rc_idx);
	}

	public static int updateC(RCommentVO vo) {
		return getSql().update("reviewUpdateC", vo);
		
	}

	public static int updateC2(RCommentVO vo) {
		return getSql().update("reviewUpdateC2", vo);
	}
	
	public static void deleteC(String idx) {
		getSql().delete("reviewDeleteC", idx);
		getSql().commit();
	}


	//회원정보=======================================
	
	public static List<CustomerVO> allCus() {
		return getSql().selectList("reviewAllCus");
	}

}












