package com.end.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.DogVO;

public class DogDAO {
	
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	/*DB의 DOG테이블의 데이터 갯수 조회*/
	public static int countDogList() {
		return getSql().selectOne("countDogList");
	}
	
	/*DB의 DOG테이블의 데이터 전체 조회*/
	public static List<DogVO> selectAllDog(Map<String, Integer> map) {
		return getSql().selectList("selectAllDog", map);
	}
	
	/*DB의 DOG테이블의 D_TYPE 데이터 전체 조회*/
	public static List<DogVO> selectDogType() {
		return getSql().selectList("selectDogType");
	}
	
	/*DB의 DOG테이블의 D_TYPE 데이터 수 조회*/
	public static int cntDogType(String d_type) {
		return getSql().selectOne("cntDogType", d_type);
	}
	
	/*DB의 DOG테이블에서 D_IDX를 통해 하나의 데이터 조회*/
	public static List<DogVO> selectDogView(String idx) {
		return getSql().selectList("selectDogView", idx);
	}
	
	/*DB의 DOG테이블에서 D_TYPE을 통해 데이터 전체조회*/
	public static List<DogVO> selectDogCategory(DogVO vo) {
		return getSql().selectList("selectDogCategory", vo);
	}
	
	/*DB의 ORDERS 테이블에서 로그인한 유저의 주문 데이터의 수 조회*/
	public static void dogListWrite(DogVO dvo) {
		getSql().insert("dogListWrite", dvo);
	}
}
