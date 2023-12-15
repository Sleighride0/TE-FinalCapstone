package com.techelevator.model;

import java.sql.Time;
import java.time.LocalDate;

public class Event {

    private String eventName;
    private String description;
    private LocalDate date;
    private Time startTime;
    private int eventDuration;

    public Event(String eventName, String description, LocalDate date, Time startTime, int eventDuration) {
        this.eventName = eventName;
        this.description = description;
        this.date = date;
        this.startTime = startTime;
        this.eventDuration = eventDuration;
    }

    public Event() {
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getEventDuration() {
        return eventDuration;
    }

    public void setEventDuration(int eventDuration) {
        this.eventDuration = eventDuration;
    }
}

