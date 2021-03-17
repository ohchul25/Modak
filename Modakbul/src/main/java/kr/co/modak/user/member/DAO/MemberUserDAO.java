package kr.co.modak.user.member.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.modak.user.member.VO.MoUserMemberVO;

@Repository
public class MemberUserDAO {

	@Inject
	SqlSession sql;

	public MoUserMemberVO getUserOne(String MEMBER_ID) {

		if(MEMBER_ID ==null) {
			return null;
		}else {	
			System.out.println("DAO까지 왔다리~~~~~~~~~");
			return sql.selectOne("userMember.getUserOne", MEMBER_ID);
			
		}
		
	}
	public MoUserMemberVO snsUserOne(String MEMBER_ID) {
		
		return sql.selectOne("userMember.snsUserOne", MEMBER_ID);
	}

	public int userJoin(MoUserMemberVO vo) {
		return sql.insert("userMember.userJoin", vo);
	}
	
	//아이디 중복 체크
	public int idCheck(MoUserMemberVO vo) {
		int result = sql.selectOne("userMember.idCheck", vo);
		return result;
	}

	//회원 정보 상세 조회

	public List<MoUserMemberVO> list(String MEMBER_NUM) {

		return sql.selectList("userMember.list", MEMBER_NUM);

	}

	//회원 정보 삭제 처리

	public void deleteMember(String MEMBER_NUM) {

		sql.update("userMember.deleteMember", MEMBER_NUM);

	}

	//회원 정보 수정 처리

	public void updateMember(MoUserMemberVO vo) {

		sql.update("userMember.updateMember", vo);

	}

	//회원 정보 수정 및 삭제를 위한 비밀번호 체크

	public boolean checkPw(String MEMBER_NUM, String MEMBER_PW) {

		boolean result = false;

		Map<String, String> map = new HashMap<String, String>();

		map.put("MEMBER_NUM", MEMBER_NUM);

		map.put("MEMBER_PW", MEMBER_PW);

		int count = sql.selectOne("userMember.checkPw", map);

		if (count == 1)
			result = true;

		return result;

	}

}