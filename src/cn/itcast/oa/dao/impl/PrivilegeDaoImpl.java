package cn.itcast.oa.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.itcast.oa.base.BaseDaoImpl;
import cn.itcast.oa.dao.IPrivilegeDao;
import cn.itcast.oa.domain.Privilege;

/*
 * 权限dao实现类
 */
@Repository
@SuppressWarnings("unchecked")
public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege> implements IPrivilegeDao{

	/*
	 * 查询顶级权限列表
	 * @see cn.itcast.oa.dao.IPrivilegeDao#findTopList()
	 */	
	public List<Privilege> findTopList() {
		String hql = "FROM Privilege p WHERE p.parent IS NULL";
		return this.getSession().createQuery(hql).list();
	}

	/*
	 * 查询所有权限对应的url
	 * @see cn.itcast.oa.dao.IPrivilegeDao#findAllUrl()
	 */
	public List<String> findAllUrl() {
		String hql="SELECT url FROM Privilege WHERE url IS NOT NULL";
		return this.getSession().createQuery(hql).list();
	}

}
