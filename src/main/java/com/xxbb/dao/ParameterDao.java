package com.xxbb.dao;
import java.util.List;

import com.xxbb.actionform.ParameterForm;

public interface ParameterDao {
	public List<ParameterForm> query();//查询办证参数
	public int update(ParameterForm pf);//修改办证信息
}
