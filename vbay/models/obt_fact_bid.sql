with f_bids as (
    select * from {{ ref('fact_bid') }}
),
d_users as (
    select * from {{ ref('dim_user') }}
),
d_items as (
    select * from {{ ref('dim_items') }}
),
d_date as (
    select * from {{ ref('dim_date') }}
),
d_bids as (
    select * from {{ ref('dim_bids') }}
)
select 
    d_users.*, 
    d_items.*, 
    d_bids.*
from f_bids as f
    left join d_users on f.user_id_key = d_users.user_id_key
    left join d_items on f.item_id_key = d_items.item_id_key
    left join d_bids on f.bid_id_key = d_bids.bid_id_key



