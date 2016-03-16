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

import java.io.Serializable;

@Entity
@Table(name="pizzas")
public class Pizza implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty
    @Size(min = 4, max = 50)
    @Column(name = "naming", unique = true, nullable = false)
    private String naming;

    @NotEmpty
    @Size(min = 4, max = 300)
    @Column(name = "description", nullable = false)
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaming() {
        return naming;
    }

    public void setNaming(String naming) {
        this.naming = naming;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (!(obj instanceof Pizza))
            return false;
        Pizza other = (Pizza) obj;
        if (id != other.id)
            return false;
        if (!naming.equals(other.naming))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Pizza [id=" + id + ", naming=" + naming + ", description=" + description + "]";
    }

}
