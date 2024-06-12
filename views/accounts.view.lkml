# The name of this view in Looker is "Accounts"
view: accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `CRM_SALES.accounts` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    primary_key: yes
    sql: ${TABLE}.account ;;
  }

  dimension: employees {
    type: number
    sql: ${TABLE}.employees ;;
  }

  dimension: office_location {
    type: string
    sql: ${TABLE}.office_location ;;
    map_layer_name: countries
    drill_fields: [sector,account]
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;  }
  measure: average_revenue {
    type: average
    sql: ${revenue} ;;  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: subsidiary_of {
    type: string
    sql: ${TABLE}.subsidiary_of ;;
  }

  dimension: year_established {
    datatype: date
    sql: COALESCE(extract( year from cast(concat(cast(accounts.year_established as string),'-01-01') as date)));;
  }
  measure: count {
    type: count
  }
}
