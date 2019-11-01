connection: "thelook"

# include all the views
include: "*.view"

datagroup: crunchbase_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: crunchbase_default_datagroup

explore: acquisitions {}

explore: companies {}

explore: companies_to_update {}

explore: competitions {}

explore: employment {}

explore: funding {}

explore: investments {
  join: funding {
    type: left_outer
    sql_on: ${investments.funding_id} = ${funding.id} ;;
    relationship: many_to_one
  }
}

explore: ipo {}

explore: offices {}

explore: people {}

explore: runs {}

explore: tags {}
