package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.CheckInOut;
import com.techelevator.model.Exercise;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCheckInOutDao implements CheckInOutDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCheckInOutDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @ResponseStatus(HttpStatus.CREATED)
    @Override
    public CheckInOut setCheckInTime(CheckInOut checkInTime) {
        String sql = "INSERT INTO user_visits (user_id, check_in_date) VALUES (?,?) RETURNING user_visit_id;";
        int userVisitId = jdbcTemplate.queryForObject(sql, int.class, checkInTime.getUserId(), checkInTime.getCheckInTime());
        checkInTime.setUserVisitId(userVisitId);
        return checkInTime;
    }

    @Override
    public boolean setCheckOutTime(CheckInOut checkOutTime) {
        String sql = "UPDATE user_visits SET check_out_date = ?, duration = ? WHERE user_visit_id = ? ";
        boolean success = false;
        try {
            int numberOfRows = jdbcTemplate.update(sql, checkOutTime.getCheckOutTime(), checkOutTime.getDuration(), checkOutTime.getUserVisitId());
            if (numberOfRows == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            } else {
                success = true;
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return success;
    }

    public List<CheckInOut> getVisitsByUserId(int userId) {
        List<CheckInOut> checkInOutList = new ArrayList<>();
        String sql = "SELECT user_visit_id, user_id, check_in_date, check_out_date, duration FROM user_visits WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            CheckInOut checkInOut = mapToRowSet(results);
            checkInOutList.add(checkInOut);
        }
        return checkInOutList;
    }

    @Override
    public List<CheckInOut> getPastWeekOfVisitsByUserId(int userId) {
        List<CheckInOut> checkInOutList = new ArrayList<>();
        String sql = "SELECT user_visit_id, user_id, check_in_date, check_out_date, duration FROM user_visits\n" +
                "WHERE check_in_date >= CURRENT_DATE - INTERVAL '7 days'\n" +
                "AND user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            CheckInOut checkInOut = mapToRowSet(results);
            checkInOutList.add(checkInOut);
        }
        return checkInOutList;
    }

    @Override
    public List<CheckInOut> getSpecificMonthVisitsByUserId(int userId, int monthNum) {
        List<CheckInOut> checkInOutList = new ArrayList<>();
        String sql = "SELECT user_visit_id, user_id, check_in_date, check_out_date, duration FROM user_visits\n" +
                "WHERE EXTRACT (MONTH FROM check_in_date) = ? AND user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, monthNum, userId);
        while (results.next()) {
            CheckInOut checkInOut = mapToRowSet(results);
            checkInOutList.add(checkInOut);
        }
        return checkInOutList;
    }
    public List<CheckInOut> getVisitByDayByUserId(int userId, LocalDate date){
    List<CheckInOut> checkInOutList = new ArrayList<>();
    String sql = "SELECT * FROM user_visits\n" +
            "WHERE DATE(check_in_date) = ? AND user_id = ?;";
    SqlRowSet results = jdbcTemplate.queryForRowSet(sql, date, userId);
        while (results.next()) {
        CheckInOut checkInOut = mapToRowSet(results);
        checkInOutList.add(checkInOut);
    }
        return checkInOutList;
}

    @Override
    public int getDurationTotalByUserId(int userId) {
        int totalDuration = 0;
        String sql = "SELECT SUM(duration) FROM user_visits WHERE user_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, userId);
        if (result.next()) {
            totalDuration = result.getInt("sum");
        }
        return totalDuration;
    }

    @Override
    public double getAverageVisitDurationByUserId(int userId) {
        double durationAverage = 0;
        String sql = "SELECT user_id, ROUND(AVG(duration), 2) AS average_duration\n" +
                "FROM user_visits\n" +
                "WHERE user_id = ?\n" +
                "GROUP BY user_id";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, userId);
        if (result.next()) {
            durationAverage = result.getDouble("average_duration");
        }
        return durationAverage;
    }

    public CheckInOut mapToRowSet(SqlRowSet results) {
        CheckInOut checkInOut = new CheckInOut();
        checkInOut.setUserVisitId(results.getInt("user_visit_id"));
        checkInOut.setUserId(results.getInt("user_id"));
        Timestamp checkInTimestamp = results.getTimestamp("check_in_date");
        Timestamp checkOutTimestamp = results.getTimestamp("check_out_date");
        if (checkInTimestamp != null) {
            checkInOut.setCheckInTime(checkInTimestamp.toLocalDateTime());
        }
        if (checkOutTimestamp != null) {
            checkInOut.setCheckOutTime(checkOutTimestamp.toLocalDateTime());
        }
        checkInOut.setDuration(results.getInt("duration"));
        return checkInOut;
    }
}
