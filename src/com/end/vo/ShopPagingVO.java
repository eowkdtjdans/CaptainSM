package com.end.vo;

public class ShopPagingVO {

	
		//전체 게시물 수
		private int total = 0;
		
		//페이지당 게시물 수
		private int pagePer = 3;
		
		//페이지 수
		private int page = 0;
		
		//현재 페이지
		private int nowPage = 1;
		
		//현재 블록
		private int nowBlock = 1;
		
		//시작번호
		private int begin = 0;
		
		//끝번호
		private int end = 0;
		
		//블록당 표시할 페이지 갯수
		private int blockPer = 3;
		
		//시작페이지, 끝페이지
		private int beginPage = 0;
		private int endPage = 0;
		
		//페이지 수 구하기
		public void calPage() {
			page = total/pagePer;
			if(total%pagePer != 0) page++;
		}
		
		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public int getPagePer() {
			return pagePer;
		}

		public void setPagePer(int pagePer) {
			this.pagePer = pagePer;
		}

		public int getPage() {
			return page;
		}

		public void setPage(int page) {
			this.page = page;
		}

		public int getNowPage() {
			return nowPage;
		}

		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}

		public int getBegin() {
			return begin;
		}

		public void setBegin(int begin) {
			this.begin = begin;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}

		public int getBlockPer() {
			return blockPer;
		}

		public void setBlockPer(int blockPer) {
			this.blockPer = blockPer;
		}
		
		public int getBeginPage() {
			return beginPage;
		}

		public void setBeginPage(int beginPage) {
			this.beginPage = beginPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		
		public int getNowBlock() {
			return nowBlock;
		}

		public void setNowBlock(int nowBlock) {
			this.nowBlock = nowBlock;
		}

		@Override
		public String toString() {
			return "PagingVO [total=" + total + ", pagePer=" + pagePer + ", page=" + page + ", nowPage=" + nowPage
					+ ", begin=" + begin + ", end=" + end + ", blockPer=" + blockPer + ", beginPage=" + beginPage
					+ ", endPage=" + endPage + "]";
		}

		
		
		
}
