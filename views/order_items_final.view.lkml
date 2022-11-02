view: order_items_final {
  sql_table_name: `looker-private-demo.thelook.order_items_final`
    ;;

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [users.last_name, users.id, users.first_name]
  }
}
