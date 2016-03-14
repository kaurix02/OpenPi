package ee.ut.helpmodules;

/**
 * Created by alandu on 14.03.16.
 */
public class RegistrationHelp {

    public boolean firstNameValid(String firstName) {
        if (firstName.length() < 2 || firstName.length() > 100) {
            return false;
        }
        return true;
    }

    public boolean lastNameValid(String lastName) {
        if (lastName.length() < 2 || lastName.length() > 100) {
            return false;
        }
        return true;
    }

    public boolean emailValid(String email) {
        if (email.length() < 5) {
            return false;
        }

        return true;
    }
}
