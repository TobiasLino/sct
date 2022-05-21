package br.tobias.sct.domain.trip.price;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PriceMetricRepository extends JpaRepository<PriceMetric, Long> {

    Optional<PriceMetric> findFirstByOrderByIsValidDesc();
}
