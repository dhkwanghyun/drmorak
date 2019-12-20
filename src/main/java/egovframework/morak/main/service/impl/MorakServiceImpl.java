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
package egovframework.morak.main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.morak.cmmn.util.FileUtils;
import egovframework.morak.main.service.MorakService;
import egovframework.morak.main.service.MorakVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("morakService")
public class MorakServiceImpl extends EgovAbstractServiceImpl implements MorakService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MorakServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	//@Resource(name = "sampleDAO")
	//private SampleDAO sampleDAO;
	// TODO mybatis 사용
	@Resource(name="morakMapper")
	private MorakMapper morakDAO;
	
	//fileUtil
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public int reserveInsert(MorakVO morakVO) {
		morakDAO.reserveInsert(morakVO);
		return 0;
	}

	@Override
	public List<?> selectReserveList(MorakVO morakVO) {
		return morakDAO.selectReserveList(morakVO);
	}

	@Override
	public List<?> selectBranchList(MorakVO morakVO) {
		return morakDAO.selectBranchList(morakVO);
	}

	@Override
	public int loginSelect(MorakVO morakVO) {
		return morakDAO.loginSelect(morakVO);
	}

	

}
