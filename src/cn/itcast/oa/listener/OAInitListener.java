package cn.itcast.oa.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.itcast.oa.domain.Privilege;
import cn.itcast.oa.service.IPrivilegeService;

public class OAInitListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
	}

	/*
	 * 初始化方法
	 * @see javax.servlet.ServletContextListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
	 //System.out.println("自定义监听器的初始化方法");
	 //1.获取spring容器
	 WebApplicationContext applicationContext=WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
	 
	 //2.从spring容器中获取privilegeService
	 IPrivilegeService service=(IPrivilegeService) applicationContext.getBean("privilegeServiceImpl");
	 
	 //3.使用service查询权限数据
	 List<Privilege> topList=service.findTopList();
	 //4.将权限数据放入application作用域
     sce.getServletContext().setAttribute("privilegeTopList", topList);
     
     System.out.println("权限数据已经放入application作用域了");
     
     //查询所有要进行校验的权限URL
     List<String> allUrl=service.findAllUrl();
     sce.getServletContext().setAttribute("allUrl", allUrl);
	}

}
