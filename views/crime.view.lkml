# The name of this view in Looker is "Crime"
view: crime {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `test_data.crime`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Arrest" in Explore.

  dimension: arrest {
    type: yesno
    sql: ${TABLE}.arrest ;;
  }

  dimension: beat {
    type: number
    sql: ${TABLE}.beat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_beat {
    type: sum
    sql: ${beat} ;;
  }

  measure: total_beat_drill {
    type: sum
    sql: ${beat} ;;
    drill_fields: [primary_type,count]
  }

  measure: average_beat {
    type: average
    sql: ${beat} ;;
  }

  dimension: block {
    type: string
    sql: ${TABLE}.block ;;
  }

  dimension: case_number {
    type: string
    sql: ${TABLE}.case_number ;;
  }

  dimension: community_area {
    type: number
    sql: ${TABLE}.community_area ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    drill_fields: [district,total_beat,arrest]
  }

  dimension: district {
    type: number
    sql: ${TABLE}.district ;;
  }

  dimension: domestic {
    type: yesno
    sql: ${TABLE}.domestic ;;
  }

  dimension: fbi_code {
    type: string
    sql: ${TABLE}.fbi_code ;;
  }

  dimension: iucr {
    type: string
    sql: ${TABLE}.iucr ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: latlong {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude};;
  }

  dimension: location_description {
    type: string
    sql: ${TABLE}.location_description ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: primary_type {
    type: string
    sql: ${TABLE}.primary_type ;;
  }

  dimension: unique_key {
    type: number
    sql: ${TABLE}.unique_key ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_on ;;
  }

  dimension: ward {
    type: number
    sql: ${TABLE}.ward ;;
  }

  dimension: x_coordinate {
    type: number
    sql: ${TABLE}.x_coordinate ;;
  }

  dimension: y_coordinate {
    type: number
    sql: ${TABLE}.y_coordinate ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: Total_unique_key {
    type: count_distinct
    sql: ${TABLE}.unique_key ;;
  }
}
