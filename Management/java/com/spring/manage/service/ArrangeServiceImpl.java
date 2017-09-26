package com.spring.manage.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.manage.dao.ArrangeDAO;
import com.spring.manage.vo.ArrangeVO;
import com.spring.manage.vo.ClassRoomVO;
import com.spring.manage.vo.Exam_ScoreVO;
import com.spring.manage.vo.MemberVO;
import com.spring.manage.vo.Member_NoteVO;
import com.spring.manage.vo.PartyVO;
import com.spring.manage.vo.Room_StatusVO;

@Service
public class ArrangeServiceImpl implements ArrangeService {

	@Autowired
	private ArrangeDAO dao;

	@Override
	public ArrayList<ClassRoomVO> getClassRoom() {
		return dao.getClassRoom();
	}

	@Override
	public ArrayList<PartyVO> getPartyList() {
		return dao.getPartyList();
	}

	@Override
	public void updateRoom(ClassRoomVO room) {

		// 강의실 정보 입력
		dao.updateRoom(room);

		// 강의실 상태 업데이트

		// 강의실 좌석 전체 갯수
		int totalSeat = room.getHeight() * room.getWidth();

		// 해당 강의실 상태 초기화
		dao.deleteSeat(room);

		// 해당 강의실 상태 좌석값 입력
		Room_StatusVO status = new Room_StatusVO();
		for (int i = 0; i < totalSeat; i++) {
			status.setClassRoom_num(room.getNum());
			status.setSeat(i);
			status.setServiceable(0);
			dao.insertSeat(status);
		}

	}

	@Override
	public ArrayList<Room_StatusVO> getRoom_Status(int classRoom_num) {
		ArrayList<Room_StatusVO> status = dao.getRoom_Status(classRoom_num);
		return status;
	}

	@Override
	public ClassRoomVO selectRoom(int num) {
		return dao.selectRoom(num);
	}

	@Override
	public ArrayList<Room_StatusVO> changeServiceAble(Room_StatusVO status) {
		if (status.getServiceable() == 0) {
			status.setServiceable(1);
			System.out.println("Service able 0->1");
			if (dao.changeServiceAble(status) == 0) {
				System.out.println("실패");
				return null;
			}
		} else {
			System.out.println("Service able 1->0");
			status.setServiceable(0);
			dao.changeServiceAble(status);
			if (dao.changeServiceAble(status) == 0) {
				System.out.println("실패");
				return null;
			}
		}

		return dao.getRoom_Status(status.getClassRoom_num());

	}

	@Override
	public ArrayList<ClassRoomVO> callRooms(int num) {
		return dao.callRooms(num);
	}

	@Override
	public int countPartyMember(int party_num) {
		return dao.countPartyMember(party_num);
	}

