package com.end.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.CustomerVO;

public class CustomerDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	//회원 가입
	public static int Customerinsert(CustomerVO vo) {
		int result = getSql().insert("Customerinsert", vo);
		getSql().commit();
		return result;
	}
	
	public static List<CustomerVO> CustomergetList() {
		return getSql().selectList("Customerall");
	}
		
	//로그인
	public static CustomerVO CustomergetDB(String c_id) {
		//System.out.println(vo);
		CustomerVO result = getSql().selectOne("Customerlogin", c_id);
		return result;
	}
	
	//아이디 중복확인
	public static List<CustomerVO> CustomeridChk(CustomerVO vo) {
		List<CustomerVO> list = getSql().selectOne("Customeridchk", vo);
		
		return list;
	}
	
	//관리자페이지 회원정보 전체 조회
	public static List<CustomerVO> AdminSearch(Map<String, Integer> map) {
		return getSql().selectList("Adminsearch", map);
	}
	
	//회원 삭제
	public static int AdminDelete(String c_id) {
		return getSql().delete("Admindelete", c_id);
	}
	//아이디 찾기
	public static CustomerVO CustomerFindId(String c_name) {
		return getSql().selectOne("CustomerFindId", c_name);
	}	
	//비밀번호 찾기
	public static CustomerVO CustomerFindPwd(String c_id) {
		return getSql().selectOne("CustomerFindPwd", c_id);
	}

}
