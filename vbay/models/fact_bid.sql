WITH stg_dimusers AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_id_key, user_id
    FROM {{ source('vBay', 'vb_users') }}
),

stg_dimitems AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['item_id']) }} as item_id_key, item_id,
    item_buyer_user_id
    FROM {{ source('vBay', 'vb_items') }}
),
stg_dimbids AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['bid_id']) }} as bid_id_key, bid_id
     bid_status, bid_datetime, bid_amount, bid_user_id
    FROM {{ source('vBay', 'vb_bids') }}
)

SELECT
    u.user_id_key,
    i.item_id_key,
    b.bid_id_key, b.bid_status, b.bid_datetime, b.bid_amount
FROM stg_dimusers u
    join stg_dimitems i on u.user_id = i.item_buyer_user_id
    join stg_dimbids b on u.user_id = b.bid_user_id