package cn.itcast.oa.base;

import java.util.List;

/*
 * 通用dao接口
 */
public interface IBaseDao<T> {
	/*
	 * 添加
	 */
	public void save(T entity);
	
	/*
	 * 根据id删除
	 */
	public void delete(Long id);
	
	/*
	 * 根据id修改
	 */
	public void update(T entity);
	
	/*
	 * 根据id查询
	 */
	public T getById(Long id);
	public List<T> getByIds(Long[] ids);
	public List<T> findAll();
}
