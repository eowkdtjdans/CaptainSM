package com.end.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.ShopCartVO;
import com.end.vo.ShopOrderVO;
import com.end.vo.ShopVO;

public class ShopDAO {
	private static SqlSession ss;
	
	//싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	//전체 데이터 조회
	public static int getTotal(String category) {
		return getSql().selectOne("total",category);
	}
	
	//게시글 데이터 가져오기
	public static List<ShopVO> getData(Map<String,String> map) {
		return getSql().selectList("data",map);
	}
	
	public static ShopVO get_one(String p_name) {
		ShopVO vo = getSql().selectOne("one",p_name);
		return vo;
	}
	
	public static String get_name(String name) {
		return getSql().selectOne("name",name);
	}
	
	public static ShopCartVO get_one1(String p_name) {
		ShopCartVO vo = getSql().selectOne("one1",p_name);
		return vo;
	}
	
	//카트 데이터 조회(아이디값을 이용)
	public static List<ShopCartVO> get_all(String c_id) {
		return getSql().selectList("search",c_id);
	}
	
	//카트에 데이터 입력
	public static int insertO(ShopCartVO cvo) {
		return getSql().insert("insertO", cvo);
	}
	
	//카트에 데이터 삭제
	public static void deleteO(ShopCartVO cvo) {
		getSql().delete("deleteO", cvo);
		getSql().commit();
	}
	
	//카트에 데이터 수량 변경
	public static int updateO(ShopCartVO cvo) {
		return getSql().update("updateO", cvo);
	}
	//카트에 데이터 수량 변경(동일제품존재시)
	public static int updateOO(ShopCartVO cvo) {
		return getSql().update("updateOO", cvo);
	}
	
	//주문완료 데이터 입력(주문자제품정보) 카트제품구매시
	public static void insert_item(ShopCartVO pvo) {
		getSql().insert("insert_item", pvo);
	}
	//단일제품구매시
	public static void insert_item(ShopVO pvo) {
		getSql().insert("insert_item", pvo);
	}
	
	//주문완료 데이터 입력(주문자정보)
	public static void insert_cart(ShopOrderVO ovo) {
		getSql().insert("insert", ovo);
	}
	
	//관련상품 조회
	public static List<ShopVO> get_related(String category) {
		return getSql().selectList("related",category);
	}
	
	//제품이름과 카테고리로 게시물 수 검색
	public static int getTotal2(Map<String, String> map) {
		return getSql().selectOne("fullnameList",map);
	}

	//게시글 데이터 가져오기(검색으로)
	public static List<ShopVO> getData2(Map<String,String> map) {
		System.out.println("getData2: " + map);
		return getSql().selectList("data2",map);
	}
	
	
	//결제완료후 카트 비우기
	public static int payOk(String c_id) {
		return getSql().delete("payOk", c_id);
	}
}
