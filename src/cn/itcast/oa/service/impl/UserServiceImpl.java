package cn.itcast.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.oa.dao.IUserDao;
import cn.itcast.oa.domain.User;
import cn.itcast.oa.service.IUserService;
import cn.itcast.oa.utils.MD5Utils;
/*
 * 用户管理实现
 */
@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;

	public List<User> findAll() {
		return userDao.findAll();
	}

	/*
	 * 根据id删除用户
	 * @see cn.itcast.oa.service.IUserService#delete(cn.itcast.oa.domain.User)
	 */
	public void delete(User model) {
		userDao.delete(model.getId());
	}

	public void save(User model) {
		model.setPassword(MD5Utils.md5("1234"));//为新用户指定默认密码
		userDao.save(model);
	}
	/*
	 * 根据id查询用户
	 * @see cn.itcast.oa.service.IUserService#getById(java.lang.Long)
	 */
	public User getById(Long id) {
		return userDao.getById(id);
	}
	/*
	 * 根据id修改用户
	 * @see cn.itcast.oa.service.IUserService#update(cn.itcast.oa.domain.User)
	 */
	public void update(User user) {
		userDao.update(user);
	}
    /*
     * 根据登录名查询
     * @see cn.itcast.oa.service.IUserService#findByLoginName(java.lang.String)
     */
	public int findByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}

	/*
	 * 用户登录
	 * @see cn.itcast.oa.service.IUserService#login(cn.itcast.oa.domain.User)
	 */
	public User login(User model) {
		return userDao.login(model);
	}
}
