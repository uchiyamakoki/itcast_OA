package cn.itcast.oa.service;

import java.util.List;

import cn.itcast.oa.domain.Forum;
import cn.itcast.oa.domain.Topic;

public interface ITopicService {

	public List<Topic> findTopicByForum(Forum model);

	public void save(Topic model);

	public Topic getById(Long id);

	

}
