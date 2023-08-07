{% macro years_between(start_date, end_date) %}
  TRUNCATE(DATEDIFF(MONTH, {{ start_date }}, {{ end_date }})/12)
{% endmacro %}
