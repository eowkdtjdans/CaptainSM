package com.end.vo;

public class ReviewPagingVO {
	private int plus = 1;
	private int nowPage = 1;//현재페이지
	private int nowBlock = 1;//현재블록
	
	private int postEaPerP = 10;//하나의 페이지에 게시글 갯수
	private int pageEaPerB = 3;//블록당 표시하는 페이지 갯수
	
	private int totalPost = 0;//총 게시물의 갯수(원본 게시글 수)
	private int totalPage = 0;//전체 페이지 갯수
	private int totalBlock = 0;//전체 블록의 갯수
	
	private int fPostNumAtPage;//현재 페이지상의 시작 글번호(동적생성 row번호)
	private int lPostNumAtPage;//현재 페이지상의 끝 글번호(동적생성 row번호)
	
	private int fPageNumAtBlock;//현재 블록의 시작 페이지 번호
	private int lPageNumAtBlock;//현재 블록의 끝 페이지 번호
	
	
	
	public int getPlus() {
		return plus;
	}

	public void setPlus(int plus) {
		this.plus = plus;
	}

	public void setTotalPage() {
		this.totalPage = (totalPost / postEaPerP);
		if (totalPost % postEaPerP != 0) this.totalPage++;
	}
	
	public void setTotalBlock() {
		this.totalBlock = (totalPage / pageEaPerB);
		if (totalPage % pageEaPerB != 0) this.totalBlock++;
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getpostEaPerP() {
		return postEaPerP;
	}

	public void setpostEaPerP(int postEaPerP) {
		this.postEaPerP = postEaPerP;
	}

	public int getpageEaPerB() {
		return pageEaPerB;
	}

	public void setpageEaPerB(int pageEaPerB) {
		this.pageEaPerB = pageEaPerB;
	}

	public int getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(int totalPost) {
		this.totalPost = totalPost;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public int getfPostNumAtPage() {
		return fPostNumAtPage;
	}

	public void setfPostNumAtPage(int fPostNumAtPage) {
		this.fPostNumAtPage = fPostNumAtPage;
	}

	public int getlPostNumAtPage() {
		return lPostNumAtPage;
	}

	public void setlPostNumAtPage(int lPostNumAtPage) {
		this.lPostNumAtPage = lPostNumAtPage;
	}

	public int getfPageNumAtBlock() {
		return fPageNumAtBlock;
	}

	public void setfPageNumAtBlock(int fPageNumAtBlock) {
		this.fPageNumAtBlock = fPageNumAtBlock;
	}

	public int getlPageNumAtBlock() {
		return lPageNumAtBlock;
	}

	public void setlPageNumAtBlock(int lPageNumAtBlock) {
		this.lPageNumAtBlock = lPageNumAtBlock;
	}

	public static void main(String[] args) {
		
		double minority = 34.1;
		int a = (int) Math.ceil(minority);
		ReviewPagingVO p = new ReviewPagingVO();
		
		/*System.out.println(a);
		System.out.println(p.getpostEaPerP());
		System.out.println((96 / p.getpostEaPerP()));*/
		int num = 116 / 10;
		System.out.println(num);
	}
	
	
}
