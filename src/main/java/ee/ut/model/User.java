package ee.ut.model;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty
    @Size(min = 2, max = 100)
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotEmpty
    @Size(min = 2, max = 100)
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @NotEmpty
    @Size(max = 100)
    @Column(name = "email", nullable = false)
    private String email;

    @NotEmpty
    @Size(min = 32, max = 32)
    @Column(name = "password", nullable = false)
    private String password;

    @NotEmpty
    @Column(name="state", nullable=false)
    private String state = State.ACTIVE.getState();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "users_user_roles",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_role_id") })
    private Set<UserRole> userRoles = new HashSet<UserRole>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {return password;}

    public void setPassword(String password) {this.password = password;}

    public String getState() {return state;}

    public void setState(String state) {this.state = state;}

    public Set<UserRole> getUserRoles() {return userRoles;}

    public void setUserRoles(Set<UserRole> userRoles) {this.userRoles = userRoles;}

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof User))
            return false;
        User other = (User) obj;
        if (id != other.id)
            return false;
        if (!email.equals(other.email))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", first_name=" + firstName + ", last_name=" + lastName + ", email=" + email + "]";
    }

    public Collection<GrantedAuthority> getAuthorities() {
        //make everyone ROLE_USER
        Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        GrantedAuthority grantedAuthority = (GrantedAuthority) () -> "ROLE_USER";
        grantedAuthorities.add(grantedAuthority);
        return grantedAuthorities;
    }
}
