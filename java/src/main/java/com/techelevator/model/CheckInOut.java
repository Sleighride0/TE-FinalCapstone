package com.techelevator.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class CheckInOut {
    private int userVisitId;
    private LocalDateTime checkInTime;

    private LocalDateTime checkOutTime;

    private int duration;
    private int userId;
    private boolean isCheckedIn;

    public CheckInOut(int userVisitId, LocalDateTime checkInTime, LocalDateTime checkOutTime, int duration, int userId) {
        this.checkInTime = checkInTime;
        this.checkOutTime = checkOutTime;
        this.duration = duration;
        this.userId = userId;
       // this.isCheckedIn = isCheckedIn;
        this.userVisitId = userVisitId;
    }

    public CheckInOut() {
    }

    public int getUserVisitId() {
        return userVisitId;
    }

    public void setUserVisitId(int userVisitId) {
        this.userVisitId = userVisitId;
    }

    public LocalDateTime getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(LocalDateTime checkInTime) {
        this.checkInTime = checkInTime;
    }

    public LocalDateTime getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(LocalDateTime checkOutTime) {
        this.checkOutTime = checkOutTime;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public boolean isCheckedIn() {
        return isCheckedIn;
    }

    public void setCheckedIn(boolean checkedIn) {
        isCheckedIn = checkedIn;
    }
}
