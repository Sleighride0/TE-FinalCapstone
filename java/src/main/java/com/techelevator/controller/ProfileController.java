package com.techelevator.controller;

import com.techelevator.dao.ProfileDao;
import com.techelevator.model.Profile;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;
import java.util.Map;

@RestController
@CrossOrigin
public class ProfileController {

    private ProfileDao profileDao;

    public ProfileController(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }

//    @RequestMapping(path = "/profile/{userId}", method = RequestMethod.GET)
//    public ResponseEntity<Profile> getUserProfileByUserId(@PathVariable int userId) {
//        Profile profile = profileDao.getUserProfileByUserId(userId);
//        return ResponseEntity.ok(profile);
//    }
    @RequestMapping(path = "/profile/{userId}", method = RequestMethod.GET)
        public Profile getUserProfileByUserId(@PathVariable int userId) {
        return profileDao.getUserProfileByUserId(userId);
    }
    @RequestMapping(path = "/profile/{goal}/{userId}", method = RequestMethod.PUT)
        public boolean updateVisitDurationGoalByUserId (@PathVariable int goal,@PathVariable int userId){
        return profileDao.updateVisitDurationGoalByUserId(goal,userId);
    }

    @RequestMapping(path = "/profile/createProfile", method = RequestMethod.POST)
    public Profile createProfile(@RequestBody Profile profile) {
        return profileDao.createProfile(profile);
    }
    @RequestMapping(path = "/profile/uploadPicture/{userId}", method = RequestMethod.POST)
    public ResponseEntity<String> uploadProfilePicture(@PathVariable int userId, @RequestBody Map<String, String> requestBody) {
        String base64String = requestBody.get("base64String");

        // Decode base64 string into a byte array
        byte[] imageBytes = Base64.getDecoder().decode(base64String);

        // Save the image data in the database
        saveImageToDatabase(userId, imageBytes);

        return ResponseEntity.ok("Profile picture uploaded successfully");
    }

    @RequestMapping(path = "/profile/updatePicture/{userId}", method = RequestMethod.PUT)
    public ResponseEntity<String> updateProfilePicture(@PathVariable int userId, @RequestBody Map<String, String> requestBody){
        String base64String = requestBody.get("base64String");
        byte[] imageBytes = Base64.getDecoder().decode(base64String);
        updateImageInDatabase(userId, imageBytes);
        return ResponseEntity.ok("Profile picture updated successfully");
    }


    private void saveImageToDatabase(int userId, byte[] imageBytes) {
        // Insert the image data into the images table
        // Adjust the method according to your actual database schema
        profileDao.saveImage(userId, imageBytes);
    }
    private void updateImageInDatabase(int userId, byte[] imageBytes){
        profileDao.updateImage(imageBytes, userId);
    }
    @RequestMapping(path = "/profile/getPicture/{userId}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getProfilePicture(@PathVariable int userId) {
        try {
            byte[] imageData = profileDao.getImageByUserId(userId);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG); // Adjust the media type based on your image format
            return new ResponseEntity<>(imageData, headers, HttpStatus.OK);
        } catch (EmptyResultDataAccessException e) {
            // Handle the case where no image is found for the user
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            // Handle other exceptions
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
