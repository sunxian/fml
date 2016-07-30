package cn.com.mobilereal.mvc.util;

public class SQLColumn {
	private String colname;
	private String type;
	private int iType;
	private int size;
	private int scale;
	private int precision;
	private boolean nullable;
	private boolean readOnly;
	private boolean autoIncrement;
	private String searchable;
	private String currency;
	private String caseSensitive;
	private String signed;
	private String classType;
	private String disName;
	
	public SQLColumn(String colname) {
		this.colname = colname;
	}
	
	public String getColname() {
		return colname;
	}
	public void setColname(String colname) {
		this.colname = colname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getiType() {
		return iType;
	}
	public void setiType(int iType) {
		this.iType = iType;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getScale() {
		return scale;
	}
	public void setScale(int scale) {
		this.scale = scale;
	}
	public int getPrecision() {
		return precision;
	}
	public void setPrecision(int precision) {
		this.precision = precision;
	}
	public boolean isNullable() {
		return nullable;
	}
	public void setNullable(boolean nullable) {
		this.nullable = nullable;
	}
	public boolean getReadOnly() {
		return readOnly;
	}
	public void setReadOnly(boolean readOnly) {
		this.readOnly = readOnly;
	}
	public boolean getAutoIncrement() {
		return autoIncrement;
	}
	public void setAutoIncrement(boolean autoIncrement) {
		this.autoIncrement = autoIncrement;
	}
	public String getSearchable() {
		return searchable;
	}
	public void setSearchable(String searchable) {
		this.searchable = searchable;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getCaseSensitive() {
		return caseSensitive;
	}
	public void setCaseSensitive(String caseSensitive) {
		this.caseSensitive = caseSensitive;
	}
	public String getSigned() {
		return signed;
	}
	public void setSigned(String signed) {
		this.signed = signed;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getDisName() {
		return disName;
	}
	public void setDisName(String disName) {
		this.disName = disName;
	}
	
}
