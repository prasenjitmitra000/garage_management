# The name of this view in Looker is "Customer Visit"
view: customer_visit {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `garage_management.customer_visit`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: accelerators_or_solutions_demonstrated {
    hidden: yes
    sql: ${TABLE}.Accelerators_or_Solutions_Demonstrated ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Area" in Explore.

  dimension: client_area {
    type: string
    description: "Broader Area where the client belongs to."
    sql: ${TABLE}.Client_Area ;;
  }

  dimension: client_name {
    type: string
    description: "Name of the customer visited"
    sql: ${TABLE}.Client_Name ;;
  }

  dimension: client_participants {
    type: string
    #hidden: yes
    sql: ${TABLE}.Client_Participants ;;
  }

  dimension: follow_up_or_next_step {
    type: string
    description: "What were the follow up or Next Steps taken"
    sql: ${TABLE}.Follow_Up_or_Next_Step ;;
  }

  dimension: garage_contribution {
    type: string
    description: "Contribution from Garage Side"
    sql: ${TABLE}.Garage_Contribution ;;
  }

  dimension: garage_rep {
    hidden: yes
    sql: ${TABLE}.Garage_Rep ;;
  }

  dimension: isu_rep {
    hidden: yes
    sql: ${TABLE}.ISU_Rep ;;
  }

  dimension: participation_mode {
    type: string
    description: "Whether it was a Physical Visit or Virtual Visit"
    sql: ${TABLE}.Participation_Mode ;;
  }

  dimension: purpose_of_visit {
    type: string
    description: "Purpose of visit"
    sql: ${TABLE}.Purpose_of_Visit ;;
  }

  dimension: remark {
    hidden: yes
    sql: ${TABLE}.Remark ;;
  }

  dimension: support_provided {
    type: string
    description: "What kind of support were provided"
    sql: ${TABLE}.Support_Provided ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: visit {
    type: time
    description: "Date the customer visited"
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
    sql: ${TABLE}.Visit_Date ;;
  }

  dimension: visit_venue {
    type: string
    description: "Place of Visit where the visit happened."
    sql: ${TABLE}.Visit_Venue ;;
  }

  measure: count {
    type: count
    #drill_fields: [client_name,visit_date,client_participants,visit_venue,isu_rep]
    drill_fields: [client_name,visit_date]
  }
}
