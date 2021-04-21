package mall.client.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {		
		request.setCharacterEncoding("utf-8");
		System.out.println("EncodingFilter 실행");
		chain.doFilter(request, response);// 위의 코드는 request 요청에 대한 필터 (거의 할 일 없음)reponse에 대한 필터	
	}

}
