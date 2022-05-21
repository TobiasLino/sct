package br.tobias.sct.domain.vehicle;

import br.tobias.sct.domain.user.Driver;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "sct_vehicle", schema = "sct")
@SequenceGenerator(name = "sct_sq_vehicle", sequenceName = "sct_sq_vehicle", schema = "sct", allocationSize = 1)
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Vehicle {

    @Id
    @Column(name = "id_vehicle")
    @GeneratedValue(generator = "sct_sq_vehicle", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    @OneToOne
    @JoinColumn(name = "id_driver")
    private Driver driver;

    @NotNull
    @Column(name = "license_plate")
    private String licensePlate;

    @NotNull
    private String name;

    @Column(name = "year")
    private Integer fabricationYear;
}
