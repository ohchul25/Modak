package kr.co.modak.user.seller.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.modak.user.seller.DAO.SellerUserDAO;
import kr.co.modak.user.seller.VO.MoUserSellerVO;

@Service
public class SellerUserServiceImpl implements SellerUserService{
	
	@Inject
	SellerUserDAO dao;

	
	public int sellerJoin(MoUserSellerVO vo) {
		return dao.sellerJoin(vo);
	}


	@Override
	public MoUserSellerVO sellerLogin(String SELLER_ID) {
		return dao.sellerLogin(SELLER_ID);
	}

	@Override
	public MoUserSellerVO sellerInfoOne(String SELLER_NUM) {
		return dao.sellerInfoOne(SELLER_NUM);
	}

	@Override
	public boolean pwdchk(MoUserSellerVO vo) {
		return dao.pwdchk(vo);
	}

	@Override
	public int sellerInfoUpdate(MoUserSellerVO vo) {
		return dao.sellerInfoUpdate(vo);
	}


	@Override
	public int sellerDropUpdate(String SELLER_NUM) {
		return dao.sellerDropUpdate(SELLER_NUM);
	}
	
}
