package com.seirin.control.area;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.seirin.service.area.AreaServiceInf;
import com.seirin.vo.area.Area;

/**
 * @Description: 区域管理
 */
@Controller
@RequestMapping("areaControl")
public class AreaControl {

	@Autowired
	private AreaServiceInf areaServiceInf;

	/**
	 * 跳转到区域列表页
	 * 
	 * @return 区域列表页
	 */
	@RequestMapping("gotoAreaList")
	public String gotoAreaList() {
		// 先去查，在往页面上带值
		return "forward:/areaControl/selectArea.action";
	}

	/**
	 * 跳转到区域添加页面
	 * 
	 * @return 区域添加页面
	 */
	@RequestMapping("gotoAddArea")
	public String gotoAddArea() {
		return "/area/addarea";
	}

	/**
	 * 添加区域
	 * 
	 * @return 区域列表页
	 */
	@RequestMapping("addArea")
	public String addArea(Area area) {
		String str = "forward:/areaControl/selectArea.action";
		try {
			areaServiceInf.addArea(area);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 查询所有区域
	 * 
	 * @return 区域列表页
	 */
	@RequestMapping("selectArea")
	public String selectArea(Model model) {

		String str = "/area/areaList";
		try {
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据区域id,查找区域信息
	 * 
	 * @return 区域列表页
	 */
	@RequestMapping("selectAreaByid")
	public String selectAreaByid(int area_id, Model model) {
		String str = "/area/updatearea";
		try {
			Area area = areaServiceInf.selectAreaByid(area_id);
			model.addAttribute("area", area);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 根据区域id,修改区域信息
	 * 
	 * @return 区域列表页
	 */
	@RequestMapping("updateArea")
	public String updateQuyu(Area area, Model model) {

		String str = "/area/areaList";
		try {
			// 先更新
			areaServiceInf.updateArea(area);
			// 在查找所有
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
		} catch (Exception e) {
			str = "/error/error";
		}
		return str;
	}

	/*
	 * 
	 * 返回页面数据
	 * 
	 * @param returnString 返回数据
	 * 
	 * @throws CommonException 异常
	 * 
	 * response = ServletActionContext.getResponse();
	 * response.setContentType("application/json;charset=utf-8");
	 * response.getWriter().write(returnString); response.flushBuffer();
	 * response.getWriter().close();
	 * 
	 * 
	 */

}
