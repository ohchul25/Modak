package kr.co.modak.user.seller.service;

import java.util.List;

import kr.co.modak.user.seller.VO.MoUserSellerVO;

public interface SellerUserService {
	
	public int sellerJoin(MoUserSellerVO vo);
	
	public MoUserSellerVO sellerLogin(String SELLER_ID);

	public MoUserSellerVO sellerInfoOne(String SELLER_NUM);
	
	public boolean pwdchk(MoUserSellerVO vo);
	
	public int sellerInfoUpdate(MoUserSellerVO vo);
	
	public int sellerDropUpdate(String SELLER_NUM);
	
}
