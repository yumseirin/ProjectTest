package com.control;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.service.HouseServiceInf;
import com.service.UserServiceInf;
import com.util.CommonConstant;
import com.vo.House;
import com.vo.Orderdetail;
import com.vo.Orders;

@Controller
@RequestMapping("houseControl")
public class HouseControl {
	private int page = 1;

	@Autowired
	private HouseServiceInf houseServiceInf;

	@Autowired
	private UserServiceInf userServiceInf;

	@RequestMapping("/saveHouse")
	public String saveHouse(House house, @RequestParam MultipartFile pic2) {

		try {
			house.setPic(pic2.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		houseServiceInf.saveHouse(house);

		return "forward:/houseControl/paging.action";
	}

	@RequestMapping("/listHouse")
	public String listHouse(Model model, HttpSession session) {
		List<House> list = houseServiceInf.listHouse();
		model.addAttribute("list", list);
		return "forward:/WEB-INF/main/main.jsp";
	}

	@ResponseBody
	@RequestMapping("/getHouseImg")
	public byte[] getHouseImg(int id) {
		byte[] b = null;
		try {
			b = houseServiceInf.getHouseImg(id);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return b;
	}

	@RequestMapping("/getHouseImg2")
	public void getImg(int id, HttpServletResponse response) {

		try {
			byte[] pic = houseServiceInf.getHouseImg(id);
			if (pic != null) {
				ServletOutputStream out = response.getOutputStream();
				out.write(pic);
				out.flush();
				out.close();
			}
		} catch (Exception e) {

		}

	}

	@RequestMapping("/order")
	public String order(Orders order, Orderdetail orderdetail, HttpSession session, HttpServletRequest request) {
		
		String uname = (String) session.getAttribute("uname");

		int userid = userServiceInf.getID(uname);
		Date date = new Date();
		String ordernum = String.valueOf(date.getTime());

		order.setOrdernum(ordernum);
		order.setUserid(userid);

		String houseid = request.getParameter("houseid");
		orderdetail.setOrdernum(ordernum);
		orderdetail.setHouseid(Integer.parseInt(houseid));

		houseServiceInf.order(order, orderdetail);
		houseServiceInf.setStatus(Integer.parseInt(houseid));

		return "forward:/houseControl/listHouse.action";
	}

	/**
	 * 分页显示
	 * @param model
	 * @param request
	 * @return "forward:/WEB-INF/main/main.jsp"
	 */
	@RequestMapping("/paging")
	public String paging(Model model, HttpServletRequest request) {
		String index = request.getParameter("page");
		if (index != null) {
			page = Integer.parseInt(index);
		}
		// 取总条数
		int zongtiao = houseServiceInf.getCountTiao();
		// 每页显示多少条
		int tiao = CommonConstant.PAGEROW;//每页显示几条记录

		// 页数 总页数=总条数%每页要显示的条数 ==0？总条数/每页要显示的条数 :总条数/每页要显示的条数 +1
		int yeshu = zongtiao % tiao == 0 ? zongtiao / tiao : zongtiao / tiao + 1;

		// 判断
		if (page > yeshu) {
			page = yeshu;
		}
		if (page <= 0) {
			page = 1;
		}
		int start = (page - 1) * tiao + 1;
		int end = page * tiao;

		List<House> list = houseServiceInf.getHousePage(start, end);
		model.addAttribute("list", list);
		model.addAttribute("yeshu", yeshu);
		model.addAttribute("page", page);
		return "forward:/WEB-INF/main/main.jsp";
	}
}
