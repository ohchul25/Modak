package kr.co.modak.product.camplist.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.modak.product.camplist.VO.ProductCamplistVO;

@Repository
public class ProductCamplistDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<ProductCamplistVO> ProductCamplist() {
		return sql.selectList("pdCamplist.ProductCamplist");
	}

}
