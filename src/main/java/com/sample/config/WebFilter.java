package com.sample.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

/**
 * This class is designed to hijack incoming request or filter set of request.
 * 
 * @author shyam.pareek
 *
 */
@Component
public class WebFilter implements Filter {

	public static final String HEADER_VAL = "HEADER_SAMPLE";

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {

		// System.out.println("=======WebFilter=============>>>>>>>>>>>>>>>>");
		HttpServletResponse response = (HttpServletResponse) res;
		response.setHeader(HEADER_VAL, "SHYAM");
		chain.doFilter(req, res);
	}

	@Override
	public void destroy() {

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}