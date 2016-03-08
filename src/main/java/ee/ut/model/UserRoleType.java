package ee.ut.model;

public enum UserRoleType {
    USER("USER"),
    ADMIN("ADMIN");

    String userRoleType;

    UserRoleType(String userRoleType){
        this.userRoleType = userRoleType;
    }

    public String getUserRoleType(){
        return userRoleType;
    }

}
