# Define the database connection to be used for this model.
connection: "garage_management"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: garage_management_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: garage_management_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Garage Management"

explore: customer_visit {
  join: customer_visit__remark {
    view_label: "Customer Visit: Remark"
    sql: LEFT JOIN UNNEST(${customer_visit.remark}) as customer_visit__remark ;;
    relationship: one_to_many
  }

  join: customer_visit__isu_rep {
    view_label: "Customer Visit: Isu Rep"
    sql: LEFT JOIN UNNEST(${customer_visit.isu_rep}) as customer_visit__isu_rep ;;
    relationship: one_to_many
  }

  join: customer_visit__garage_rep {
    view_label: "Customer Visit: Garage Rep"
    sql: LEFT JOIN UNNEST(${customer_visit.garage_rep}) as customer_visit__garage_rep ;;
    relationship: one_to_many
  }

  join: customer_visit__client_participants {
    view_label: "Customer Visit: Client Participants"
    sql: LEFT JOIN UNNEST(${customer_visit.client_participants}) as customer_visit__client_participants ;;
    relationship: one_to_many
  }

  join: customer_visit__accelerators_or_solutions_demonstrated {
    view_label: "Customer Visit: Accelerators Or Solutions Demonstrated"
    sql: LEFT JOIN UNNEST(${customer_visit.accelerators_or_solutions_demonstrated}) as customer_visit__accelerators_or_solutions_demonstrated ;;
    relationship: one_to_many
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: proposals {}

explore: projects {}
