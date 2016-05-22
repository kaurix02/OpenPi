package ee.ut.model;

import org.hibernate.annotations.Type;
import org.hibernate.internal.util.type.PrimitiveWrapperHelper;
import org.hibernate.type.CharacterArrayClobType;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="orders")
public class Order {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id")
    private User user;

    @NotNull
    @Column(name = "total", columnDefinition = "DOUBLE(10,2)")
    private Double total;

    @NotNull
    @Column(name = "is_done", nullable = false)
    private Character isDone;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "orders_sold_pizzas",
            joinColumns = { @JoinColumn(name = "order_id") },
            inverseJoinColumns = { @JoinColumn(name = "sold_pizza_id") })
    private Set<SoldPizza> soldPizzas = new HashSet<>();

    public int getId() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (id != order.id) return false;
        if (user != null ? !user.equals(order.user) : order.user != null) return false;
        if (total != null ? !total.equals(order.total) : order.total != null) return false;
        if (isDone != null ? !isDone.equals(order.isDone) : order.isDone != null) return false;
        return soldPizzas != null ? soldPizzas.equals(order.soldPizzas) : order.soldPizzas == null;

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + (isDone != null ? isDone.hashCode() : 0);
        result = 31 * result + (soldPizzas != null ? soldPizzas.hashCode() : 0);
        return result;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<SoldPizza> getSoldPizzas() {
        return soldPizzas;
    }

    public void setSoldPizzas(Set<SoldPizza> pizzas) {
        this.soldPizzas = pizzas;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Character getIsDone() {
        return isDone;
    }

    public void setIsDone(Character done) {
        isDone = done;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
