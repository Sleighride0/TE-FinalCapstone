package com.techelevator.dao;

import com.techelevator.model.CheckInOut;

import javax.print.DocFlavor;
import java.time.LocalDate;
import java.util.List;

public interface CheckInOutDao {


    public CheckInOut setCheckInTime(CheckInOut checkInTime);

    public boolean setCheckOutTime(CheckInOut checkOutTime);

    public int getDurationTotalByUserId(int userId);
    public double getAverageVisitDurationByUserId(int userId);
    public List<CheckInOut> getVisitsByUserId(int userId);
    public List<CheckInOut> getVisitByDayByUserId(int userId, LocalDate date);
    public List<CheckInOut> getPastWeekOfVisitsByUserId(int userId);
    public List<CheckInOut> getSpecificMonthVisitsByUserId(int userId, int month);
}
