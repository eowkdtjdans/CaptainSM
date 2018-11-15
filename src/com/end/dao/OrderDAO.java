package com.end.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.end.vo.OrderVO;
import com.end.vo.OrderIdVO;

public class OrderDAO {
	
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	/*ORDERS 테이블의 c_id기준으로 데이터 수 조회*/
	public static int countOrderList(String c_id) {
		return getSql().selectOne("countOrderList", c_id);
	}
	
	/*ORDERS 테이블의 c_id기준으로 데이터 전체조회*/
	public static List<OrderVO> selectOrderList(OrderVO orderVO) {
		return getSql().selectList("selectOrderList", orderVO);
	}
	
	/*ORDERS 테이블의 c_id기준으로 o_idx에 따라 데이터 하나조회*/
	public static List<OrderVO> selectOrderOne(String o_idx) {
		return getSql().selectList("selectOrderOne", o_idx);
	}
	
	/*ORDER_ID 테이블의 c_id기준으로 o_idx에 따라 데이터 하나조회*/
	public static List<OrderIdVO> selectOrderView(String o_idx) {
		return getSql().selectList("selectOrderView", o_idx);
	}
}
