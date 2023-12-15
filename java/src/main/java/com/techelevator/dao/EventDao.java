package com.techelevator.dao;

import com.techelevator.model.Event;

import java.time.LocalDate;
import java.util.List;

public interface EventDao {

   List<Event> getUpcomingEventsList();
}
