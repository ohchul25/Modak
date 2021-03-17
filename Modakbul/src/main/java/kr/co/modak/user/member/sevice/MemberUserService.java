package kr.co.modak.user.member.sevice;

import java.util.List;

import kr.co.modak.user.member.VO.MoUserMemberVO;

public interface MemberUserService {
	
	MoUserMemberVO getUserOne(String MEMBER_ID);
	
	MoUserMemberVO snsUserOne(String MEMBER_ID);
	
	public int idCheck(MoUserMemberVO vo) throws Exception;
	
	int userJoin(MoUserMemberVO members);

	List<MoUserMemberVO> list(String MEMBER_NUM);
	
	void updateMember(MoUserMemberVO vo);
	
	void deleteMember(String MEMBER_NUM);
	
	boolean checkPw(String MEMBER_NUM, String MEMBER_PW);
	
}
