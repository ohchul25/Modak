package kr.co.modak.user.seller.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.modak.user.seller.VO.MoUserSellerVO;

@Repository
public class SellerUserDAO {
	
	@Inject
	SqlSession sql;

	public int sellerJoin(MoUserSellerVO vo) {
		return sql.insert("userSeller.sellerJoin",vo);
	}

	public MoUserSellerVO sellerLogin(String SELLER_ID) {
		MoUserSellerVO vo = sql.selectOne("userSeller.sellerLogin",SELLER_ID);
		return sql.selectOne("userSeller.sellerLogin",SELLER_ID);
	}
	
	public MoUserSellerVO sellerInfoOne(String SELLER_NUM) {
		return sql.selectOne("userSeller.sellerInfoOne",SELLER_NUM);
	}
	
	public boolean pwdchk(MoUserSellerVO vo) {
		System.out.println("asdkjlaslkdj   " + sql.selectOne("userSeller.pwdchk",vo) );
		if(sql.selectOne("userSeller.pwdchk", vo) != null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int sellerInfoUpdate(MoUserSellerVO vo) {
		return sql.update("userSeller.sellerInfoUpdate",vo);
	}
	
	public int sellerDropUpdate(String SELLER_NUM) {
		return sql.update("userSeller.sellerDropUpdate", SELLER_NUM);
	}

}
