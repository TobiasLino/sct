package br.tobias.sct.domain.user;

import br.tobias.sct.domain.supplier.Supplier;
import br.tobias.sct.domain.vehicle.Vehicle;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@DiscriminatorValue("DRIVER")
@Getter
@Setter
public class Driver extends SCTUser {

    @Column(name = "cnh")
    private String driverLicense;

    @ManyToOne
    @JoinColumn(name = "id_supplier")
    private Supplier supplier;

    @OneToOne(mappedBy = "driver")
    private Vehicle vehicle;

    public Driver(String name, String email, String password, String driverLicense) {
        super(name, email, password, ProviderType.LOCAL, SCTUserType.DRIVER);
        this.driverLicense = driverLicense;
    }

    public Driver(String name, String email, String driverLicense) {
        super(name, email, ProviderType.GOOGLE, SCTUserType.DRIVER);
        this.driverLicense = driverLicense;
    }

    public Driver() {
        super();
    }
}
