{% macro rolling_agg_n_periods(agg_method, column_name, partition_by, order_by, n_periods = 7) %}
    {{ agg_method }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ n_periods - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ agg_method }}_{{ n_periods }}_periods_{{ column_name }}
{% endmacro %}
