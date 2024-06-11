# Define the database connection to be used for this model.
connection: "crm_sales"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: crm_sales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: crm_sales_default_datagroup


explore: accounts {}

explore: sales_teams {}

explore: products {}

explore: sales_pipelines {
  from: sales_pipeline
}

explore: sales_pipeline {
  join: products {
    type: left_outer
    sql_on: ${sales_pipeline.product} = ${products.product};;
    relationship: many_to_one
  }
  join: sales_teams {
    type: left_outer
    sql_on: ${sales_pipeline.sales_agent} = ${sales_teams.sales_agent} ;;
    relationship: many_to_one
  }
  join: accounts {
    type: left_outer
    sql_on: ${sales_pipeline.account} = ${accounts.account} ;;
    relationship: many_to_one
  }
}
