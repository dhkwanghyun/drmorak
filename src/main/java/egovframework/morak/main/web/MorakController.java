/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.morak.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.morak.main.service.MorakService;
import egovframework.morak.main.service.MorakVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class MorakController {

	/** EgovSampleService */
	@Resource(name = "morakService")
	private MorakService morakService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("morakVO") MorakVO morakVO, ModelMap model) throws Exception {
		List<?> branchList =  morakService.selectBranchList(morakVO);
		model.addAttribute("branchList", branchList);
		return "main/main";
	}
	
	
	@RequestMapping(value = "/main/reserveInsert.ajax" , method = RequestMethod.POST)
	public ModelAndView reserveInsert(@ModelAttribute("morakVO") MorakVO morakVO, ModelMap model) throws Exception {
		int scode = morakService.reserveInsert(morakVO);
		Map<String,Object> hashMap = new HashMap<>();
		if(scode==0){
			hashMap.put("code", "Y");
		}else{
			hashMap.put("code", "N");
		}
		ModelAndView modelAndView = new ModelAndView("jsonView",hashMap);
		return modelAndView;
	}
	
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("morakVO") MorakVO morakVO, ModelMap model) throws Exception {
		return "login/login";
	}
	
	@RequestMapping(value = "/login/login.ajax" , method = RequestMethod.POST)
	public ModelAndView loginSelect(@ModelAttribute("morakVO") MorakVO morakVO,HttpServletRequest request, ModelMap model) throws Exception {
		int check = morakService.loginSelect(morakVO);
		
		Map<String,Object> hashMap = new HashMap<>();
		if(check>0){
			HttpSession session = request.getSession();
			session.setAttribute("login", "ok");
			hashMap.put("code", "Y");
		}else{
			hashMap.put("code", "N");
		}
		
		ModelAndView modelAndView = new ModelAndView("jsonView",hashMap);
		return modelAndView;
	}
	
	@RequestMapping(value = "/reserveList.do")
	public String selectReserveList(@ModelAttribute("morakVO") MorakVO morakVO,HttpServletRequest request, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("login");
		if(login == null){
			return "redirect:login.do";
		}
		List<?> branchList =  morakService.selectBranchList(morakVO);
		List<?> morakList =  morakService.selectReserveList(morakVO);
		model.addAttribute("morakVO", morakVO);
		model.addAttribute("branchList", branchList);
		model.addAttribute("morakList", morakList);
		return "reserve/reserveList";
	}

}
