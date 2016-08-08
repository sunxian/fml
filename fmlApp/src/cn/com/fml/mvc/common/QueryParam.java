package cn.com.fml.mvc.common;

/**
 * 查询参数基类
 *
 *
 * @param <T> 要查询的对象类型
 */
public class QueryParam<T> {
	private int pageNumber = 1;
	private int pageSize = 10;
	private String orderBy;
	private boolean orderAsc;
	private boolean needCount = true;
	private T queryParam;
	
	/**
	 * 要查询的页码，从1开始
	 * @return the pageNumber
	 */
	public int getPageNumber() {
		return pageNumber;
	}
	/**
	 * @param pageNumber the pageNumber to set
	 */
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	/**
	 * 页面大小，缺省为每页10行
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * 是否需要返回总记录数
	 * @return the needCount
	 */
	public boolean isNeedCount() {
		return needCount;
	}
	/**
	 * @param needCount the needCount to set
	 */
	public void setNeedCount(boolean needCount) {
		this.needCount = needCount;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public boolean isOrderAsc() {
		return orderAsc;
	}
	public void setOrderAsc(boolean orderAsc) {
		this.orderAsc = orderAsc;
	}
    public T getQueryParam() {
        return queryParam;
    }
    public void setQueryParam(T queryParam) {
        this.queryParam = queryParam;
    }
	
}
