package com.end.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.QuestionVO;
import com.end.vo.QcommentVO;

public class QuestionDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}

	public static List<QuestionVO> QuestionGetList(Map<String, Integer> map) {
		return getSql().selectList("questionList",map);
	}
	
	public static int QuestionGetTotalCount() {
		int totalCount = getSql().selectOne("questionTotalCount");
		return totalCount;
	}
	
	public static int QuestionInsert(QuestionVO vo) {
		return getSql().insert("questionInsert", vo);
	}
	
	public static QuestionVO QuestionOneList(String vo) {
		return getSql().selectOne("questionOne", vo);
	}

	public static int QuestionUpdate(QuestionVO vo) {
		return getSql().update("questionUpdate", vo);
		
	}
	
	public static int QuestionInsert2(QcommentVO qvo) {
		return getSql().insert("questionInsert2", qvo);
	}
	
	public static List<QcommentVO> QuestionOneList2(Map<String, Integer> map) {
		return getSql().selectList("questionOne2", map);
	}
	
	public static int QuestionCommentCount(String q_idx) {
		return getSql().selectOne("questionCommentcount", q_idx);
	}
	
	public static QcommentVO QuestionCommentOne(String qvo) {
		return getSql().selectOne("questionCommentone", qvo);
	}
	
	public static int QuestionCommentUpdate(QcommentVO qvo) {
		return getSql().update("questionCommentupdate", qvo);
	}
	
	public static int QuestionCommentDelete(String qc_idx) {
		return getSql().delete("questionCommentdelete", qc_idx);
	}
	
	public static int QuestionCommentDeleteAll(String q_idx) {
		return getSql().delete("questionCommentdeleteall", q_idx);
	}
	
	public static int QuestionDelete(String q_idx) {
		return getSql().delete("questionDelete", q_idx);
	}

	
}












