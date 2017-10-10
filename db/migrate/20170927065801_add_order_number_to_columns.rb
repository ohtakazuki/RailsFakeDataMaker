class AddOrderNumberToColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :columns, :order_number, :integer
  end
end
