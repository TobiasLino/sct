package br.tobias.sct.domain.supplier;

import br.tobias.sct.domain.user.SCTUser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.Set;

@Entity
@Table(name = "sct_supplier", schema = "sct")
@SequenceGenerator(name = "sct_sq_supplier", schema = "sct", sequenceName = "sct_sq_supplier", allocationSize = 1)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Supplier {

    @Id
    @Column(name = "id_supplier")
    @GeneratedValue(generator = "sct_sq_supplier", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    private String name;

    @NotNull
    @Column(name = "cnpj")
    private String identification;

    @Email
    private String email;

    @OneToMany(mappedBy = "supplier")
    private Set<SCTUser> users;
}
