package br.tobias.sct.domain.trip.price;

import br.tobias.sct.infra.exceptions.NoValueFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
@RequiredArgsConstructor
public class DefaultPriceCalculator implements PriceCalculator {

    private final PriceMetricRepository repository;

    @Override
    public BigDecimal calculatePrice(BigDecimal distance, BigDecimal estimatedMinutes) {
        final PriceMetric metric = repository.findFirstByOrderByIsValidDesc()
                .orElseThrow(() -> new NoValueFoundException("No price metrics found"));

        return metric.getBasePrice()
                .add(metric.getDistancePrice().multiply(distance))
                .add(metric.getMinutePrice().multiply(estimatedMinutes));
    }
}
