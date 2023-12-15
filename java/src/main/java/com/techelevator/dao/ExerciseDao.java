package com.techelevator.dao;

import com.techelevator.model.Exercise;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface ExerciseDao {

    Exercise createExercise(Exercise exercise);

    List<Exercise> getExercisesByUserId(int userId);

    List<Exercise> getExerciseByUserIdByDate(int userId, LocalDate date);

    List<Exercise> getMostUsedDurationEquipmentByMonth(int monthNum);

    List<Exercise> getMostUsedRepsEquipmentByMonth(int monthNum);

    // public Exercise getEquipmentById();
}
