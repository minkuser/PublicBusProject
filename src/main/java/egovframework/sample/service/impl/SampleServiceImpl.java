package egovframework.sample.service.impl;

import egovframework.sample.service.SampleDAO;
import egovframework.sample.service.SampleService;
import egovframework.sample.vo.BikeReservePlaceVO;
import egovframework.sample.vo.BikeVO;
import egovframework.sample.vo.ReservationVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("sampleService")
public class SampleServiceImpl implements SampleService {

	@Resource(name = "daoIBatis")
	private SampleDAO sampleDAO;

	public SampleServiceImpl() {

	}

	@Override
	public List<BikeReservePlaceVO> selectBikePlace() throws Exception { // 대여소전체리스트

		return sampleDAO.selectBikePlace();
	}

	@Override
	public List<BikeReservePlaceVO> selectSearchBikePlace(BikeReservePlaceVO reservePlaceName) { // 대여소검색리스트

		return sampleDAO.selectSearchBikePlace(reservePlaceName);
	}

	@Override
	public int selectBikeCount(BikeVO bike) { // 대여가능 자전거 수

		return sampleDAO.selectBikeCount(bike);
	}

	@Override
	public int selectBikeId(BikeVO bike) { // 대여할 자전거 번호

		return sampleDAO.selectBikeId(bike);
	}

	@Override
	public int insertReservation(ReservationVO rv) { // 예약처리

		return sampleDAO.insertReservation(rv);

	}

	@Override
	public int changeStatus(int bike_id) { // 자전거 예약 상태 변경

		return sampleDAO.changeStatus(bike_id);

	}

	@Override
	public int selectBikeId2(String user_id) { // 아이디로 자전거 아이디 받기
		return sampleDAO.selectBikeId2(user_id);
	}

	@Override
	public void updateReservePlace(BikeVO bike) { // 대여소 이름 변경
		sampleDAO.updateReservePlace(bike);

	}

	@Override
	public int findReservePlaceId(String reservePlaceName) { // 대여소 이름으로 대여소 아이디 찾기
		return sampleDAO.findReservePlaceId(reservePlaceName);
	}

	@Override
	public int findReservePlaceByBikeId(int bike_id) { // 바이크 아이디로 대여소 아이디 찾기
		return sampleDAO.findReservePlaceByBikeId(bike_id);
	}

	@Override
	public String findReservePlaceName(int bike_reserve_place_id) { // 대여소 아이디로 대여소 이름 찾기
		return sampleDAO.findReservePlaceName(bike_reserve_place_id);
	}

	@Override
	public void deleteReserve(String user_id) { // 예약 내역 삭제
		sampleDAO.deleteReserve(user_id);

	}

	@Override
	public void changeStatusTrue(int bike_id) { // 자전거 예약 상태 변경
		sampleDAO.changeStatusTrue(bike_id);

	}

	@Override
	public int checkReservation(ReservationVO rvCheck) { // 예약 내역 확인

		return sampleDAO.checkReservation(rvCheck);
	}

	@Override
	public void updateUser(String user_id) {
		sampleDAO.updateUser(user_id);
		
	}

}
