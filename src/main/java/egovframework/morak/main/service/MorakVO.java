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
package egovframework.morak.main.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class MorakVO extends MorakDefaultVO {
	
	/**예약자 예약지점 */
	private String loginId;
	private String loginPw;

	/**예약자 예약지점 */
	private String reserveBranch;

	/**예약자 예약날짜 */
	private String reserveDateDay;

	/**예약자 이름 */
	private String reserveName;

	/**예약자 핸드폰번호*/
	private String reservePhone;

	/**예약자 사용 쿠폰 */
	private String reserveCoupon;
	
	/**예약자 내용 */
	private String reserveContent;
	
	//검색
	private String srchType; 
	private String srchInputText;
	private String srchBranch;
	
	

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPw() {
		return loginPw;
	}

	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}

	public String getReserveBranch() {
		return reserveBranch;
	}

	public void setReserveBranch(String reserveBranch) {
		this.reserveBranch = reserveBranch;
	}

	public String getReserveDateDay() {
		return reserveDateDay;
	}

	public void setReserveDateDay(String reserveDateDay) {
		this.reserveDateDay = reserveDateDay;
	}

	public String getReserveName() {
		return reserveName;
	}

	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}

	public String getReservePhone() {
		return reservePhone;
	}

	public void setReservePhone(String reservePhone) {
		this.reservePhone = reservePhone;
	}

	public String getReserveCoupon() {
		return reserveCoupon;
	}

	public void setReserveCoupon(String reserveCoupon) {
		this.reserveCoupon = reserveCoupon;
	}

	public String getReserveContent() {
		return reserveContent;
	}

	public void setReserveContent(String reserveContent) {
		this.reserveContent = reserveContent;
	}

	public String getSrchType() {
		return srchType;
	}

	public void setSrchType(String srchType) {
		this.srchType = srchType;
	}

	public String getSrchInputText() {
		return srchInputText;
	}

	public void setSrchInputText(String srchInputText) {
		this.srchInputText = srchInputText;
	}

	public String getSrchBranch() {
		return srchBranch;
	}

	public void setSrchBranch(String srchBranch) {
		this.srchBranch = srchBranch;
	}
	
	
	
}
