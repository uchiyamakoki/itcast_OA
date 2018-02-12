package cn.itcast.oa.interceptor;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.oa.domain.User;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;

/*
 * 进行权限检查的拦截器
 */

public class CheckPrivilegeInterceptor extends AbstractInterceptor{

	/*
	 * 拦截方法
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	public String intercept(ActionInvocation ai) throws Exception {
		
		//System.out.println("自定义的拦截器执行了。。。");
		User user= (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		
		String actonName=ai.getProxy().getActionName();
		String namespace=ai.getProxy().getNamespace();
		String url=namespace+actonName;
		
		if(url.endsWith("UI")){
			//如果访问Url以UI结尾，就祛除
			url=url.substring(0, url.length() - 2);
		}
		
		System.out.println("访问URL="+url);
		//一.用户没有登录
		if(user == null){
			 //a如果用户访问的是登录功能，则放行
			if("/user_login".equals(url)){
				ai.invoke();
			}else{
				 //b如果用户访问的不是登录功能，则跳转到登录页面
				return "loginUI";
			}
			
			
		}else{
			//二.用户已经登录
			  
			   List<String> allUrl=(List<String>) ServletActionContext.getServletContext().getAttribute("allUrl");
			  //如果用户访问的是要验证的权限
			   if(allUrl.contains(url)){
				   boolean b = user.hasPrivilegeByUrl(url);
					if(b){
						//b 如果用户有权限，则放行
						ai.invoke();
					}else{
						 //a 如果用户没有权限，则跳到没有权限的提示页面
						return "noPrivilegeUI";
					}
			   }else {
				 //如果用户访问的不是要验证的权限
				   ai.invoke();
			}                    			
		}
		
		return ai.invoke();
	}

}
