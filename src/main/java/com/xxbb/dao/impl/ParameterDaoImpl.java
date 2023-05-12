package com.xxbb.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.xxbb.actionform.ParameterForm;
import com.xxbb.dao.ParameterDao;

public class ParameterDaoImpl extends BaseDaoImpl implements ParameterDao{

	@Override
	public List<ParameterForm> query() {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();
		ParameterForm p=null;
		List<ParameterForm> pfs=new ArrayList<ParameterForm>();
		
		sb.append("select * from tb_parameter");
		System.out.println("查询办证参数："+sb);
		
		try {
			rs=executeQuery(sb.toString());
			while(rs.next()) {
				p=new ParameterForm();
				p.setId(rs.getInt(1));
				p.setCost(rs.getInt(2));
				p.setValidity(rs.getInt(3));
				pfs.add(p);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		
		return pfs;
	}
	@Override
	public int update(ParameterForm pf) {
		// TODO Auto-generated method stub
		int result=0;
		StringBuffer sb=new StringBuffer();
		sb.append("update tb_parameter set cost='");
		sb.append(pf.getCost());
		sb.append("',validity='");
		sb.append(pf.getValidity());
		sb.append("' where id=");
		sb.append(pf.getId());
		
		System.out.println("办证参数修改："+sb);
		try {
			result=executeUpdate(sb.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
}
