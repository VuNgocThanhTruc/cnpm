package com.xxbb.dao;

import java.util.List;

import com.xxbb.actionform.ManagerForm;

public interface ManagerDao {
	//HLinh
	//usecase Login
	//B3.2: ktra username và password có trùng khớp với db
	public boolean checkManager(ManagerForm mgf);//xác thực đăng nhập
	public List<ManagerForm> query(ManagerForm m);//Truy vấn theo tên
	public int insert(ManagerForm mgf);//Thêm tài khoản quản trị viên
	public int update(ManagerForm mgf);//Sửa đổi quyền của quản trị viên
	public int delete(ManagerForm mgf);//xóa quản trị viên
	public int updatePassword(ManagerForm mgf);//Thay đổi mật khẩu quản trị viên
}
