class FixModelLineItems < ActiveRecord::Migration
  def change
    rename_column :line_items, :orders_id, :order_id
    rename_column :line_items, :products_id, :product_id
  end
end
