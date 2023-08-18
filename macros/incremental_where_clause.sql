{%- macro incremental_where_clause(column_name, lookback_window, periods) -%}

WHERE {{ column_name }} >= (SELECT DATEADD('{{ periods }}' , {{ lookback_window }}, max( {{ column_name }} )) from {{ this }})

{%- endmacro -%}
