# The name of this view in Looker is "Projects"
view: projects {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `garage_management.projects`
    ;;
  drill_fields: [project_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: project_id {
    primary_key: yes
    type: string
    description: "Id of Project"
    sql: ${TABLE}.Project_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Budget Amount" in Explore.

  dimension: budget_amount {
    type: number
    description: "Budget amount set for the project"
    sql: ${TABLE}.Budget_Amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_budget_amount {
    type: sum
    sql: ${budget_amount} ;;
  }

  measure: average_budget_amount {
    type: average
    sql: ${budget_amount} ;;
  }

  dimension: budget_name {
    type: string
    description: "Name of Budget Set for Project"
    sql: ${TABLE}.Budget_Name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    description: "Estimated Project Date"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.End_Date ;;
  }

  dimension: project_name {
    type: string
    description: "Name of the Project"
    sql: ${TABLE}.Project_Name ;;
  }

  dimension_group: start {
    type: time
    description: "Project Start Date"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Start_Date ;;
  }

  measure: count {
    type: count
    drill_fields: [project_id, budget_name, project_name]
  }
}
