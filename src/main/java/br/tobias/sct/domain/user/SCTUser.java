package br.tobias.sct.domain.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "sct_user", schema = "sct")
@SequenceGenerator(name = "sct_sq_user", sequenceName = "sct_sq_user", schema = "sct", allocationSize = 1)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "user_type", discriminatorType = DiscriminatorType.STRING)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public abstract class SCTUser implements Serializable {

    @Id
    @Column(name = "id_user")
    @GeneratedValue(generator = "sct_sq_user", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    private String name;

    @Email
    @NotNull
    private String email;

    @JsonIgnore
    @Column(name = "passwd")
    private String password;

    @NotNull
    @Enumerated(EnumType.STRING)
    private ProviderType provider;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "user_type")
    private SCTUserType type;

    @ManyToMany
    @JoinTable(name = "sct_user_permission",
        joinColumns = @JoinColumn(name = "id_user"),
        inverseJoinColumns = @JoinColumn(name = "id_permission"))
    private Set<Permission> permissions;

    public SCTUser(String name, String email, String password, ProviderType provider, SCTUserType type) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.provider = provider;
        this.type = type;
    }

    public SCTUser(String name, String email, ProviderType provider, SCTUserType type) {
        this.name = name;
        this.email = email;
        this.provider = provider;
        this.type = type;
    }
}
