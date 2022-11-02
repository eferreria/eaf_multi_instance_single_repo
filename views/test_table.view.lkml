view: test_table {
  sql_table_name: `looker-private-demo.thelook.test_table`
    ;;

  dimension: test {
    type: number
    sql: ${TABLE}.test ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
