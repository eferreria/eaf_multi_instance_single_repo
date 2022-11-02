connection: "ef-bq"

# include all the views
include: "/views/**/*.view"

datagroup: eaf_poc_multi_instance_single_repo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eaf_poc_multi_instance_single_repo_default_datagroup

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_test {
  join: users {
    type: left_outer
    sql_on: ${order_items_test.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_final {
  join: users {
    type: left_outer
    sql_on: ${order_items_final.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_test2 {
  join: users {
    type: left_outer
    sql_on: ${order_items_test2.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: test_table {}

explore: users {}
