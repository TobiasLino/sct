package br.tobias.sct.domain.user;

import br.tobias.sct.domain.supplier.Supplier;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@DiscriminatorValue("MANAGER")
@Getter
@Setter
public class Manager extends SCTUser {

    @ManyToOne
    @JoinColumn(name = "id_supplier")
    private Supplier supplier;

    public Manager(String name, String email, String password, Supplier supplier) {
        super(name, email, password, ProviderType.LOCAL, SCTUserType.MANAGER);
        this.supplier = supplier;
    }

    public Manager() {
        super();
    }
}
