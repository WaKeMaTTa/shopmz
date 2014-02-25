class AddRegistredAtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :registred_at, :datetime
  end
end
