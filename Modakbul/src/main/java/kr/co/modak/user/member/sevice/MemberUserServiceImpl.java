package kr.co.modak.user.member.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.modak.user.member.DAO.MemberUserDAO;
import kr.co.modak.user.member.VO.MoUserMemberVO;



@Service
public class MemberUserServiceImpl implements MemberUserService {

	
	@Inject
	MemberUserDAO dao;
	
	//로그인
	
	@Override
	public MoUserMemberVO getUserOne(String MEMBER_ID) {
		return dao.getUserOne(MEMBER_ID);
	}
	
	@Override
	public MoUserMemberVO snsUserOne(String MEMBER_ID) {
		return dao.snsUserOne(MEMBER_ID);
	}
	
	//회원가입
	
	@Override
	public int userJoin(MoUserMemberVO vo) {
		return dao.userJoin(vo);
	}
	
	//아이디 중복 체크
	
		@Override
		public int idCheck(MoUserMemberVO vo) throws Exception {
			int result = dao.idCheck(vo);
			return result;
		}
	
	//회원 정보 상세 조회 

    @Override

    public List<MoUserMemberVO> list(String MEMBER_NUM) {

        return dao.list(MEMBER_NUM);

    }

    //회원 정보 삭제 처리

    @Override

    public void deleteMember(String MEMBER_NUM) {

        dao.deleteMember(MEMBER_NUM);

    }

    //회원 정보 수정 처리

    @Override

    public void updateMember(MoUserMemberVO vo) {

        dao.updateMember(vo);

    }

    // 06. 회원 정보 수정 및 삭제를 위한 비밀번호 체크

    @Override

    public boolean checkPw(String MEMBER_NUM, String MEMBER_PW) {

        return dao.checkPw(MEMBER_NUM, MEMBER_PW);

    }

 
	
}