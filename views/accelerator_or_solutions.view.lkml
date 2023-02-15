view: accelerator_or_solutions {
  derived_table: {
    sql: SELECT Accelerators_or_Solutions,count(*) cnt
       FROM `garage-automation-373912.garage_management.customer_visits` c
       left join  unnest(c.Accelerators_or_Solutions_Demonstrated) as Accelerators_or_Solutions
      group by Accelerators_or_Solutions
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: accelerators_or_solutions {
    type: string
    sql: ${TABLE}.Accelerators_or_Solutions ;;
  }

  dimension: f0_ {
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  measure: cnt {
    type: sum
    drill_fields: [detail*]
  }

  set: detail {
    fields: [accelerators_or_solutions, f0_]
  }
}
