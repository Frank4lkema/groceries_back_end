class AddAmountToListProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :list_products, :amount, :integer
  end
end
