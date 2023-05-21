package com.xxbb.dao;

import java.util.List;

import com.xxbb.actionform.BookForm;

/**
 * @Title: BookDao.java
 * @Package com.xxbb.dao
 * @Description: BookDao
 * @author vungocthanhtruc
 * @date 2023/05/10
 * @version V1.0
 */

public interface BookDao {
	public List<BookForm> existQuery(BookForm bf);

	public List<BookForm> query(String[] str);//query all system

	public List<BookForm> query(BookForm bf); //query all info book display library

//	3.1.4 Gọi insert(BookForm)
//	3.1.7 return kết quả insert thông tin sách
	public int insert(BookForm bf);
	public int update(BookForm bf);
	public int delete(BookForm bf);
}
