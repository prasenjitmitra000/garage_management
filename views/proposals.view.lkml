# The name of this view in Looker is "Proposals"
view: proposals {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `garage_management.proposals`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Name" in Explore.

  dimension: client_name {
    type: string
    description: "Name of the client"
    sql: ${TABLE}.Client_Name ;;
  }

  dimension: contribution_by_practice {
    type: string
    sql: ${TABLE}.Contribution_by_Practice ;;
  }

  dimension: crm {
    type: number
    description: "CRM Number"
    sql: ${TABLE}.CRM ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_crm {
    type: sum
    sql: ${crm} ;;
  }

  measure: average_crm {
    type: average
    sql: ${crm} ;;
  }

  dimension: extended_garage_support {
    type: string
    sql: ${TABLE}.Extended_Garage_Support ;;
  }

  dimension: opportunity_name {
    type: string
    description: "Name of the Opportunity"
    sql: ${TABLE}.Opportunity_Name ;;
  }

  dimension: practice_involvement_in_client_visit {
    type: string
    sql: ${TABLE}.Practice_involvement_in_Client_Visit ;;
  }

  dimension: practice_involvement_in_delivery {
    type: string
    sql: ${TABLE}.Practice_involvement_in_Delivery ;;
  }

  dimension: practice_involvement_in_sales_and_solution {
    type: string
    sql: ${TABLE}.Practice_Involvement_in_Sales_and_Solution ;;
  }

  dimension: practice_name {
    type: string
    description: "Name of the practice"
    sql: ${TABLE}.Practice_Name ;;
  }

  dimension: proposal_current_status {
    type: string
    sql: ${TABLE}.Proposal_Current_Status ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.Remarks ;;
  }

  dimension: sales_owner {
    type: string
    description: "Name of the Sales Owner"
    sql: ${TABLE}.Sales_Owner ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: start {
    type: time
    description: "Start date of the proposal"
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
    sql: ${TABLE}.Start_Date ;;
  }

  measure: count {
    type: count
    drill_fields: [opportunity_name, client_name, practice_name]
  }
}
