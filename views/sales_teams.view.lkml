# The name of this view in Looker is "Sales Teams"
view: sales_teams {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `CRM_SALES.sales_teams` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Manager" in Explore.

  dimension: Manager {
    type: string
    sql: ${TABLE}.manager ;;
  }

  dimension: regional_office {
    type: string
    sql: ${TABLE}.regional_office ;;
  }

  dimension: sales_agent {
    type: string
    primary_key: yes
    sql: ${TABLE}.sales_agent ;;
  }
  measure: count {
    type: count
  }
}
