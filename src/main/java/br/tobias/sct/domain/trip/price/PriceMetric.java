package br.tobias.sct.domain.trip.price;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "sct_price_metric", schema = "sct")
@SequenceGenerator(name = "sct_sq_price_metric", sequenceName = "sct_sq_price_metric", schema = "sct", allocationSize = 1)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PriceMetric {

    @Id
    @Column(name = "id_price_metric")
    @GeneratedValue(generator = "sct_sq_price_metric", strategy = GenerationType.SEQUENCE)
    private Long id;

    @NotNull
    @Column(name = "base_price")
    private BigDecimal basePrice;

    @NotNull
    @Column(name = "distance_price")
    private BigDecimal distancePrice;

    @NotNull
    @Column(name = "minute_price")
    private BigDecimal minutePrice;

    @Column(name = "is_valid", columnDefinition = "INTEGER")
    private Boolean isValid;

    @Column(name = "created_date")
    private LocalDateTime createDate;
}
