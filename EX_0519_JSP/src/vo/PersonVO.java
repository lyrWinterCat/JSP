package vo;

public class PersonVO {
	// VO : Value Object - DB에서 넘어온 row(행)의 정보를 저장하기 위한 클래스 개념
	
	// db에서 이름, 전화번호, 나이를 가져왔다고 가정
	// 클래스에 해당 db와 데이터 형식과 같게 변수 지정 + 항상 private으로 선언하기!
	// 클래스 변수명은 db column명과 같게 만들어 주는 것이 장기적으로 좋음
	
	
	// VO 클래스에서 만드는 변수명은 실제 DB의 컬럼명과 똑같은 이름으로 만들어 주는 것이 좋음
	private String name; //이름
	private int age; // 나이
	private String tel; //번호
	
	// getter setter 만들어주기
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	

}
