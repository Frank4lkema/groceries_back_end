# frozen_string_literal: true

# migration
class CreateListProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :list_products do |t|
      t.references :list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.boolean :collected, default: false

      t.timestamps
    end
  end
end
