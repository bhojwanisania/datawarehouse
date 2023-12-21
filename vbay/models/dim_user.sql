WITH stg_user AS (
    SELECT * FROM {{ source('vBay', 'vb_users') }}
)

select  {{ dbt_utils.generate_surrogate_key(['stg_user.user_id']) }} as user_id_key, 
    stg_user.* 
from stg_user
