package br.tobias.sct.domain.trip.price;

import java.math.BigDecimal;

public interface PriceCalculator {

    BigDecimal calculatePrice(final BigDecimal distance, final BigDecimal estimatedMinutes);

}
