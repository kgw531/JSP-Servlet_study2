package EL;

public class MyELClass {

	public MyELClass() {
		// TODO Auto-generated constructor stub
	}
	
	// 주민번호를 입력받아 성별을 반환하는 메서드
	// 000000-0000000
	public String getGender(String jumin) {
		String res = jumin.substring(7);
		String gender = "";
		if(res.substring(0,1).equals("1") ||  res.substring(0,1).equals("3")) {
			gender = "male";
		}else if(res.substring(0,1).equals("2") ||  res.substring(0,1).equals("4")){
			gender = "female";
		}else {
			res = "주민등록 번호를 확인해주세요.";
		}
		
		return gender;
	}
	
	// 입력받은 문자열이 숫자인지 판별하는 정적메서드
	public static boolean isNumber(String value) {
		char[] chArr = value.toCharArray();
		for(int i=0;i<chArr.length;i++) {
			// 문자가 포함되어 있으면 return false;
			//System.out.println(chArr[i]);
			if(!(chArr[i] >= '0' && chArr[i]<='9')) {
				//System.out.println("문자가 포함되어 있습니다.");
				return false;
			}else {
				//System.out.println("숫자입니다.");
			}
		}
		return true;
	}
	
	
	// 입력받은 정수까지 구구단을 HTML 테이블로 출력한다.
	// 1단부터 입력받는 정수단까지 출력
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border = '1'>");
		for(int dan = 2; dan <= limitDan ; dan++) {
			sb.append("<tr>");
			for(int i = 1; i <= 9 ; i++) {
				sb.append("<td>");
				sb.append(dan + " * " + i + " = " + (dan * i));
				sb.append("</td>");
			}
			
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}
	
	public static void main(String[] args) {
		MyELClass el = new MyELClass();
		//System.out.println(el.getGender("001225-20000000"));
		//System.out.println(el.isNumber("123"));
		
		System.out.println(el.showGugudan(5));
	}
	
	
	
}
