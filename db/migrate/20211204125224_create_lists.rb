class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.date :date

      t.timestamps
    end
  end
end
