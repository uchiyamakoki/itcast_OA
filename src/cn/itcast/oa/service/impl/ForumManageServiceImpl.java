package cn.itcast.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.oa.dao.IForumManageDao;
import cn.itcast.oa.domain.Forum;
import cn.itcast.oa.service.IForumManageService;
/*
 * 版块管理
 */
@Service
@Transactional
public class ForumManageServiceImpl implements IForumManageService{
    
	@Resource
	private IForumManageDao forumManageDao;
	/*
	 * 查询版块列表
	 * @see cn.itcast.oa.service.IForumManageService#findAll()
	 */
	public List<Forum> findAll() {
	   
		return forumManageDao.findAll();
	}
    /*
     * 删除列表模块根据id
     * @see cn.itcast.oa.service.IForumManageService#delete(cn.itcast.oa.domain.Forum)
     */
	public void delete(Forum model) {
		forumManageDao.delete(model.getId());
		
	}
	/*
	 * 添加版块/保存版块
	 * @see cn.itcast.oa.service.IForumManageService#save(cn.itcast.oa.domain.Forum)
	 */
	public void save(Forum model) {
		forumManageDao.save(model);
		
	}
	/*
	 * 根据id查询版块
	 * @see cn.itcast.oa.service.IForumManageService#getById(java.lang.Long)
	 */
	public Forum getById(Long id) {
		
		return forumManageDao.getById(id);
	}
	/*
	 * 根据id修改版块信息
	 * @see cn.itcast.oa.service.IForumManageService#update(cn.itcast.oa.domain.Forum)
	 */
	public void update(Forum forum) {
	  forumManageDao.update(forum);
		
	}
	/*
	 * 上移版块
	 * @see cn.itcast.oa.service.IForumManageService#moveUp(java.lang.Long)
	 */
	public void moveUp(Long id) {
		forumManageDao.moveUp(id);
		
	}
	/*
	 * 下移版块
	 * @see cn.itcast.oa.service.IForumManageService#moveDown(java.lang.Long)
	 */
	public void moveDown(Long id) {
		forumManageDao.moveDown(id);
	}

}
