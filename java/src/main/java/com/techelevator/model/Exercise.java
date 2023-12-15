package com.techelevator.model;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Exercise {

    private int sets;
    private String exerciseName;
    private int userId;
    private int exerciseId;
    private int reps;
    private double weight;
    private LocalDate date;
    private int duration;
    private String mode;


    public Exercise(String exerciseName, int userId, int exerciseId, int reps, double weight, LocalDate date,int duration, int sets, String mode) {
        this.exerciseName = exerciseName;
        this.userId = userId;
        this.exerciseId = exerciseId;
        this.reps = reps;
        this.weight = weight;
        this.date = date;
        this.duration = duration;
        this.sets = sets;
        this.mode = mode;
    }
    public Exercise() {
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }



    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getSets() {
        return sets;
    }

    public void setSets(int sets) {
        this.sets = sets;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }
}
