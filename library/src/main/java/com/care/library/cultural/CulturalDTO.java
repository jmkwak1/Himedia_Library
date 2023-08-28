package com.care.library.cultural;

import java.time.LocalDate;

public class CulturalDTO {
	private int culId;
    private String title;
    private String lectureStart;
    private String lectureEnd;
    private String registrationStart;
    private String registrationEnd;
    private String lectureTime;
    private String lecturePlace;
    private String lectureDay;
    private String lectureName;
    private String cost;
    private String lectureText;
    private String target;
    private String imagePath; // 이미지 파일의 경로를 저장하는 필드
    private String writeDate;
    private String count;
	/* private byte[] image; */
    
	public int getCulId() {
		return culId;
	}
	public void setCulId(int culId) {
		this.culId = culId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLectureStart() {
		return lectureStart;
	}
	public void setLectureStart(String lectureStart) {
		this.lectureStart = lectureStart;
	}
	public String getLectureEnd() {
		return lectureEnd;
	}
	public void setLectureEnd(String lectureEnd) {
		this.lectureEnd = lectureEnd;
	}
	public String getRegistrationStart() {
		return registrationStart;
	}
	public void setRegistrationStart(String registrationStart) {
		this.registrationStart = registrationStart;
	}
	public String getRegistrationEnd() {
		return registrationEnd;
	}
	public void setRegistrationEnd(String registrationEnd) {
		this.registrationEnd = registrationEnd;
	}
	public String getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}
	public String getLecturePlace() {
		return lecturePlace;
	}
	public void setLecturePlace(String lecturePlace) {
		this.lecturePlace = lecturePlace;
	}
	public String getLectureDay() {
		return lectureDay;
	}
	public void setLectureDay(String lectureDay) {
		this.lectureDay = lectureDay;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getLectureText() {
		return lectureText;
	}
	public void setLectureText(String lectureText) {
		this.lectureText = lectureText;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}

    
}
