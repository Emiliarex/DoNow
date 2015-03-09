class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.boolean :completed
      t.datetime :completed_at
      t.string :title
      t.text :description
      t.references :category
      t.datetime :deadline

      t.timestamps
    end
  end
end
