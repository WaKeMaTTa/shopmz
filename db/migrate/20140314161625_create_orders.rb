class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.string :payment_method
      t.text :delivery_address
      t.string :delivery_city
      t.string :customer_name

      t.timestamps
    end
  end
end
