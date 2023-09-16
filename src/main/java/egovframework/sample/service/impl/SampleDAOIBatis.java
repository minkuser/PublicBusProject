package egovframework.sample.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.sample.service.SampleDAO;
import egovframework.sample.vo.BikeReservePlaceVO;
import egovframework.sample.vo.BikeVO;
import egovframework.sample.vo.ReservationVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("daoIBatis")
public class SampleDAOIBatis extends EgovAbstractMapper implements SampleDAO {

	@Override
	public List<BikeReservePlaceVO> selectBikePlace() throws Exception { // 대여소전체리스트

		return selectList("selectBikePlace");

	}

	@Override
	public List<BikeReservePlaceVO> selectSearchBikePlace(BikeReservePlaceVO search) { // 대여소검색리스트

		return selectList("selectSearchBikePlace", search);
	}

	@Override
	public int selectBikeCount(BikeVO bike) { // 대여가능 자전거 수

		return selectOne("selectBikeCount", bike);

	}

	@Override
	public int selectBikeId(BikeVO bike) { // 대여할 자전거번호

		return selectOne("selectBikeId", bike);

	}

	@Override
	public int insertReservation(ReservationVO rv) { // 예약처리

		return insert("insertReservation", rv);

	}

	@Override
	public int changeStatus(int bike_id) { // 자전거 예약 상태 변경

		return update("changeStatus", bike_id);
	}

	@Override
	public int selectBikeId2(String user_id) { // 세션 아이디로 바이크 아이디 찾기
		return selectOne("selectBikeId2", user_id);
	}

	@Override
	public void updateReservePlace(BikeVO bike) { // 반납시 대여소 변경
		update("updateReservePlace", bike);

	}

	@Override
	public int findReservePlaceId(String reservePlaceName) { // 대여소 이름으로 대여소 아이디 찾기
		return selectOne("findReservePlaceId", reservePlaceName);
	}

	@Override
	public int findReservePlaceByBikeId(int bike_id) { // 바이크 아이디로 대여소 아이디 찾기
		return selectOne("findReservePlaceByBikeId", bike_id);
	}

	@Override
	public String findReservePlaceName(int bike_reserve_place_id) { // 대여소 아이디로 대여소 이름 찾기
		return selectOne("findReservePlaceName", bike_reserve_place_id);
	}

	@Override
	public void deleteReserve(String user_id) { // 예약 내역 삭제
		delete("deleteReserve", user_id);

	}

	@Override
	public void changeStatusTrue(int bike_id) { // 자전거 예약 상태 변경
		update("changeStatusTrue", bike_id);
	}

	@Override
	public int checkReservation(ReservationVO rvCheck) { // 예약 내역 확인

		return selectOne("checkReservation", rvCheck);
	}

	@Override
	public void updateUser(String user_id) {
		update("updateUser1", user_id);
		
	}

}
