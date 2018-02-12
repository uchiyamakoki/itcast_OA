package cn.itcast.oa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.oa.dao.ITopicDao;
import cn.itcast.oa.domain.Forum;
import cn.itcast.oa.domain.Topic;
import cn.itcast.oa.service.ITopicService;

/*
 * 主题操作
 */
@Service
@Transactional
public class TopicServiceImpl implements ITopicService{
 
	@Resource
	private ITopicDao topicDao;

	public List<Topic> findTopicByForum(Forum model) {
		
		return topicDao.findTopicByForum(model);
	}

	/*
	 * 发表主题
	 * @see cn.itcast.oa.service.ITopicService#save(cn.itcast.oa.domain.Topic)
	 */
	public void save(Topic model) {
		topicDao.save(model);//model对象为持久对象，save后
		Forum forum=model.getForum();//forum为持久对象
		forum.setTopicCount(forum.getTopicCount() + 1);//当前版块所在主题数量+1
		forum.setArticleCount(forum.getArticleCount() + 1);//当前版块文章数量+1
		forum.setLastTopic(model);//设置最后发表主题为当前主题
	}

	/*
	 * 根据id查询主题
	 * @see cn.itcast.oa.service.ITopicService#getById(java.lang.Long)
	 */
	public Topic getById(Long id) {
		
		return topicDao.getById(id);
	}

	

}
