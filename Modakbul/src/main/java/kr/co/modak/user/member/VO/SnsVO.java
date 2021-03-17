package kr.co.modak.user.member.VO;

public class SnsVO {
	
	private String id;
	private String email;
	private String nickname;
	private String name;
	private String gender;
	private String MEMBER_SNS;
	
	
	public String getMEMBER_SNS() {
		return MEMBER_SNS;
	}
	public void setMEMBER_SNS(String mEMBER_SNS) {
		MEMBER_SNS = mEMBER_SNS;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
