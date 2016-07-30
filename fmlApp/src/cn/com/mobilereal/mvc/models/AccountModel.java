package cn.com.mobilereal.mvc.models;

import java.io.Serializable;

public class AccountModel implements Serializable{
	/**
	 * <p>Field serialVersionUID: TODO</p>
	 */
	private static final long serialVersionUID = 1L;
	private String username;
    private String password;
    
    public AccountModel(){
    	
    }
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
}
