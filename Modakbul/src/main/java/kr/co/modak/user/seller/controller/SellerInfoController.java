package kr.co.modak.user.seller.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.modak.user.seller.VO.MoUserSellerVO;
import kr.co.modak.user.seller.service.SellerUserService;

@Controller
public class SellerInfoController {

	@Inject
	SellerUserService service;

	// seller Main ������ �̵�
	@RequestMapping(value = "/seller/sellerMain", method = RequestMethod.GET)
	public String sellerMain(Model model) {
		return "/user/seller/sellerMain";
	}

	// seller Info ������ �̵�(URL usernum ����)
	@RequestMapping(value = "/seller/{usernum}/sellerInfo.mo", method = RequestMethod.GET)
	public String sellerInfo(@PathVariable("usernum") String usernum, Model model) {
		System.out.println(usernum);
		MoUserSellerVO vo = service.sellerInfoOne(usernum);
		System.out.println(vo.getSELLER_ID());
		model.addAttribute("info", vo);
		return "/user/seller/sellerInfo";
	}

	// sellerInfo ���������� ȸ������ ����
	@RequestMapping(value ="/seller/sellerUpdate.mo", method = RequestMethod.POST)
	public String memberUpdate(MoUserSellerVO vo, Model model, Principal pr) {

		vo.setSELLER_NUM(pr.getName());
		boolean result = service.pwdchk(vo);

		if (result) {
			service.sellerInfoUpdate(vo);
			return "/user/seller/sellerMain";
		} else { 
			String SELLER_NUM = pr.getName();
			MoUserSellerVO list = service.sellerInfoOne(SELLER_NUM);
			model.addAttribute("info", list);
			model.addAttribute("message", "��й�ȣ ����ġ");
			return "/user/seller/sellerInfo";
		}
	}
	
	// seller Info ���������� Ż�� ��ư Ŭ���� ��й�ȣ Ȯ��â �̵�
	@RequestMapping(value ="/seller/dropChkPwd.mo", method=RequestMethod.POST)
	public String dropChkPwd(MoUserSellerVO vo, Model model, Principal pr) {
		return "/user/seller/dropChkPwd";
	}
	
	// seller dropChkPwd ���������� ��й�ȣ ��ġ => ����������, ����ġ => �ٽ� ����
	@RequestMapping(value ="/seller/sellerNotice.mo", method=RequestMethod.POST)
	public String sellerNotice(MoUserSellerVO vo, Model model, Principal pr) {
		// ��й�ȣ üũ
		vo.setSELLER_NUM(pr.getName());
		boolean result = service.pwdchk(vo);
		String usernum = pr.getName();
		
		if(result == true) {
			return "/user/seller/sellerDrop";
		}else {
			return "redirect:/seller/dropChkPwd.mo";
		}
		
	}
	
	// sellerDrop ���������� Ȯ�� ��ư ������ Ż�� => �α׾ƿ��Ŀ� �ε���
	@RequestMapping(value ="/seller/sellerDrop.mo", method=RequestMethod.POST)
	public String sellerDrop(MoUserSellerVO vo, Model model, Principal pr) {
		// ��й�ȣ üũ
		vo.setSELLER_NUM(pr.getName());
		service.sellerDropUpdate(pr.getName());
		
		return "redirect:/modak/logouts.mo";
	}

}
