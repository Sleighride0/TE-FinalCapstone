package com.techelevator.dao;

import com.techelevator.model.CheckInOut;
import com.techelevator.model.Event;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcEventDao implements EventDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcEventDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Event> getUpcomingEventsList() {
        List<Event> eventList = new ArrayList<>();
        String sql = "SELECT event_name, event_description, event_date, event_start_time, event_duration\n" +
                "FROM schedule WHERE event_date >= CURRENT_DATE ORDER BY event_date;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Event event = mapToRowSet(results);
            eventList.add(event);
        }
        return eventList;
    }

    public Event mapToRowSet(SqlRowSet results) {
        Event event = new Event();
        event.setEventName(results.getString("event_name"));
        event.setDescription(results.getString("event_description"));
        event.setDate(results.getDate("event_date").toLocalDate());
        event.setStartTime(results.getTime("event_start_time"));
        event.setEventDuration(results.getInt("event_duration"));
        return event;
    }
}