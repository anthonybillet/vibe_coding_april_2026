view: traffic_source_stats {
  derived_table: {
    sql:
      SELECT
          t2.traffic_source,
          AVG(t1.num_of_item) AS avg_items,
          STDDEV(t1.num_of_item) AS stddev_items
      FROM
          `bigquery-public-data.thelook_ecommerce.orders` AS t1
      JOIN
          `bigquery-public-data.thelook_ecommerce.users` AS t2
      ON
          t1.user_id = t2.id
      GROUP BY
          t2.traffic_source
    ;;
  }

  dimension: traffic_source {
    primary_key: yes
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: avg_items {
    type: number
    sql: ${TABLE}.avg_items ;;
  }

  dimension: stddev_items {
    type: number
    sql: ${TABLE}.stddev_items ;;
  }
}
