package egovframework.board.service;

import java.util.List;

public interface SampleDAO {
	
	
	List<BikeReservePlaceVO> selectBikePlace() throws Exception; // 대여소 전체 리스트

	List<BikeReservePlaceVO> selectSearchBikePlace(BikeReservePlaceVO reservePlaceName); //대여소 검색 리스트

	int selectBikeCount(BikeVO bike); //대여가능 자전거 수

	int selectBikeId(BikeVO bike); //대여할 자전거 번호
	
	int selectBikeId2(String user_id); // 아이디로 자전거 아이디 찾기
	
	int findReservePlaceId(String reservePlaceName);
	
	void updateReservePlace(BikeVO bike); // 바이크 아이디로 대여소 변경
 
	int insertReservation(ReservationVO rv); //예약 처리

	int changeStatus(int bike_id); //자전거 예약 상태 변경
	
	int findReservePlaceByBikeId(int bike_id); // 바이크 아이디로 대여소 이름 찾기
	
	String findReservePlaceName(int bike_reserve_place_id); // 바이크 대여소 아이디로 대여소 이름 찾기
	
	void deleteReserve(String user_id); // 예약 내역 삭제
	
	void changeStatusTrue(int bike_id); //자전거 예약 상태 변경
}