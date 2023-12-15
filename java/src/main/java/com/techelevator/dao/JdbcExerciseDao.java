package com.techelevator.dao;

import com.techelevator.model.Exercise;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Component
public class JdbcExerciseDao implements ExerciseDao{
    private final JdbcTemplate jdbcTemplate;

    public JdbcExerciseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Exercise createExercise(Exercise exercise) {
    String sql = "INSERT INTO exercise (user_id, exercise_name, date, reps, weight, duration, sets, mode) VALUES (?,?,?,?,?,?,?,?) RETURNING exercise_id;";
        int exerciseId = jdbcTemplate.queryForObject(sql, int.class, exercise.getUserId(), exercise.getExerciseName(), exercise.getDate(), exercise.getReps(), exercise.getWeight(),exercise.getDuration(),exercise.getSets(),exercise.getMode());
       exercise.setExerciseId(exerciseId);
        return exercise;
    }

    @Override
    public List<Exercise> getExercisesByUserId(int userId) {
        List <Exercise> exerciseList = new ArrayList<>();
        String sql = "SELECT exercise_id, exercise_name, user_id, date, reps, weight, duration, sets, mode FROM exercise WHERE user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while(results.next()){
            Exercise exercise = mapToRowSet(results);
            exerciseList.add(exercise);
        }
        return exerciseList;
    }

    @Override
    public List<Exercise> getExerciseByUserIdByDate(int userId, LocalDate date) {
        List <Exercise> exerciseList = new ArrayList<>();
        String sql = "SELECT exercise_id, exercise_name, user_id, date, reps, weight, duration, sets, mode FROM exercise WHERE user_id = ? AND date = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId, date);
        while(results.next()){
            Exercise exercise = mapToRowSet(results);
            exerciseList.add(exercise);
        }
        return exerciseList;
    }

    @Override
    public List<Exercise> getMostUsedDurationEquipmentByMonth(int monthNum) {
        List<Exercise> exerciseList = new ArrayList<>();
        String sql = "SELECT exercise_name, mode, SUM(duration) AS total_duration FROM exercise\n" +
                "WHERE mode = 'duration' AND EXTRACT(MONTH FROM date) = ?\n" +
                "GROUP BY exercise_name, mode ORDER BY total_duration DESC;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, monthNum);
        while (results.next()) {
            Exercise exercise = new Exercise();
            exercise.setExerciseName(results.getString("exercise_name"));
            exercise.setDuration(results.getInt("total_duration"));
            exercise.setMode(results.getString("mode"));
            exerciseList.add(exercise);
        }
        return exerciseList;
    }
    @Override
    public List<Exercise> getMostUsedRepsEquipmentByMonth(int monthNum){
    List<Exercise> exerciseList = new ArrayList<>();
    String sql = "SELECT exercise_name, mode, SUM(reps * sets) AS total_reps\n" +
            "FROM exercise\n" +
            "WHERE mode = 'reps' AND EXTRACT(MONTH FROM date) = ?\n" +
            "GROUP BY exercise_name, mode\n" +
            "ORDER BY total_reps DESC";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, monthNum);
        while (results.next()) {
            Exercise exercise = new Exercise();
            exercise.setExerciseName(results.getString("exercise_name"));
            exercise.setReps(results.getInt("total_reps"));
            exercise.setMode(results.getString("mode"));

            exerciseList.add(exercise);
        }
        return exerciseList;
}

    public Exercise mapToRowSet(SqlRowSet results){
        Exercise exercise = new Exercise();
        exercise.setWeight(results.getDouble("weight"));
        exercise.setExerciseId(results.getInt("exercise_id"));
        exercise.setExerciseName(results.getString("exercise_name"));
        exercise.setUserId(results.getInt("user_id"));
        exercise.setDate(results.getDate("date").toLocalDate());
        exercise.setDuration(results.getInt("duration"));
        exercise.setSets(results.getInt("sets"));
        exercise.setReps(results.getInt("reps"));
        exercise.setMode(results.getString("mode"));
        return exercise;
    }
}
