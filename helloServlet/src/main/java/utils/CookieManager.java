package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public CookieManager() {
		// TODO Auto-generated constructor stub
	}
	// 이름, 값, 유지시간을 매개변수로 받아서 쿠키를 생성한다.
	// 쿠키를 생성 후 응답객체에 담기
	public static void makeCookie(HttpServletResponse response , String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);
		
		cookie.setPath("/");
		
		cookie.setMaxAge(cTime);
		
		response.addCookie(cookie);
		
	}
	
	// 쿠키이름을 받아서 쿠키값을 반환
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if(cName.equals(cookieName)) {
					cookieValue = cookie.getValue();
					break;
				}
			}
		}
		return cookieValue;
	}
	
	// 쿠키 이름을 매개변수로 받아 쿠키를 삭제
	public  static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response,cName,"",0);
	}
	
	
}

// 쿠키 이름을 매개변수로 받아서 쿠키 삭제