	@Override
	public ArrayList<ArrangeVO> ArrangeClass(int party_num) {
		// 1. 사람을 뽑아온다
		// 2. 배당된 강의실을 뽑아온다.
		// 3. 시험 성적을 뽑아온다.
		// 4. 불편한 사람을 뽑아온다.

		// 방 뽑아오기
		ArrayList<ClassRoomVO> roomList = dao.callRooms(party_num);
		// 사람 뽑아오기
		ArrayList<MemberVO> memberList = dao.callMember(party_num);
		// 성적 뽑아오기 - 전체 성적을 뽑아왔다. - 학번으로 개인성적 뽑아내야한다.
		ArrayList<Exam_ScoreVO> totalScoreList = dao.callScore();
		// 상담 이력 뽑아오기 - 모든 상담이력을 뽑아왔다.
		ArrayList<Member_NoteVO> totalNoteList = dao.callNote();

		// 해당 방마다의 사용여부의 총 갯수
		// String - 방이름, Integer - 해당 방의 사용가능 좌석 갯수
		Map<Integer, Integer> arrServ = new HashMap<>();
		// System.out.println("선언값1" + arrServ.entrySet());
		// 강의실 나누기 - 강의실을 나누되 사용가능 여부를 뽑아와 연산수행
		int count = 0;
		for (int i = 0; i < roomList.size(); i++) {
			ArrayList<Room_StatusVO> service = dao.getRoom_Status(roomList.get(i).getNum());
			// System.out.println("service"+service);

			arrServ.put(roomList.get(i).getNum(), dao.countService(roomList.get(i).getNum()));
			// System.out.println("roomList.get(i).getNum() :
			// "+roomList.get(i).getNum());

		}
		// ----------------------------- 방배치 완료
		// System.out.println("방배치 완료 : " + arrServ.entrySet());

		// 멤버섞기
		// Collections.shuffle(memberList);

		// IT 평균
		// int totalIT1 = 0;
		// int totalIT2 = 0;
		// int totalIT3 = 0;
		// int totalJap1 = 0;
		// int totalJap2 = 0;
		// int totalJap3 = 0;

		// 성적 가지고 오기
		// for(int i = 0 ; i < memberList.size() ; i++){
		// System.out.println(i+"번째 : " + memberList.get(i).getStudent_num() +"
		// : "+ memberList.get(i).getName() +" : ");
		// }
		ArrayList<ArrangeVO> arrList = new ArrayList<>();
		for (int i = 0; i < memberList.size(); i++) {
			for (int j = 0; j < totalScoreList.size(); j++) {
				if (memberList.get(i).getStudent_num() == totalScoreList.get(j).getStudent_num()) {
					ArrangeVO vo = new ArrangeVO(memberList.get(i).getParty_num(), memberList.get(i).getStudent_num(),
							memberList.get(i).getName(), totalScoreList.get(j).getIt_1(),
							totalScoreList.get(j).getIt_2(), totalScoreList.get(j).getIt_3(),
							totalScoreList.get(j).getJap_1(), totalScoreList.get(j).getJap_2(),
							totalScoreList.get(j).getJap_3(), totalScoreList.get(j).getLive_score(), 0, 0,
							(totalScoreList.get(j).getIt_1() + totalScoreList.get(j).getJap_1()),
							(totalScoreList.get(j).getIt_2() + totalScoreList.get(j).getJap_2()),
							(totalScoreList.get(j).getIt_3() + totalScoreList.get(j).getJap_3()));

					arrList.add(vo);
					// totalIT1 += totalScoreList.get(j).getIt_1();
					// totalIT2 += totalScoreList.get(j).getIt_2();
					// totalIT3 += totalScoreList.get(j).getIt_3();
					// totalJap1 += totalScoreList.get(j).getJap_1();
					// totalJap2 += totalScoreList.get(j).getJap_2();
					// totalJap3 += totalScoreList.get(j).getJap_3();
				}

			}
		}

		// 성적 낮은순부터 입력
		// Collections.sort(arrList, new DescendingMember());
		// 내림차순
		Collections.sort(arrList, new AscendingMember());
		// for(int i = 0 ; i < arrList.size() ; i++){
		// System.out.println(i +"번째 : "+arrList.get(i).getName() +" :
		// "+arrList.get(i).getStudent_num());
		// }

		int arrSize = arrList.size(); // 사람수
		// 각 방의 자리수

		int value1 = 0;
		int value2 = arrList.size() - 1;

		// 사람 수가 0명이 될때까지 돌린다.
		boolean exit = false;

		while (!exit) {
			// 각방에 배치해주기 위해 방이 4개면
			// 4개의 방에 각각 배치해준다.
			for (int i = 0; i < roomList.size(); i++) {
				if (value1 == value2) {
					exit = true;
				}
				if (arrSize == 0) { // 사람수가 0명이 되면 while문을 멈춘다.
					exit = true;
				}
				if (arrServ.get(roomList.get(i).getNum()) > 0) { // 해당 번호의 방의 남은
																	// 좌석수가 0보다
																	// 크면 입력
					int key = roomList.get(i).getNum(); // 해당 좌석 번호 arrServ -
														// 방번호 / 남은 좌석
					int size = arrServ.get(roomList.get(i).getNum());
					// System.out.println("오름 ~");
					arrList.get(value1).setClassroom_num(roomList.get(i).getNum());
					// System.out.println("1번째 i :"+i+",이름 : " +
					// arrList.get(value1).getName() + ", 방번호 :
					// "+arrList.get(i).getClassroom_num());
					value1++;
					arrSize--;
					arrServ.replace(key, size - 1);
					// System.out.println("사람수 : "+arrSize);
					// System.out.println(arrServ.entrySet());
				} else {
					// System.out.println("일로 넘어옴? 1");
				}
			}
			for (int i = roomList.size() - 1; i >= 0; i--) {

				if (arrSize == 0) {
					exit = true;
					break;
				} // 사람들이 모두 배치되면 자리 배치 종료
				if (arrServ.get(roomList.get(i).getNum()) > 0) { // 남은 자리가 없으면
																	// 다음번으로
																	// 넘어간다.
					// System.out.println("내름~");
					int key = roomList.get(i).getNum();
					int size = arrServ.get(roomList.get(i).getNum());
					arrList.get(value2).setClassroom_num(roomList.get(i).getNum());
					// System.out.println("2번째 i :"+i+",이름 : " +
					// arrList.get(i).getName() + ", 방번호 :
					// "+arrList.get(i).getClassroom_num());
					value2--;
					arrSize--;
					arrServ.replace(key, size - 1);
					// System.out.println("사람수 : "+arrSize);
					// System.out.println(arrServ.entrySet());
				} else {
					// System.out.println("일로 넘어옴? 2");
				}
			}
			// System.out.println("이리로 넘어옴?");
		}

		// System.out.println("exit : " + arrList);
		// System.out.println(arrServ.entrySet());
		// for(int i = 0 ; i < arrList.size() ; i++){
		// System.out.println("i 몇번 도냐?" + i);
		// System.out.println("왜 87번만 나옴? arrList : " +arrList.size());
		// System.out.println("학번 : "+arrList.get(i).getStudent_num()+" 이름 :
		// "+arrList.get(i).getName() + " 강의실 :
		// "+arrList.get(i).getClassroom_num() + " 성적 :
		// "+arrList.get(i).getTotalIJ1());
		// }
		// System.out.println(arrList);
		// 여기서 결과값은 arrList가 나온다 성적순대로 입력되어있다.
		// 차후에 이 arrList는 1차 2차 3차 각각의 메서드로 나눈다.
		//
		// 이제 방안에 싫어하는 사람이 있는지 대조한다.
		// 싫어하는 사람이 있을경우 그방에 있는 사람이 있는지 확인한다.
		// 있을 경우 새로운 배열을 만들어 특이사항이 있는 사람들을 모두 담는다

		ArrayList<ArrangeVO> unNormally = new ArrayList<>();

		for (int i = 0; i < arrList.size(); i++) {
			for (int j = 0; j < totalNoteList.size(); j++) {
				if (arrList.get(i).getStudent_num() == totalNoteList.get(j).getStudent_number()) {
					if (totalNoteList.get(j).getHate_student_num() != 0) {
						// 비교해라
						for (int a = 0; a < arrList.size(); a++) {
							// 싫어하는 사람과 싫어함을 당하는 사람과
							// 같은 방일 경우 한명을 다른반으로 옮겨준다.
							if (totalNoteList.get(j).getHate_student_num() == arrList.get(a).getStudent_num()) {
								if (arrList.get(i).getClassroom_num() == arrList.get(a).getClassroom_num()) {
									// 새로운 배열에 담았다.
									// 멤버에 배당된 자리를 없애고 쓸수있는 자리를 하나 늘려준다. - 취소
									unNormally.add(arrList.get(i));
									// int key =
									// arrList.get(i).getClassroom_num();
									// int value = arrServ.get(key);
									// arrServ.replace(key,value+1);
									// arrList.get(i).setClassroom_num(0);

								}
							}
						}
					}
				}
			}
		}

		// for(ArrangeVO vo : unNormally){
		// System.out.println("언노말리 : "+ vo.getName() + " : " +
		// vo.getClassroom_num() + " : " + vo.getStudent_num());
		// }

		// 정리된 방에 싫어하는 사람들끼리 배치 안되게 해준다.

		// 싫어하는 대상 :
		// 1.한명이 여러명을 싫어할 경우
		// 2.여러명이 한명을 싫어할 경우
		// 3.얽히고 섞여 혼종이 탄생될경우 - 답이 없다.

		// 1단계.
		// 상담한 사람을 빼오고 - 싫어하는 사람을 적었는지 체크
		// 적힌 사람이 있으면 그 사람들을 체크해준다. - 한명이 여러번 상담할 경우가 있으니 array로 체크해준다.

		// 2단계
		// 한명에 대해 싫어하는 사람들 배열로 가지고 온다.
		// 싫어하는 사람들이 같은 방에 없을 경우
		// 방의 사이즈를 확인하고 배치 해준다.
		// else
		// 방에 사람이 있을경우
		// 싫어하는 사람들을 다른방으로 성적을 확인후에 배치해준후,
		// 다른 방 사람들을 이 방에 배치한다.
		// 배치가 되어지면 방에 사람이 있나 없나 확인하고 넣어준다.
		// 단 이것은 랜덤으로 설정되어진다.

		// etc
		// 여러명이 한명을 싫어할 경우 배치해준다.
		// 어쩔수없다. 모든건 운에 난 수학을 못해 그냥 써

		ArrayList<Integer> indexList = new ArrayList<>();
		for (int tempIndex = 0; tempIndex < roomList.size(); tempIndex++) {
			indexList.add(roomList.get(tempIndex).getNum());
		}

		int countRoom = 0;
		for (int i = 0; i < unNormally.size(); i++) {
			// System.out.println("니 사이즈 몇인데 아이야 ?" + unNormally.size());
			// System.out.println("아이야 돌아가니?"+i);

			// 싫어하는 대상 - 반대는 상담하는 사람 적은 대상 unNormally
			ArrayList<ArrangeVO> arrHate = new ArrayList<>();
			for (int j = 0; j < totalNoteList.size(); j++) { // 전체상담이력 - 객 학번마다
																// 싫어하는 사람이 적혀있따
																// 2번 상담받고 2명 싫다
																// 2번 이력나온다.
				for (int a = 0; a < unNormally.size(); a++) { // 상담받은사람VO가 있다 -
																// 예> 록담이 선혜누나
																// 성현이가 상담받았을 때
																// 3개의 크기,
					if (unNormally.get(i).getStudent_num() == unNormally.get(a).getStudent_num()) {
						if (unNormally.get(a).getStudent_num() == totalNoteList.get(j).getStudent_number()) {
							if (totalNoteList.get(j).getHate_student_num() != 0) {
								for (int z = 0; z < arrList.size(); z++) {
									if (totalNoteList.get(j).getHate_student_num() == arrList.get(z).getStudent_num()) {
										boolean result00 = true;
										for (int b = 0; b < arrHate.size(); b++) {
											if (arrHate.get(b).getStudent_num() == arrList.get(z).getStudent_num()) {
												result00 = false;
											}
										}
										if (result00) {
											arrHate.add(arrList.get(z));
										}
									}
								}
							}
						}
					}
				}
			}

			// System.out.println(" 애가 타겟 : " + unNormally.get(i).getName()+" :
			// "+unNormally.get(i));
			// System.out.println(" 애가 누구 싫어하는데 :"+ arrHate);

			boolean result1 = false;
			for (int j = 0; j < roomList.size(); j++) {
				if (arrHate != null) {
					if (unNormally.get(i).getClassroom_num() == roomList.get(j).getNum()) {
						for (int z = 0; z < arrHate.size(); z++) {
							if (roomList.get(j).getNum() != arrHate.get(z).getClassroom_num()) {
								result1 = true;
							}
						}
					}
				}
			}

			if (!result1) {
				// System.out.println("일로 들어왔으면 중복되는 값이 있따는 거!");
				int num = 0; // 최소값의 자릿값
				// ArrayList<Integer> hateClassRoom = new ArrayList<>();
				int temp0 = 0, temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0, temp7 = 0, temp8 = 0,
						temp9 = 0, temp10 = 0, temp11 = 0; // 해당되는 싫어하는 사람이 해당
															// 강의실에 있을경우

				// 싫어하는 사람들이 들어간 강의실 번호
				ArrayList<Integer> tempHate = new ArrayList<>();

				// 싫어하는 사람들의 각자의 방에서
				// 최소한이 인원이 있는 곳을 옮겨준다.
				for (int r = 0; r < arrHate.size(); r++) {
					if (arrHate.get(r).getClassroom_num() == 0) {
						if (temp0 == 0) {
							tempHate.add(0);
						}
						temp0++;

					} else if (arrHate.get(r).getClassroom_num() == 1) {
						if (temp1 == 0) {
							tempHate.add(1);
						}
						temp1++;

					} else if (arrHate.get(r).getClassroom_num() == 2) {
						if (temp2 == 0) {
							tempHate.add(2);
						}
						temp2++;

					} else if (arrHate.get(r).getClassroom_num() == 3) {
						if (temp3 == 0) {
							tempHate.add(3);
						}
						temp3++;

					} else if (arrHate.get(r).getClassroom_num() == 4) {
						if (temp4 == 0) {
							tempHate.add(4);
						}
						temp4++;

					} else if (arrHate.get(r).getClassroom_num() == 5) {
						if (temp5 == 0) {
							tempHate.add(5);
						}
						temp5++;

					} else if (arrHate.get(r).getClassroom_num() == 6) {
						if (temp6 == 0) {
							tempHate.add(6);
						}
						temp6++;

					} else if (arrHate.get(r).getClassroom_num() == 7) {
						if (temp7 == 0) {
							tempHate.add(7);
						}
						temp7++;

					} else if (arrHate.get(r).getClassroom_num() == 8) {
						if (temp8 == 0) {
							tempHate.add(8);
						}
						temp8++;

					} else if (arrHate.get(r).getClassroom_num() == 9) {
						if (temp9 == 0) {
							tempHate.add(9);
						}
						temp9++;

					} else if (arrHate.get(r).getClassroom_num() == 10) {
						if (temp10 == 0) {
							tempHate.add(10);
						}
						temp10++;

					} else if (arrHate.get(r).getClassroom_num() == 11) {
						if (temp11 == 0) {
							tempHate.add(11);
						}
						temp11++;

					} else {
						// System.out.println("여기도 들어온다고???");
					}

				}
				int[] tempValue = new int[tempHate.size()];
				// System.out.println("tempvalue "+tempValue);
				int[] tempValue2 = { temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10,
						temp11 };
				// for(int aa=0 ; aa< tempValue2.length ; aa++){
				// System.out.println("사이즈 : " + tempHate.size());
				// System.out.println("temp값 : "+aa+"번째 : " + tempValue2[aa]);
				// System.out.println("i : " + i);
				// System.out.println("j : " + j);
				// System.out.println("결과값 : unNor" + unNormally.get(i));
				// System.out.println("결과값 : roomL" + roomList.get(j));
				// }

				for (int r = 0; r < tempHate.size(); r++) {
					// System.out.println("헤이트다 : " + tempHate.get(r));
					if (tempHate.get(r) == 0) {
						tempValue[r] = temp0;
					} else if (tempHate.get(r) == 1) {
						tempValue[r] = temp1;
					} else if (tempHate.get(r) == 2) {
						tempValue[r] = temp2;
					} else if (tempHate.get(r) == 3) {
						tempValue[r] = temp3;
					} else if (tempHate.get(r) == 4) {
						tempValue[r] = temp4;
					} else if (tempHate.get(r) == 5) {
						tempValue[r] = temp5;
					} else if (tempHate.get(r) == 6) {
						tempValue[r] = temp6;
					} else if (tempHate.get(r) == 7) {
						tempValue[r] = temp7;
					} else if (tempHate.get(r) == 8) {
						tempValue[r] = temp8;
					} else if (tempHate.get(r) == 9) {
						tempValue[r] = temp9;
					} else if (tempHate.get(r) == 10) {
						tempValue[r] = temp10;
					} else if (tempHate.get(r) == 11) {
						tempValue[r] = temp11;
					}
				}
				for (int aa = 0; aa < tempHate.size(); aa++) {
					// System.out.println("이게 중요 : "+aa+"번 : "+
					// tempHate.get(aa)); //싫어하는 사람 번호.
				}
				// for(int aa = 0 ; aa<tempValue.length; aa++){
				// System.out.println(tempValue[aa]);
				// }
				// System.out.println("tempValue Size : "+tempValue.length);

				int min = tempValue[0];

				for (int r = 0; r < tempValue.length; r++) {
					if (tempValue[r] < min) {
						min = tempValue[r];
					}
				}

				for (int r = 0; r < tempValue2.length; r++) {
					if (tempValue2[r] == min) {
						num = r;
					}
				}

				// System.out.println("min : " + min); // 최솟값
				// System.out.println("num 최종: "+ num); //싫어하는 사람 번호.
				for (int r = 0; r < arrHate.size(); r++) {
					System.out.println(arrHate.get(r));
				}
				// 싫어하는 사람?
				for (int r = 0; r < arrHate.size(); r++) {
					if (arrHate.get(r).getClassroom_num() == num) {
						boolean happy = false;
						// System.out.println(indexList.size());
						// System.out.println("한번 사이즈 인덱스값 확인해보자 : "+
						// (indexList.size()-1));
						int tempInx = indexList.size() - 1;
						int roomIndex = (int) (Math.random() * tempInx);

						while (!happy) {
							// System.out.println("roomIndex 시작하기전 : " +
							// roomIndex );
							int newNum = indexList.get(roomIndex);
							if (num != newNum) {
								ArrayList<ArrangeVO> classArrSutdList = new ArrayList<>();
								for (int z = 0; z < arrList.size(); z++) {
									if (arrList.get(z).getClassroom_num() == num) {
										classArrSutdList.add(arrList.get(z));
										if (arrHate.get(r).getTotalIJ1() == arrList.get(z).getTotalIJ1()) {

											int targetA = unNormally.get(i).getClassroom_num();
											int targetB = arrList.get(r).getClassroom_num();
											int targetC = arrList.get(z).getClassroom_num();

											arrList.get(z).setClassroom_num(targetC);
											arrList.get(r).setClassroom_num(targetA);
											unNormally.get(i).setClassroom_num(targetB);

											for (int indexUnNo = 0; indexUnNo < arrList.size(); indexUnNo++) {
												if (arrList.get(indexUnNo).getStudent_num() == unNormally.get(i)
														.getStudent_num()) {
													arrList.get(indexUnNo).setClassroom_num(targetB);
												}
											}

											happy = true;
										}
									}
								}
								int tempinx = classArrSutdList.size() - 1;
								int randomArrSutdValue = (int) (Math.random() * tempinx);
								for (int z = 0; z < arrList.size(); z++) {
									if (arrList.get(z).getStudent_num() == classArrSutdList.get(randomArrSutdValue)
											.getStudent_num()) {

										int targetA = unNormally.get(i).getClassroom_num();
										int targetB = arrList.get(r).getClassroom_num();
										int targetC = arrList.get(z).getClassroom_num();

										arrList.get(z).setClassroom_num(targetC);
										arrList.get(r).setClassroom_num(targetA);
										unNormally.get(i).setClassroom_num(targetB);

										for (int indexUnNo = 0; indexUnNo < arrList.size(); indexUnNo++) {
											if (arrList.get(indexUnNo).getStudent_num() == unNormally.get(i)
													.getStudent_num()) {
												arrList.get(indexUnNo).setClassroom_num(targetB);
											}
										}

										happy = true;
									}
								}

							} else {
								roomIndex = (int) (Math.random() * tempInx);
								// System.out.println("들어와서 룸 인덱스 : " +
								// roomIndex);
							}
						}

					}
				}
			}
		}

		// for(int x = 0 ; x < roomList.size() ; x++){
		// double total = 0;
		// double avg = 0;
		// int count1 = 0;
		// for(int i = 0 ; i < roomList.size() ; i++){
		// for(int j = 0 ; j < arrList.size() ; j++){
		// if(arrList.get(j).getClassroom_num() == roomList.get(i).getNum()){
		// count1 += 2;
		// total += arrList.get(j).getTotalIJ1();
		// }
		// }
		// avg = total/count1;
		//
		// System.out.println("평균 : "+i+" : "+avg);
		// }
		// }
		//
		// for(int i = 0 ; i < arrList.size() ; i++){
		// System.out.println("학번 : "+arrList.get(i).getStudent_num() +" 이름 :
		// "+arrList.get(i).getName()+" 방번호 :
		// "+arrList.get(i).getClassroom_num());
		// }
		//
		// for(int i = 0 ; i < unNormally.size() ; i++){
		// System.out.println("unno "+"학번 : "+arrList.get(i).getStudent_num() +"
		// 이름 : "+arrList.get(i).getName()+" 방번호 :
		// "+arrList.get(i).getClassroom_num());
		// }

	
//		for (int i = 0 ; i < memberList.size() ; i++){
//			for(int j = 0 ; j < arrList.size() ; j++){
//				if(memberList.get(i).getStudent_num() == arrList.get(j).getStudent_num()){
//					memberList.get(i).setStudent_num(arrList.get(j).getClassroom_num());
//				}
//			}
//		}
//		
//		for(int i = 0 ; i < memberList.size() ; i++){
//			dao.ArrangeClass(memberList.get(i));
//		}
		for(ArrangeVO member : arrList){
			dao.arrangeClass(member);
		}
		
		return arrList;
	}

	class AscendingInteger implements Comparator<Integer> {
		@Override
		public int compare(Integer a, Integer b) {
			return b.compareTo(a);
		}
	}

	class AscendingString implements Comparator<String> {
		@Override
		public int compare(String a, String b) {
			return b.compareTo(a);
		}
	}

	class AscendingMember implements Comparator<ArrangeVO> {
		@Override
		public int compare(ArrangeVO a, ArrangeVO b) {
			Integer result1 = (int) b.getTotalIJ1();
			Integer result2 = (int) a.getTotalIJ1();
			return (result1).compareTo(result2);
		}
	}

	class DescendingMember implements Comparator<ArrangeVO> {
		@Override
		public int compare(ArrangeVO a, ArrangeVO b) {
			Integer result1 = (int) b.getTotalIJ1();
			Integer result2 = (int) a.getTotalIJ1();
			return (result2).compareTo(result1);
		}
	}

}
