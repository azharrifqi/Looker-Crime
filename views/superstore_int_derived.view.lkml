view: superstore_int_derived {
  derived_table: {
    explore_source: crime {
      column: date {
        field: crime.date_month
      }
      column: arrest {
        field: crime.arrest
      }
      column: location_description {
        field: crime.location_description
      }
      column: total_profit {
        field: crime.Total_unique_key
      }
    }
    partition_keys: ["date"]
    cluster_keys: ["arrest"]
    sql_trigger_value: SELECT CURDATE() ;;
  }
  # derived_table: {
  #   sql: SELECT * FROM superstore_datasets ;;
  #   partition_keys: ["order_date"]
  #   sql_trigger_value: SELECT CURDATE();;
  # }



  dimension: arrest {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.arrest ;;
  }

  dimension: region {
    description: "The total number of orders for each user"
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: date {
    description: "The date when each user last ordered"
    type: date
    # timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
  }

  measure: total_profit {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.total_profit ;;
  }

}
