package com.haeyo.biz.reservation;

import com.haeyo.biz.profession.ReviewsVO;

public interface ReservationService {
	//예약정보 넣기
	public void insertReservaiton(ReservationVO vo);
	
	public String application(ReservationCategoryVO vo);
	
	//결제알림 인서트
	public void insertAlram(alramVO vo);
	
	//리뷰 업데이트
	public ReviewsVO ajaxReview(ReviewsVO vo);
	
}
