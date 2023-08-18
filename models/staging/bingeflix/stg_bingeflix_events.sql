{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

WITH source AS (

    SELECT * FROM {{ source('bingeflix', 'events') }}

),

renamed AS (

    SELECT
        session_id,
        created_at,
        user_id,
        event_name,
        event_id

    FROM source

{% if is_incremental() %}

  {{ incremental_where_clause(column_name = 'created_at', lookback_window = -3, periods = 'day') }}

{% endif %}

)

SELECT * FROM renamed
