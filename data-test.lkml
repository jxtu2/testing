# Data test to ensure primary key is unique
test: order_id_is_unique {
  explore_source: thelook {
    column: id {field: order_items.id}
    column: count {field: order_items.count}
    sorts: [order_items.count: desc]
    limit: 1
  }
  assert: order_id_is_unique {
    expression: ${order_items.count} = 1 ;;
  }
}
