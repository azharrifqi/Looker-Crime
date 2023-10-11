# The name of this view in Looker is "Test Model Series Beat Explain Forecast"
view: test_model_series_beat_explain_forecast {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datalabs-int-bigdata.test_data.test_model_series_beat_explain_forecast` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Confidence Level" in Explore.

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_confidence_level {
    type: sum
    sql: ${confidence_level} ;;  }
  measure: average_confidence_level {
    type: average
    sql: ${confidence_level} ;;  }

  dimension: holiday_effect {
    type: number
    sql: ${TABLE}.holiday_effect ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: seasonal_period_daily {
    type: number
    sql: ${TABLE}.seasonal_period_daily ;;
  }

  dimension: seasonal_period_monthly {
    type: number
    sql: ${TABLE}.seasonal_period_monthly ;;
  }

  dimension: seasonal_period_quarterly {
    type: number
    sql: ${TABLE}.seasonal_period_quarterly ;;
  }

  dimension: seasonal_period_weekly {
    type: number
    sql: ${TABLE}.seasonal_period_weekly ;;
  }

  dimension: seasonal_period_yearly {
    type: number
    sql: ${TABLE}.seasonal_period_yearly ;;
  }

  dimension: spikes_and_dips {
    type: number
    sql: ${TABLE}.spikes_and_dips ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: step_changes {
    type: number
    sql: ${TABLE}.step_changes ;;
  }

  dimension: time_series_adjusted_data {
    type: number
    sql: ${TABLE}.time_series_adjusted_data ;;
  }

  dimension: time_series_data {
    type: number
    sql: ${TABLE}.time_series_data ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: time_series_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.time_series_timestamp ;;
  }

  dimension: time_series_type {
    type: string
    sql: ${TABLE}.time_series_type ;;
  }

  dimension: trend {
    type: number
    sql: ${TABLE}.trend ;;
  }
  measure: count {
    type: count
  }
}
