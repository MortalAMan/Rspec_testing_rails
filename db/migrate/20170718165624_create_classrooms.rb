class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.string :code
      t.string :teacher, null:false
      t.integer :student_count, default: 0
      t.boolean :active, default: true
      t.string :category

      t.timestamps
    end
  end
end
