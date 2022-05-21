package br.tobias.sct.domain.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "sct_permission", schema = "sct")
@SequenceGenerator(name = "sct_sq_permission", sequenceName = "sct_sq_permission", allocationSize = 1)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Permission {

    @Id
    @Column(name = "id_permission")
    @GeneratedValue(generator = "sct_sq_permission", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    @Enumerated(EnumType.STRING)
    private PermissionType name;
}
