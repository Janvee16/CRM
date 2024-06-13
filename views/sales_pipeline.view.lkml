# The name of this view in Looker is "Sales Pipeline"
view: sales_pipeline {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `CRM_SALES.sales_pipeline` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.close_date ;;
  }

  dimension: close_value {
    type: number
    sql: ${TABLE}.close_value ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_close_value {
    type: sum
    sql: ${close_value} ;;  }

  measure: average_close_value {
    type: average
    sql: ${close_value} ;;  }

  dimension: deal_stage {
    type: string
    sql: ${TABLE}.deal_stage ;;
  }

  measure: deal_stage_count {
    type: count
  }

  measure: won_deals_count {
    type: number
    sql: count(CASE WHEN ${TABLE}.deal_stage = 'Won' THEN 1 ELSE NULL END) ;;
  }

  measure: lost_deals_count {
    type: number
    sql: count(CASE WHEN ${TABLE}.deal_stage = 'Lost' THEN 1 ELSE NULL END) ;;
  }


  measure: win_rate {
    type: number
    sql: (${won_deals_count} / ${deal_stage_count});;
    value_format: "#.##%"
  }

  dimension_group: engage {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.engage_date ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: cycle_length {
    type: number
    sql: DATE_DIFF(close_date, engage_date, DAY) ;;
  }

  dimension: product {
    type: string
    sql:  (CASE WHEN ${TABLE}.product = 'GTXPro' THEN 'GTX Pro' ELSE ${TABLE}.product END);;
  }

  dimension: sales_agent {
    type: string
    sql: ${TABLE}.sales_agent ;;
  }
  measure: count {
    type: count
  }
}
