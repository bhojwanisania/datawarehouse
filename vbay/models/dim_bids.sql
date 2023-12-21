WITH stg_bids AS (
    SELECT * FROM {{ source('vBay', 'vb_bids') }}
)

SELECT {{ dbt_utils.generate_surrogate_key(['stg_bids.bid_id']) }} as bid_id_key,
    bid_datetime,
    bid_amount,
    bid_status
FROM stg_bids