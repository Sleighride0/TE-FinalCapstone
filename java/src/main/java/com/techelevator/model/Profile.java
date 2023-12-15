package com.techelevator.model;


public class Profile {
private int profileId;
    private int userId;
    private String username;
    private String profilePicUrl;
    private String emailAddress;
    private int visitDurationGoal;

    public Profile(int profileId, int userId, String username, String profilePicUrl, String emailAddress, int visitDurationGoal) {
        this.profileId = profileId;
        this.userId = userId;
        this.username = username;
        this.profilePicUrl = profilePicUrl;
        this.emailAddress = emailAddress;
        this.visitDurationGoal = visitDurationGoal;
    }

    public int getVisitDurationGoal() {
        return visitDurationGoal;
    }

    public void setVisitDurationGoal(int visitDurationGoal) {
        this.visitDurationGoal = visitDurationGoal;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public Profile() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProfilePicUrl() {
        return profilePicUrl;
    }

    public void setProfilePicUrl(String profilePicUrl) {
        this.profilePicUrl = profilePicUrl;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}
