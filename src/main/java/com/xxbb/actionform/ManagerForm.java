package com.xxbb.actionform;
/**  
    * @Title: ManagerForm.java
    * @Package com.xxbb.actionform
    * @Description:

    */

public class ManagerForm {
	private Integer id;  //ID của qtv
    private String name;   //tên
    private String pwd;  //mật khẩu
    private int systemSet;  //quyền hệ thống
    private int readerSet;   //Quyền quản lý người đọc
    private int bookSet;   //Quyền quản lý thư viện
    private int borrowSet;   //Quyền Mượn và Trả Sách
    private int systemQuery;    //Quyền truy vấn hệ thống
	public ManagerForm() {
		
	}
	@Override
	public String toString() {
		return "ManagerForm [id=" + id + ", name=" + name + ", pwd=" + pwd + ", systemSet=" + systemSet + ", readerSet="
				+ readerSet + ", bookSet=" + bookSet + ", borrowSet=" + borrowSet + ", systemQuery=" + systemQuery
				+ "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getSystemSet() {
		return systemSet;
	}
	public void setSystemSet(int systemSet) {
		this.systemSet = systemSet;
	}
	public int getReaderSet() {
		return readerSet;
	}
	public void setReaderSet(int readerSet) {
		this.readerSet = readerSet;
	}
	public int getBookSet() {
		return bookSet;
	}
	public void setBookSet(int bookSet) {
		this.bookSet = bookSet;
	}
	public int getBorrowSet() {
		return borrowSet;
	}
	public void setBorrowSet(int borrowSet) {
		this.borrowSet = borrowSet;
	}
	public int getSystemQuery() {
		return systemQuery;
	}
	public void setSystemQuery(int systemQuery) {
		this.systemQuery = systemQuery;
	}
}