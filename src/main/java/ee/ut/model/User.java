package ee.ut.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

//@Entity
//@Table(name="users")
public class User {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int id;
//
//    @Size(min=5, max=50)
//    @Column(name = "username", nullable = false)
//    private String userName;
//
//    @NotNull
//    @DateTimeFormat(pattern="dd/MM/yyyy")
//    @Column(name = "joining_date", nullable = false)
//    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
//    private LocalDate joiningDate;
//
//    @NotNull
//    @NotEmpty
//    @Column(name = "email", unique=true, nullable = false)
//    private String email;
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getUserName() {
//        return userName;
//    }
//
//    public void setUserName(String userName) {
//        this.userName = userName;
//    }
//
//    public LocalDate getJoiningDate() {
//        return joiningDate;
//    }
//
//    public void setJoiningDate(LocalDate joiningDate) {
//        this.joiningDate = joiningDate;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    @Override
//    public boolean equals(Object obj) {
//        if (this == obj)
//            return true;
//        if (obj == null)
//            return false;
//        if (!(obj instanceof User))
//            return false;
//        User other = (User) obj;
//        if (id != other.id)
//            return false;
//        if (!email.equals(other.email))
//            return false;
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "User [id=" + id + ", userName=" + userName + ", joiningDate="
//                + joiningDate + ", email=" + email + "]";
//    }

}
