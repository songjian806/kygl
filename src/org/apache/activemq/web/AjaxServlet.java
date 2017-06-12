// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   AjaxServlet.java

package org.apache.activemq.web;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Referenced classes of package org.apache.activemq.web:
//			MessageListenerServlet

public class AjaxServlet extends MessageListenerServlet {

	private Map jsCache;
	private long jsLastModified;

	public AjaxServlet() {
		jsCache = new HashMap();
		jsLastModified = 1000L * (System.currentTimeMillis() / 1000L);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		if (request.getPathInfo() != null
				&& request.getPathInfo().endsWith(".js"))
			doJavaScript(request, response);
		else
			super.doGet(request, response);
	}

	protected void doJavaScript(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String js = (new StringBuilder()).append(request.getServletPath())
				.append(request.getPathInfo()).toString();
		java.net.URL url = getServletContext().getResource(js);
		response.setCharacterEncoding("utf-8");
		if (url != null) {
			getServletContext().getNamedDispatcher("default").forward(request,
					response);
			return;
		}
		String resource = (new StringBuilder()).append(
				"org/apache/activemq/web").append(request.getPathInfo())
				.toString();
		synchronized (jsCache) {
			byte data[] = (byte[]) jsCache.get(resource);
			if (data == null) {
				InputStream in = Thread.currentThread().getContextClassLoader()
						.getResourceAsStream(resource);
				if (in != null) {
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					byte buf[] = new byte[4096];
					for (int len = in.read(buf); len >= 0; len = in.read(buf))
						out.write(buf, 0, len);

					in.close();
					out.close();
					data = out.toByteArray();
					jsCache.put(resource, data);
				}
			}
			if (data != null) {
				long ifModified = request.getDateHeader("If-Modified-Since");
				if (ifModified == jsLastModified) {
					response.sendError(304);
				} else {
					response.setContentType("application/x-javascript");
					response.setContentLength(data.length);
					response.setDateHeader("Last-Modified", jsLastModified);
					response.getOutputStream().write(data);
				}
			} else {
				response.sendError(404);
			}
		}
	}
}
