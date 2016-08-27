package cn.com.fml.mvc.common;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class PageBean implements Serializable{
	private int pageNo = 1; 

	private int pageTotal = 1;  

	private int recordNumPerPage = 10; 

	private int totalRecord;
	
	private int displayTotalRecord;
	
	public int getDisplayTotalRecord(){
		return displayTotalRecord;
	}
	public void setDisplayTotalRecord(int newValue){
		this.displayTotalRecord = newValue;
	}
	
	public PageBean(int pageNo, int pageSize,int totalRecord) {
		this.pageNo = pageNo;
		this.totalRecord = totalRecord;
		displayTotalRecord = totalRecord;
		this.recordNumPerPage = pageSize;
		pageTotal = totalRecord / recordNumPerPage;
		if (pageTotal * recordNumPerPage < totalRecord) {
			pageTotal++;
		}
	}
	
	public PageBean(int pageNo, int totalRecord) {
		this.pageNo = pageNo;
		this.totalRecord = totalRecord;
		displayTotalRecord = totalRecord;
		pageTotal = totalRecord / recordNumPerPage;
		if (pageTotal * recordNumPerPage < totalRecord) {
			pageTotal++;
		}
	}
	
	public PageBean(List<?> list) {
        this.pageNo = 1;
        this.totalRecord = list.size();
        displayTotalRecord = totalRecord;
        pageTotal = totalRecord / recordNumPerPage;
        if (pageTotal * recordNumPerPage < totalRecord) {
            pageTotal++;
        }
        this.list = list;
    }

	private List<?> list = new ArrayList<Object>();

	public int getTotalRecord() {
		return totalRecord;
	}
    public int getStartIndex(){
        if (pageNo<1) return 0;
		return (pageNo -1) * recordNumPerPage;
	}
	public int getEndIndex(){
		return pageNo * recordNumPerPage;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageNo() {
		if (pageNo<1) return 1;
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRecordNumPerPage() {
		return recordNumPerPage;
	}

	public void setRecordNumPerPage(int recordNumPerPage) {
		this.recordNumPerPage = recordNumPerPage;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
	
}
