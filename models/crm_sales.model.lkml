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
    type: inner
    sql_on: ${sales_pipeline.account} = ${accounts.account} ;;
    relationship: many_to_one
  }
  join: country_image {
    type: inner
    sql_on: ${accounts.office_location} = ${country_image.office_location};;
    relationship: many_to_one
  }
  join: date_series {
    type: inner
    sql_on: ${date_series.merge_date} BETWEEN ${sales_pipeline.engage_date} AND ${sales_pipeline.close_date}  ;;
    relationship: many_to_one
  }
}
