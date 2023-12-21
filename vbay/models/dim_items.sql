WITH stg_items AS (
    SELECT * FROM {{ source('vBay', 'vb_items') }}
)

select  {{ dbt_utils.generate_surrogate_key(['stg_items.item_id']) }} as item_id_key, 
    item_name,
    item_type,
    item_description,
    item_sold,
    item_soldamount
from stg_items