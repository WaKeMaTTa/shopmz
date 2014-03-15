class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :product
      t.integer :quantity
      t.float :price
      t.references :orders, index: true
      t.references :products, index: true

      t.timestamps
    end
  end
end
