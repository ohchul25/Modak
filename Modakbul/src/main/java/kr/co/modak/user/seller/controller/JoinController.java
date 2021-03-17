package kr.co.modak.user.seller.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import kr.co.modak.user.seller.VO.MoUserSellerVO;
import kr.co.modak.user.seller.service.SellerUserService;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@Controller
public class JoinController {

	@Inject
	SellerUserService service;
	
	
	@RequestMapping(value = "test.mo", method = RequestMethod.GET)
	public String sellerJoinForm2(Model model) {
		return "/user/admin/new";
	}

	@RequestMapping(value = "sellerJoin.mo", method = RequestMethod.GET)
	public String sellerJoinForm(Model model) {
		return "/user/seller/sellerJoinForm";
	}

	@RequestMapping(value = "sellerJoin.mo", method = RequestMethod.POST)
	public String sellerJoinGet(Model model, @ModelAttribute MoUserSellerVO vo, HttpSession session) {

		int a = service.sellerJoin(vo);
		System.out.println(a);
		if (a == 1) {
			session.setAttribute("loginId", vo.getSELLER_ID());
			return "redirect:/";
		} else {
			return "/user/seller/sellerJoinForm";
		}
	}

	@RequestMapping(value = "getCPN.mo", method = RequestMethod.POST)
	@ResponseBody
	public boolean getCompanyNum(MoUserSellerVO vo, Model model, HttpSession session, HttpServletRequest req)
			throws IOException, SAXException, ParserConfigurationException, XPathExpressionException {
		System.out.println("JoinController ==> CPN");
		String SELLER_COMPANY_NUM = vo.getSELLER_COMPANY_NUM();
//		String SELLER_COMPANY_NUM = req.getParameter("CPN");

		System.out.println(SELLER_COMPANY_NUM);
		if (null == SELLER_COMPANY_NUM || "".equals(SELLER_COMPANY_NUM)) {
			throw new RuntimeException("조회할 사업자등록번호를 입력해주세요.");
		}

		String txprDscmNo = StringUtils.replace(SELLER_COMPANY_NUM, "-", "");
		if (txprDscmNo.length() != 10) {
			throw new RuntimeException("조회할 사업자등록번호를 올바로 입력해주세요.");
		}

		String dongCode = txprDscmNo.substring(3, 5);
		String url = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=";
		Map<String, String> headers = new HashMap();
		headers.put("Accept", "application/xml; charset=UTF-8");
		headers.put("Accept-Encoding", "gzip, deflate, br");
		headers.put("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
		headers.put("Connection", "keep-alive");
		headers.put("Content-Length", "257");
		headers.put("Content-Type", "application/xml; charset=UTF-8");
		headers.put("Host", "teht.hometax.go.kr");
		headers.put("Origin", "https://teht.hometax.go.kr");
		headers.put("Referer", "https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml");
		headers.put("Sec-Fetch-Mode", "cors");
		headers.put("Sec-Fetch-Site", "same-origin");
		headers.put("User-Agent",
				"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36");

		final String CRLF = "\n";
		StringBuffer sb = new StringBuffer();
		sb.append("<map id=\"ATTABZAA001R08\">" + CRLF);
		sb.append(" <pubcUserNo/>" + CRLF);
		sb.append(" <mobYn>N</mobYn>" + CRLF);
		sb.append(" <inqrTrgtClCd>1</inqrTrgtClCd>" + CRLF);
		sb.append(" <txprDscmNo>" + txprDscmNo + "</txprDscmNo>" + CRLF);
		sb.append(" <dongCode>" + dongCode + "</dongCode>" + CRLF);
		sb.append(" <psbSearch>Y</psbSearch>" + CRLF);
		sb.append(" <map id=\"userReqInfoVO\"/>" + CRLF);
		sb.append("</map>" + CRLF);

		String body = sb.toString();
		System.out.println(body);
		Map<String, String> map = new HashMap();
//		try { 
		Response res = Jsoup.connect(url).headers(headers).requestBody(body).timeout(3000).method(Method.POST)
				.execute();
		System.out.println("끝끄튺트끄튺트끝끄끄트끝끄트끄");
		System.out.println(res.body());

		String resu = res.body();

		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();

		// String => xml
		dBuilder.parse(new InputSource(new StringReader(resu)));

		InputSource is = new InputSource(new StringReader(resu));
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);

		XPath xpath = XPathFactory.newInstance().newXPath();

		NodeList cols = (NodeList) xpath.evaluate("//map/trtCntn", document, XPathConstants.NODESET);
		boolean result = false;
		String a = null;
		for (int idx = 0; idx < cols.getLength(); idx++) {
			System.out.println(cols.item(idx).getTextContent());
			a = cols.item(idx).getTextContent();
//	            a.contains("폐업자");
		}
		
		if (a.contains("폐업자")) {
			result = false;
		} else if (a.contains("등록되지 않은")) {
			result = false;
		} else {
			result = true;
		}
		
		return result;
	}

}
