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
    hidden: yes
    sql: ARRAY_TO_STRING(${TABLE}.Client_Participants,"") as Client_Participants ;;
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
    sql: ARRAY_TO_STRING(${TABLE}.ISU_Rep,"") as ISU_Rep ;;
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
    drill_fields: [client_name,visit_date,client_participants,visit_venue,isu_rep]
  }
}

# The name of this view in Looker is "Customer Visit Remark"
view: customer_visit__remark {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Visit Remark" in Explore.

  dimension: customer_visit__remark {
    type: string
    description: "Remarks"
    sql: customer_visit__remark ;;
  }
}

# The name of this view in Looker is "Customer Visit Isu Rep"
view: customer_visit__isu_rep {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Visit Isu Rep" in Explore.

  dimension: customer_visit__isu_rep {
    type: string
    description: "ISU Rep name"
    sql: customer_visit__isu_rep ;;
  }
}

# The name of this view in Looker is "Customer Visit Garage Rep"
view: customer_visit__garage_rep {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Visit Garage Rep" in Explore.

  dimension: customer_visit__garage_rep {
    type: string
    description: "People who represented Garage"
    sql: customer_visit__garage_rep ;;
  }
}

# The name of this view in Looker is "Customer Visit Client Participants"
view: customer_visit__client_participants {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Visit Client Participants" in Explore.

  dimension: customer_visit__client_participants {
    type: string
    description: "Persons who visited from Client Side."
    sql: customer_visit__client_participants ;;
  }
}

# The name of this view in Looker is "Customer Visit Accelerators or Solutions Demonstrated"
view: customer_visit__accelerators_or_solutions_demonstrated {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Visit Accelerators or Solutions Demonstrated" in Explore.

  dimension: customer_visit__accelerators_or_solutions_demonstrated {
    type: string
    description: "List of Solutions or accelerators demonstrated"
    sql: customer_visit__accelerators_or_solutions_demonstrated ;;
  }
}
