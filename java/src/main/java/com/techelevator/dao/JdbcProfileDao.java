package com.techelevator.dao;

import com.techelevator.model.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.Base64;


@Component
public class JdbcProfileDao implements ProfileDao {
    private final JdbcTemplate jdbcTemplate;


    public JdbcProfileDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;

    }

    public byte[] getImageByUserId(int userId) {
        String imageSql = "SELECT image_data FROM images WHERE user_id = ?";
        return jdbcTemplate.queryForObject(imageSql, byte[].class, userId);
    }


    @Override
    public Profile getUserProfileByUserId(int userId) {
        Profile profile = new Profile();
        String sql = "SELECT profile_id, users.user_id, username, profile_picture_url, email, visit_duration_goal FROM users\n" +
                "JOIN profiles ON users.user_id = profiles.user_id\n" +
                "WHERE users.user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        if (results.next()) {
            profile.setProfileId(results.getInt("profile_id"));
            profile.setUserId(results.getInt("user_id"));
            profile.setUsername(results.getString("username"));
            profile.setProfilePicUrl(results.getString("profile_picture_url"));
            profile.setEmailAddress(results.getString("email"));
            profile.setVisitDurationGoal(results.getInt("visit_duration_goal"));
        }
        return profile;
    }

    @Override
    public Profile createProfile(Profile profile) {
        // Extract base64 part from data URL
        String base64String = profile.getProfilePicUrl().split(",")[1];

        // Decode base64 string into a byte array
        byte[] imageBytes = Base64.getDecoder().decode(base64String);

        // Save the image data in the database
        saveImage(profile.getUserId(), imageBytes);

        // Insert the profile into the profiles table
        String sql = "INSERT into profiles (user_id, profile_picture_url, email) VALUES (?, ?, ?)";
        int profileId = jdbcTemplate.update(sql, profile.getUserId(), profile.getProfilePicUrl(), profile.getEmailAddress());

        profile.setProfileId(profileId);
        return profile;
    }

    @Override
    public void saveImage(int userId, byte[] imageBytes) {
        // Insert the image data into the images table
        String imageSql = "INSERT INTO images (user_id, image_data) VALUES (?, ?)";
        jdbcTemplate.update(imageSql, userId, imageBytes);
    }

    @Override
    public void updateImage(byte[] imageBytes, int userId) {
        // Insert the image data into the images table
        String imageSql = "UPDATE images SET image_data = ? WHERE user_id = ?";
        jdbcTemplate.update(imageSql, imageBytes, userId);
    }
    @Override
    public boolean updateVisitDurationGoalByUserId (int goal, int userId){
        boolean success = false;
        String sql = "UPDATE profiles SET visit_duration_goal = ? WHERE user_id = ?";
        int rowsAffected = jdbcTemplate.update(sql, goal, userId);
        if (rowsAffected > 0){
            success = true;
    }
        return success;
    }

}


