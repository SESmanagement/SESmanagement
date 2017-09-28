package com.spring.manage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.StudyRoomDAO;
import com.spring.manage.util.PageNavigator;
import com.spring.manage.vo.EventVO;
import com.spring.manage.vo.SR_FacilityVO;
import com.spring.manage.vo.SR_ReservationVO;
import com.spring.manage.vo.StudyRoomVO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService {//

	@Autowired
	private StudyRoomDAO dao;
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;

	@Override
	public ArrayList<StudyRoomVO> showInside(int studyroom_num) {
		return dao.showInside(studyroom_num);
	}

	@Override
	public void updateSeated_status() {
		dao.updateSeated_status();
	}
	
	@Override
	public ArrayList<SR_ReservationVO> srResvInfo(int studyroom_num) {
		ArrayList<SR_ReservationVO> srrList = dao.srResvInfo(studyroom_num);
		
		// 시작/종료시간 중 시간만 가지고 오기
		for (SR_ReservationVO srrVO : srrList) {
			String[] start_time_array = srrVO.getStart_time().split(" ");
			srrVO.setStart_time(start_time_array[1]);
			String[] end_time_array = srrVO.getEnd_time().split(" ");
			srrVO.setEnd_time(end_time_array[1]);
		}
		
		return srrList;
	}

	// 예약현황 조회시점의 시각 조회
	@Override
	public String getSysdate() {
		String sysdate = dao.getSysdate();
		return sysdate;
	}

	@Override
	public void resvApply(String[] resvApplyArr, int student_num) {
		List<SR_ReservationVO> resvList = new ArrayList<>();
		for (String resv : resvApplyArr) {
			// 스터디룸 넘버 / 좌석 번호 / 시작시간
			// 1:1:time1,      1:1:time3,    1:1:time2,     1:1:time4
			SR_ReservationVO resvVO = new SR_ReservationVO();
			String[] resvEachApply = resv.split(":");
			
			resvVO.setStudent_num(student_num); // 학생번호
			resvVO.setStudyroom_num(Integer.parseInt(resvEachApply[0])); // 스터디룸 번호
			resvVO.setSr_seat_num(Integer.parseInt(resvEachApply[1]));   // 좌석 번호
			
			// 예약 시작시간, 종료시간
			if (resvEachApply[2].equals("time1")) {
				resvVO.setStart_time("19:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("20:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time2")) {
				resvVO.setStart_time("20:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("21:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time3")) {
				resvVO.setStart_time("21:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("22:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				
			} else if (resvEachApply[2].equals("time4")) {
				resvVO.setStart_time("22:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
				resvVO.setEnd_time("23:00"); // db입력시 to_char(sysdate, 'yy/mm/dd') 입력 필요
			}
			
			// 배열 수만큼 예약 처리
			dao.resvApply(resvVO);
			
		} // for
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfo(int student_num) {
		return dao.myResvInfo(student_num);
	}

	@Override
	public ArrayList<SR_ReservationVO> myResvInfoAll(int student_num) {
		return dao.myResvInfoAll(student_num);
	}

	@Override
	public boolean cancelMySRR(String checkList) {
		String[] checkListArray = checkList.split(",");
		
		// 배열 수만큼 예약 취소 처리
		for (int i = 0; i < checkListArray.length; i++) {
			String sr_resv_num = checkListArray[i];
			// 취소할 예약 정보 (취소 처리 실패시 백업용)
			SR_ReservationVO resvVO = dao.getResvInfoBysr_resv_num(sr_resv_num);
			
			if (dao.cancelMySRR(sr_resv_num, resvVO) != 1) {
				dao.resvApplyAgain(resvVO);
				return false;
			}
		}
		
		return true;
	}

	@Override
	public ArrayList<StudyRoomVO> checkAvailableRoom(ArrayList<Integer> checkListList) {
		ArrayList<StudyRoomVO> resultList = new ArrayList<>(); // 최종 에약가능한 스터디룸 번호 모음
		resultList = dao.checkAvailableRoom(checkListList);
		return resultList; 
	}

	@Override
	public ArrayList<StudyRoomVO> nowAvailableRoom(String now_time) {
		return dao.nowAvailableRoom(now_time);
	}

	@Override
	public ArrayList<StudyRoomVO> getStudyRoomLocation() {
		return dao.getStudyRoomLocation();
	}

	@Override
	public ArrayList<SR_FacilityVO> getSRFacilityInfo(int studyroom_num) {
		return dao.getSRFacilityInfo(studyroom_num);
	}

	@Override
	public boolean inactivateSR_Seat(String selectedList) {
		// 좌석별로 나누기 (selectedList=1:9,1:8)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		SR_FacilityVO fcVO = new SR_FacilityVO();
		boolean parsable = true; // 부대시설의 경우에는 문자로 int 변환 실패한다.
		
		for (int i = 0; i < selectedListArray.length; i++) {
			// studyroom_num o sr_seat_num o room_x _ room_y
			String[] array = selectedListArray[i].split("o");
			
			//   <= 부대시설 (ex) selectedList=1o콘센트o36
			try {
				Integer.parseInt(array[1]); // 
			} catch (NumberFormatException e){
				parsable = false;
			} // catch
			
			if (parsable == false) {
				String[] fcArray = array[2].split("_");
				fcVO.setStudyroom_num(Integer.parseInt(array[0]));
				fcVO.setSeat_x(Integer.parseInt(fcArray[0]));
				fcVO.setSeat_y(Integer.parseInt(fcArray[1]));
				if (dao.inactivateFC_Facility(fcVO) != 1) {
					return false;
				} // if
			} else {
				// 스터디룸 처리
				srVO.setStudyroom_num(Integer.parseInt(array[0]));
				srVO.setSr_seat_num(Integer.parseInt(array[1]));
				if (dao.inactivateSR_Seat(srVO) != 1) {
					return false;
				} // if
			} // else
		} // for
		return true;
	}

	@Override
	public String addSR_Seat(String selectedList) {
		// 좌석별로 나누기 (selectedList=4o6o9_2o1__4)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		SR_FacilityVO fcVO = new SR_FacilityVO();
		
		for (int i = 0; i < selectedListArray.length; i++) {
			boolean parsable = true; // 부대시설의 경우에는 문자로 int 변환 실패한다.
			// studyroom_num o sr_seat_num o room_x _ room_y
			String[] array = selectedListArray[i].split("o");
			
			//   <= 부대시설 (ex) 4o콘센트o10_2o1__4
			try {
				System.out.println("서비스임플: " + array[1]);
				Integer.parseInt(array[1]); // 
			} catch (NumberFormatException e){
				parsable = false;
			} // catch
			
			// 부대시설 등록
			if (parsable == false) {
				String[] fcArray = array[2].split("_");
				fcVO.setStudyroom_num(Integer.parseInt(array[0]));
				fcVO.setFacility_name(array[1]);
				fcVO.setSeat_x(Integer.parseInt(fcArray[0]));
				fcVO.setSeat_y(Integer.parseInt(fcArray[1]));
				if (dao.addFC_Facility(fcVO) != 1) {
					return "false";
				} // if
			} else if (parsable == true) {
				// 좌석 등록
				String[] seatArray = array[2].split("_");
				String[] roomArray = array[3].split("__");
				srVO.setStudyroom_num(Integer.parseInt(array[0]));
				srVO.setSr_seat_num(Integer.parseInt(array[1]));
				
				// 해당 스터디룸의 해당 좌석번호가 이미 존재할 경우 등록 불가 처리
				if (dao.checkSeat_num(srVO) == null) {
					srVO.setSeat_x(Integer.parseInt(seatArray[0]));
					srVO.setSeat_y(Integer.parseInt(seatArray[1]));
					srVO.setRoom_x(Integer.parseInt(roomArray[0]));
					srVO.setRoom_y(Integer.parseInt(roomArray[1]));
					if (dao.addSR_Seat(srVO) != 1) {
						return "false";
					} // if
				} else return "duplicated";
			} // else
		} // for
		return "true";
	}

	@Override
	public String dropSR_Seat(String selectedList) {
		// 좌석별로 나누기 (selectedList=1:9,1:8)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		SR_FacilityVO fcVO = new SR_FacilityVO();
		boolean parsable = true; // 부대시설의 경우에는 문자로 int 변환 실패한다.
		
		for (int i = 0; i < selectedListArray.length; i++) {
			// studyroom_num o sr_seat_num o room_x _ room_y
			String[] array = selectedListArray[i].split("o");
			
			//   <= 부대시설 (ex) selectedList=1o콘센트o36
			try {
				Integer.parseInt(array[1]); // 
			} catch (NumberFormatException e){
				parsable = false;
				System.out.println("서비스 임플: " + array[1] +": 실패");
			} // catch
			
			if (parsable == false) {
				String[] fcArray = array[2].split("_");
				fcVO.setStudyroom_num(Integer.parseInt(array[0]));
				fcVO.setSeat_x(Integer.parseInt(fcArray[0]));
				fcVO.setSeat_y(Integer.parseInt(fcArray[1]));
				if (dao.dropFC_Facility(fcVO) != 1) {
					return "false";
				} // if
			} else {
				// 스터디룸 처리
				srVO.setStudyroom_num(Integer.parseInt(array[0]));
				srVO.setSr_seat_num(Integer.parseInt(array[1]));
				if (dao.dropSR_Seat(srVO) != 1) {
					return "false";
				} // if
			} // else
		} // for
		return "true";
	}

	@Override
	public boolean inactivateSR(String selectedList) {
		// 스터디룸별로 나누기 (selectedList=4)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		SR_FacilityVO fcVO = new SR_FacilityVO();
		
		for (int i = 0; i < selectedListArray.length; i++) {
			// 해당 스터디룸 내 전부대시설 비활성화 처리 - 부대시설이 없을 수도 있음으로 리턴값 체크X
			fcVO.setStudyroom_num(Integer.parseInt(selectedListArray[i]));
			dao.inactivateFC(fcVO);
			
			// 해당 스터디룸 내 전좌석 비활성화 처리
			srVO.setStudyroom_num(Integer.parseInt(selectedListArray[i]));
			if (dao.inactivateSR(srVO) == 0) {
				return false;
			} // if

		} // for
		
		return true;
	}

	@Override
	public String addSR(String selectedList) {
		// 스터디룸별로 나누기 (selectedList=4)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		
		for (int i = 0; i < selectedListArray.length; i++) {
			// 스터디룸 번호 등록
			String[] array = selectedListArray[i].split("o");
			srVO.setStudyroom_num(Integer.parseInt(array[0]));
			if (dao.checkSeat_num(srVO) == null) {
				
				// 스터디룸 좌표 등록
				String[] idArray = array[1].split("__");
				srVO.setRoom_x(Integer.parseInt(idArray[0]));
				srVO.setRoom_y(Integer.parseInt(idArray[1]));
				if (dao.addSR(srVO) == 0) {
					return "false";
				} // if
			} else {
				return "duplicated";
			}
		} // for
		
		return "true";
	}

	@Override
	public String dropSR(String selectedList) {
		// 스터디룸별로 나누기 (selectedList=4)
		String[] selectedListArray = selectedList.split(",");
		StudyRoomVO srVO = new StudyRoomVO();
		SR_FacilityVO fcVO = new SR_FacilityVO();
		
		for (int i = 0; i < selectedListArray.length; i++) {
			// 해당 스터디룸 내 전부대시설 삭제 처리 - 부대시설이 없을 수도 있음으로 리턴값 체크X
			fcVO.setStudyroom_num(Integer.parseInt(selectedListArray[i]));
			dao.dropFC(fcVO);
			// 스터디룸 삭제
			srVO.setStudyroom_num(Integer.parseInt(selectedListArray[i]));
			if (dao.dropSR(srVO) == 0) {
				return "false";
			} // if
		} // for
		return "true";
	}

	@Override
	public HashMap<String, Object> getResvList(ArrayList<String> studyroom_checkList,
			ArrayList<String> date_checkList, ArrayList<String> etc_checkList, int currentPage) {
		HashMap<String, Object> returnMap = new HashMap<>();
		HashMap map = new HashMap(); // mapper에 넘길 값을 담을 맵
		ArrayList<HashMap> etc_checkListList = new ArrayList<>(); // mapper에 넘길 etc_checkList
		map.put("studyroom_checkList", studyroom_checkList);
		map.put("date_checkList", date_checkList);
		
		if (etc_checkList != null) {
			for (int i = 0; i < etc_checkList.size(); i++) {
				String option = etc_checkList.get(i).split(":")[0];
				Object keyword = null;
				if (!option.equals("name")) { // 이름을 제외한 좌석번호, 학번, 기수는 숫자로 처리
					keyword = Integer.parseInt(etc_checkList.get(i).split(":")[1]);
				} else keyword = etc_checkList.get(i).split(":")[1];
				
				HashMap<String, Object> etc_map = new HashMap(); // key값이 중복이 안되니까.. 보류!!!
				etc_map.put(option, keyword);
				
				etc_checkListList.add(etc_map);
			}
		}
		
		map.put("etc_checkListList", etc_checkListList);
		
		// 페이징 하기
		int totalRecordsCount = dao.getTotal(map);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount); // navi 생성
		ArrayList<SR_ReservationVO> resvList = dao.getResvList(map, navi.getStartRecord(), navi.getCountPerPage()); // navi 생성 후 페이징 하여 목록 가져오기

		
		returnMap.put("resvList", resvList); // 조회 결과
		returnMap.put("navi", navi);		 // 페이징
		return returnMap;
	}

}
