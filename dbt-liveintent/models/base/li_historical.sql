with source as (

    select * from {{var('schema')}}.liveintent_historical

),

renamed as (

select
        "Event Date" as "day",
       "Publisher ID" as publisher_id,
       "Image URL" as thumbnail_url,
       "Clicks" as clicks,
       "Impressions" as impressions,
       replace("Gross Revenue", '$', '')::float as "costs",
       substring("Click URL" from 'ACT[0-9]{10}ACT') as act,
       substring("Click URL" from 'utm_campaign=([^&]*)') as campaign_name

    from source

)

select * from renamed
