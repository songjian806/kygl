package com.keyan.tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//过滤器编写
public class SetCharacterEncodingFilter implements Filter {
	protected String encoding = null;
	protected boolean ignore = true;
	protected FilterConfig filterConfig = null;

	public void destroy() {

		this.encoding = null;
		this.filterConfig = null;

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		if (ignore || (request.getCharacterEncoding() == null)) {
			String encoding = selectEncoding(request);//设置请求的编码格式
			if (encoding != null)
				request.setCharacterEncoding(encoding);
		}
		//他的作用是将请求转发给过滤器链上下一个对象。这里的下一个指的是下一个filter，如果没有filter那就是你请求的资源。
		//一般filter都是一个链,web.xml 里面配置了几个就有几个。一个一个的连在一起 
		chain.doFilter(request, response);
	}
//init()初始化实例
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
		String value = filterConfig.getInitParameter("ignore");
		if (value == null)
			this.ignore = true;
		else if (value.equalsIgnoreCase("true"))
			this.ignore = true;
		else if (value.equalsIgnoreCase("yes"))
			this.ignore = true;
		else
			this.ignore = false;

	}

	protected String selectEncoding(ServletRequest request) {

		return (this.encoding);

	}
}
