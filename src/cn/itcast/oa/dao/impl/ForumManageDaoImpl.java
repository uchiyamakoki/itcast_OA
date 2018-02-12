package cn.itcast.oa.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.itcast.oa.base.BaseDaoImpl;
import cn.itcast.oa.dao.IForumManageDao;
import cn.itcast.oa.domain.Forum;

/*
 * 版块管理Dao实现类
 */
@Repository
@SuppressWarnings("unchecked")
public class ForumManageDaoImpl extends BaseDaoImpl<Forum> implements IForumManageDao{

	/*
	 * 重写查询方法，按照position排序
	 */
	public List<Forum> findAll(){
		String hql="FROM Forum f ORDER BY f.position";
		
		return this.getSession().createQuery(hql).list();
	}
	
	/*
	 * 重写父类的保存方法，加入保存版块时，设置position的值为id的值
	 */
	public void save(Forum entity){
		super.save(entity);//由瞬时对象变为持久对象，id已经有值
		entity.setPosition(entity.getId().intValue());//设置position的值为id的值
	}

	/*
	 * 上移版块
	 * @see cn.itcast.oa.dao.IForumManageDao#moveUp(java.lang.Long)
	 */
	public void moveUp(Long id) {
		Forum forum1 =getById(id);
		int p1=forum1.getPosition();
		
		String hql="FROM Forum f WHERE f.position < ? ORDER BY f.position DESC";
		Query query=this.getSession().createQuery(hql);
		query.setParameter(0, p1);//?赋值p1
		/*
		 * 分页取最大，limit0，1
		 */
		query.setFirstResult(0);
		query.setMaxResults(1);
		Forum forum2=(Forum) query.uniqueResult();
		
		forum1.setPosition(forum2.getPosition());
		forum2.setPosition(p1);
	}

	/*
	 * 下移版块
	 * @see cn.itcast.oa.dao.IForumManageDao#moveDown(java.lang.Long)
	 */
	public void moveDown(Long id) {
		Forum forum1=getById(id);
		int p1=forum1.getPosition();
		
		String hql="FROM Forum f WHERE f.position > ? ORDER BY f.position";
		Query query=this.getSession().createQuery(hql);
		query.setParameter(0, p1);
		
		query.setFirstResult(0);
		query.setMaxResults(1);
		Forum forum2=(Forum) query.uniqueResult();
		
		forum1.setPosition(forum2.getPosition());
		forum2.setPosition(p1);
		
	}
}
