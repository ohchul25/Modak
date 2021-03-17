package kr.co.modak.product.review.VO;

import java.util.Date;

public class ProductReviewVO {
	
	private String MEMBER_NUM;
	private String CAMPLIST_ID;
	private String STATE_RESNO;
	private Date REVIEW_DATE;
	private int REVIEW_SCORE;
	private String REVIEW_CONTENT;
	
	
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
	public String getSTATE_RESNO() {
		return STATE_RESNO;
	}
	public void setSTATE_RESNO(String sTATE_RESNO) {
		STATE_RESNO = sTATE_RESNO;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public int getREVIEW_SCORE() {
		return REVIEW_SCORE;
	}
	public void setREVIEW_SCORE(int rEVIEW_SCORE) {
		REVIEW_SCORE = rEVIEW_SCORE;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
}
