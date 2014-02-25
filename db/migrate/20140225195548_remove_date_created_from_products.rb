class RemoveDateCreatedFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :date_created, :datetime
  end
end
