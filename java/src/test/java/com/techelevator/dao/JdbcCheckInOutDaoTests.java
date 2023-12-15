package com.techelevator.dao;
import com.techelevator.model.CheckInOut;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDateTime;
import java.util.List;

public class JdbcCheckInOutDaoTests extends BaseDaoTests {

    private JdbcCheckInOutDao sut;
    private CheckInOut checkInOutTest = new CheckInOut();

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcCheckInOutDao(jdbcTemplate);

    }

    @Test
    public void setCheckInTimeReturnsCorrectTime(){
        LocalDateTime timeTest = LocalDateTime.now();
        checkInOutTest.setUserId(1);
        checkInOutTest.setCheckInTime(timeTest);
        sut.setCheckInTime(checkInOutTest);
        Assert.assertEquals(timeTest,checkInOutTest.getCheckInTime());
    }
    @Test
    public void setCheckOutTimeReturnsCorrectTime(){
        LocalDateTime timeTest = LocalDateTime.now();
        checkInOutTest.setUserVisitId(1);
        checkInOutTest.setUserId(1);
        checkInOutTest.setCheckOutTime(timeTest);
        sut.setCheckOutTime(checkInOutTest);
        Assert.assertEquals(timeTest,checkInOutTest.getCheckOutTime());
    }

    @Test
    public void getDurationTotalByUserIdReturnsCorrectValue(){
        int testValue = sut.getDurationTotalByUserId(1);
        Assert.assertEquals(332, testValue);
    }

    @Test
    public void getMonthsVisitsByUserIdReturnsCurrentVisitAmount(){
        List<CheckInOut> testList = sut.getSpecificMonthVisitsByUserId(1,11);
        Assert.assertEquals(3, testList.size());

        testList = sut.getSpecificMonthVisitsByUserId(1, 12);
        Assert.assertEquals(2, testList.size());
    }

//    @Test void getVisitsByDayByUserIdReturnsCorrectVisitAmount(){
//        List<CheckInOut> testList = sut.getVisitByDayByUserId(1, 2023-11-1)
//    }
}
