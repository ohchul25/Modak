package kr.co.modak.product.like.VO;

import java.util.Date;

public class ProductLikeVO {
	private String MEMBER_NUM;
	private String CAMPLIST_ID;
	private int LIKE_PRICE;
	private Date LIKE_ADDTIME;
	
	public String getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(String mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public String getCAMPLIST_ID() {
		return CAMPLIST_ID;
	}
	public void setCAMPLIST_ID(String cAMPLIST_ID) {
		CAMPLIST_ID = cAMPLIST_ID;
	}
	public int getLIKE_PRICE() {
		return LIKE_PRICE;
	}
	public void setLIKE_PRICE(int lIKE_PRICE) {
		LIKE_PRICE = lIKE_PRICE;
	}
	public Date getLIKE_ADDTIME() {
		return LIKE_ADDTIME;
	}
	public void setLIKE_ADDTIME(Date lIKE_ADDTIME) {
		LIKE_ADDTIME = lIKE_ADDTIME;
	}
}
