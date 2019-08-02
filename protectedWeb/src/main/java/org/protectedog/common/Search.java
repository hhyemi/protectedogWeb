package org.protectedog.common;

//==>����Ʈȭ���� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean 
public class Search {

	/// Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	// ==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field
	// ==> UserMapper.xml ��
	// ==> <select id="getUserList" parameterType="search"
	// resultMap="userSelectMap">
	// ==> ����
	private int endRowNum;
	private int startRowNum;
	private int commentEndRowNum;
	// ���丮�ݵ�
	private String voteCondition;
	// �о�
	private String areaCondition;
	
	private String prodCondition;

	

	/// Constructor
	public Search() {
	}

	/// Method
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	// ==> Select Query �� ROWNUM ������ ��
	public int getEndRowNum() {
		return getCurrentPage() * getPageSize();
	}

	// ==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage() - 1) * getPageSize() + 1;
	}
	
	// Comment ROWNUM ������ ��
	public int getCommentEndRowNum() {
		return getPageSize() + 5;
	}

	public String getVoteCondition() {
		return voteCondition;
	}

	public void setVoteCondition(String voteCondition) {
		this.voteCondition = voteCondition;
	}

	public String getAreaCondition() {
		return areaCondition;
	}

	public void setAreaCondition(String areaCondition) {
		this.areaCondition = areaCondition;
	}
	

	public String getProdCondition() {
		return prodCondition;
	}

	public void setProdCondition(String prodCondition) {
		this.prodCondition = prodCondition;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum
				+ ", commentEndRowNum=" + commentEndRowNum + ", voteCondition=" + voteCondition + ", areaCondition="
				+ areaCondition + ", prodCondition=" + prodCondition + "]";
	}

}
