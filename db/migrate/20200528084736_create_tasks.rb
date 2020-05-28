class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|

      t.string :content
      t.text :explanation
      t.date :limit
      t.boolean :execution, null: false, default: false
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
