class CreateDaates < ActiveRecord::Migration
  def change
    create_table :daates do |t|
      t.integer :month
      t.integer :day
      t.integer :year
      t.string :event

      t.timestamps
    end
  end
end
