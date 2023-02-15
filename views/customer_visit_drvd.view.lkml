view: customer_visit_drvd {
  derived_table: {
    sql: SELECT Visit_Date,
      Client_Name,
      Client_Area,
      Client_Region,
      cp.Name as Client_Participants_Name,
      cp.Designation as Client_Participants_Designation,
      ARRAY_TO_STRING(ISU_Rep,"") as ISU_Rep,
      ARRAY_TO_STRING(Garage_Rep,",") as Garage_Rep,
      Participation_Mode,
      Garage_Contribution,
      Purpose_of_Visit,
      Support_Provided,
      ARRAY_TO_STRING(Accelerators_or_Solutions_Demonstrated,",") as Accelerators_or_Solutions_Demonstrated,
      Tangible_follow_ups,
      Follow_Up_or_Next_Step,
      ARRAY_TO_STRING(Remarks,"") as Remarks FROM `garage-automation-373912.garage_management.customer_visits` T
      left join  unnest(T.Client_Participants) as cp
       ;;
  }



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

  dimension: client_name {
    type: string
    sql: ${TABLE}.Client_Name ;;
  }

  dimension: client_area {
    type: string
    sql: ${TABLE}.Client_Area ;;
  }

  dimension: client_region {
    type: string
    sql: ${TABLE}.Client_Region ;;
  }

  dimension: client_region_map {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Client_Region ;;
  }

  dimension: client_participants_name {
    type: string
    sql: ${TABLE}.Client_Participants_Name ;;
  }

  dimension: client_participants_designation {
    type: string
    sql: ${TABLE}.Client_Participants_Designation ;;
  }

  dimension: isu_rep {
    type: string
    sql: ${TABLE}.ISU_Rep ;;
  }

  dimension: garage_rep {
    type: string
    sql: ${TABLE}.Garage_Rep ;;
  }

  dimension: participation_mode {
    type: string
    sql: ${TABLE}.Participation_Mode ;;
  }

  dimension: garage_contribution {
    type: string
    sql: ${TABLE}.Garage_Contribution ;;
  }

  dimension: purpose_of_visit {
    type: string
    sql: ${TABLE}.Purpose_of_Visit ;;
  }

  dimension: support_provided {
    type: string
    sql: ${TABLE}.Support_Provided ;;
  }

  dimension: accelerators_or_solutions_demonstrated {
    type: string
    sql: ${TABLE}.Accelerators_or_Solutions_Demonstrated ;;
  }

  dimension: tangible_follow_ups {
    type: yesno
    sql: ${TABLE}.Tangible_follow_ups ;;
  }

  dimension: follow_up_or_next_step {
    type: string
    sql: ${TABLE}.Follow_Up_or_Next_Step ;;
  }

  dimension: remarks {
    type: string
    sql: ${TABLE}.Remarks ;;
  }

  measure: count {
    type: count
    drill_fields: [visit_date,
      client_name,
      client_participants_name,
      client_participants_designation,
      isu_rep,
      garage_rep,
      purpose_of_visit,
      follow_up_or_next_step,
      remarks]
  }

  measure: tangible_count {
    type: sum
    sql: case when ${tangible_follow_ups} = true then 1 else 0 end ;;
    drill_fields: [visit_date,
      client_name,
      client_participants_name,
      client_participants_designation,
      isu_rep,
      garage_rep,
      purpose_of_visit,
      follow_up_or_next_step,
      remarks]
  }

  measure: tangible_percentage {
    type: number
    sql: ${tangible_count}/${count} ;;
    value_format_name: percent_2
    drill_fields: [visit_date,
      client_name,
      client_participants_name,
      client_participants_designation,
      isu_rep,
      garage_rep,
      purpose_of_visit,
      follow_up_or_next_step,
      remarks]
  }

  set: detail {
    fields: [
      visit_date,
      client_name,
      client_area,
      client_region,
      client_participants_name,
      client_participants_designation,
      isu_rep,
      garage_rep,
      participation_mode,
      garage_contribution,
      purpose_of_visit,
      support_provided,
      accelerators_or_solutions_demonstrated,
      tangible_follow_ups,
      follow_up_or_next_step,
      remarks
    ]
  }
}
