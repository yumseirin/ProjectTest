package com.control;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.CheckCodeServiceInf;

@Controller
@RequestMapping("checkCodeControl")
public class CheckCodeControl {
	@Autowired
	private CheckCodeServiceInf checkCodeServiceInf;

	/**
	 * 生成校验码图片
	 * 
	 * @param response
	 * @throws IOException
	 *             异常
	 */
	@RequestMapping("getImage")
	public void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("getimgage......");
		// 禁止缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		// 指定生成的响应是图片
		response.setContentType("image/jpeg");

		// String code = checkCodeService.generateRandomNumberCode();
		// 产生随机字母数字混合验证码
		String code = checkCodeServiceInf.generateRandomMixedCode();
		// 将生成的验证码保存到Session中
		HttpSession session = request.getSession(true);
		session.setAttribute("checkCode", code);
		ImageIO.write(checkCodeServiceInf.getImage(code), "JPEG", response.getOutputStream());
	}

	/**
	 * 验证校验码
	 * 
	 * @param checkcode
	 * @return 校验码正确返回true
	 */
	@RequestMapping("validate")
	// @RequestMapping(value = "validate", produces = "application/json;
	// charset=utf-8")
	@ResponseBody
	public String validate(String checkcode, HttpServletRequest request) {
		System.out.println(" 验证校验码 ");
		String html = "";
		HttpSession session = request.getSession(false);
		if (session == null) {
			html = "/login.jsp";
		}
		String code = (String) session.getAttribute("checkCode");
		System.out.println("1234561234561........");
		if (checkcode != null && checkcode.length() > 0 && checkcode.toUpperCase().equals(code.toUpperCase())) {
			html = "{\"success\":0}";// 用户输入的值和验证码的值相同
			// session.removeAttribute("checkCode");
		} else {
			html = "{\"success\":1}";// 用户输入的值和验证码的值不相同
		}
		System.out.println(html);
		return html;
	}

}
