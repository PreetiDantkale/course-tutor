class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :status
      t.string :code
      t.date :start_date
      t.date :end_date
      t.decimal :price
      t.integer :max_capacity

      t.timestamps
    end
  end
end
