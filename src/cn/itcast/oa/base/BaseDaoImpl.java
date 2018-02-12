package cn.itcast.oa.base;
/*
 * 通过dao接口功能实现
 */
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDaoImpl<T> implements IBaseDao<T> {

	@Resource
	private SessionFactory sessionFactory;
	
	private Class<T> clazz;
	
	public BaseDaoImpl(){
		//获得实体类型
		ParameterizedType genericSuperClass=(ParameterizedType) this.getClass().getGenericSuperclass();//获得真正的父类
		Type[] types=genericSuperClass.getActualTypeArguments();
		clazz=(Class<T>) types[0];
	}
	
	public void save(T entity) {
		getSession().save(entity);
		
	}

	public void delete(Long id) {
		//获得实体类型
		//getSession().get(clazz, id);
		//删除
		//getSession().delete(XXX);
		getSession().delete(getSession().get(clazz, id));
	}

	public void update(T entity) {
		getSession().update(entity);
	}
	
	public T getById(Long id) {	
		return (T) getSession().get(clazz, id);
	}

	public List<T> getByIds(Long[] ids) {
		String hql = "FROM " + clazz.getSimpleName() + " WHERE id in (:ids)";
		Query query = getSession().createQuery(hql);
		query.setParameterList("ids", ids);//一次赋值多个
		return query.list();
	}
	
	public List<T> findAll() {
		//获得底层类名getSimpleName
		String hql="FROM "+clazz.getSimpleName();
		return getSession().createQuery(hql).list();
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
}
