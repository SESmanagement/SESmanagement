package com.spring.manage.vo;

import java.util.Date;

public class EventVO {
	private int student_num;				// 학생 번호
	private String memo;					// 비고, 메모
	private String id; 						// 이벤트 번호
	private String title; 					// 이벤트 이름 (필수)
	private boolean allDay; 				// 종일 이벤트 여부 
	private String start;					// 이벤트 시작 시간 Date, DB:START_TIME
	private String end; 					// 이벤트 종료 시간 Date, DB:END_TIME (선택일+1 00:00으로 표시)
	private String url;						// 이벤트 클릭시 이동할 경로, DB:URL_STR
	private String className;				// css 적용 클래스
	private boolean editable;				// drag로 시작/종료시간 수정 가능 여부
	private boolean startEditable;			// drag로 시작시간 수정 가능 여부
	private boolean durationEditable;		// 이벤트 기간 수정 가능 여부
	private boolean resourceEditable;		// 이벤트 drag n drop 가능 여부 ???
	private String rendering;				// 시간대에 'background' 표시
	private boolean overlap;				// 시간대 중복 가능 여부
	private int constraint;				// 지정된 이벤트 시간 ex) 정규 수업시간 등, 	id = 'businessHours', DB:CONSTRAINT_EVENT
	private String source;					// ??
	private String backgroundColor;			// 이벤트의 css background-color
	private String borderColor;				// 이벤트의 css border-color
	private String textColor;				// 이벤트의 css text-color
	private String reference;				// 이벤트 참조, 예약번호 등 입력, DB:SOURCE_EVENT
	
	public EventVO() {	}

	public int getStudent_num() {
		return student_num;
	}

	public void setStudent_num(int student_num) {
		this.student_num = student_num;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public boolean isStartEditable() {
		return startEditable;
	}

	public void setStartEditable(boolean startEditable) {
		this.startEditable = startEditable;
	}

	public boolean isDurationEditable() {
		return durationEditable;
	}

	public void setDurationEditable(boolean durationEditable) {
		this.durationEditable = durationEditable;
	}

	public boolean isResourceEditable() {
		return resourceEditable;
	}

	public void setResourceEditable(boolean resourceEditable) {
		this.resourceEditable = resourceEditable;
	}

	public String getRendering() {
		return rendering;
	}

	public void setRendering(String rendering) {
		this.rendering = rendering;
	}

	public boolean isOverlap() {
		return overlap;
	}

	public void setOverlap(boolean overlap) {
		this.overlap = overlap;
	}

	public int getConstraint() {
		return constraint;
	}

	public void setConstraint(int constraint) {
		this.constraint = constraint;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getBorderColor() {
		return borderColor;
	}

	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	@Override
	public String toString() {
		return "EventVO [student_num=" + student_num + ", memo=" + memo + ", id=" + id + ", title=" + title
				+ ", allDay=" + allDay + ", start=" + start + ", end=" + end + ", url=" + url + ", className="
				+ className + ", editable=" + editable + ", startEditable=" + startEditable + ", durationEditable="
				+ durationEditable + ", resourceEditable=" + resourceEditable + ", rendering=" + rendering
				+ ", overlap=" + overlap + ", constraint=" + constraint + ", source=" + source + ", backgroundColor="
				+ backgroundColor + ", borderColor=" + borderColor + ", textColor=" + textColor + ", reference="
				+ reference + "]";
	}

}
