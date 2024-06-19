
view: date_series {
  derived_table: {
    sql: with cte as (SELECT
    case when engage_date is null then (select max(engage_date) from  `traininglookerteam.CRM_SALES.sales_pipeline`) else engage_date end as final_engage_date,
    case when close_date is null then (select max(close_date) from  `traininglookerteam.CRM_SALES.sales_pipeline`) else close_date end  as final_close_date
FROM
    `traininglookerteam.CRM_SALES.sales_pipeline`),

cte1 AS (
  SELECT
    MIN(final_engage_date) AS startdate,
    MAX(final_close_date) AS enddate,
  FROM cte
)
SELECT
  date AS merge_date
FROM
  UNNEST(GENERATE_DATE_ARRAY((SELECT startdate FROM cte1), (SELECT enddate FROM cte1))) AS date
;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension_group: merge {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.merge_date ;;
  }
}
