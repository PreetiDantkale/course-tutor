class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.decimal :experience
      t.string :status
      t.references :course, null: false, foreign_key: true
      t.string :specialization

      t.timestamps
    end
  end
end
