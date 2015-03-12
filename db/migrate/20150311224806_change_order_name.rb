class ChangeOrderName < ActiveRecord::Migration
  def change
    rename_column :steps, :order, :order_number
  end
end
