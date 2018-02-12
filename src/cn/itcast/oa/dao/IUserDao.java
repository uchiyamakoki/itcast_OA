package cn.itcast.oa.dao;

import cn.itcast.oa.base.IBaseDao;
import cn.itcast.oa.domain.User;

public interface IUserDao extends IBaseDao<User> {

	int findByLoginName(String loginName);

	public User login(User model);

}
