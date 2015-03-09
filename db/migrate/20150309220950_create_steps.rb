class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.boolean :completed
      t.datetime :completed_at
      t.integer :order
      t.datetime :deadline
      t.string :name
      t.references :user, index: true
      t.references :todo, index: true

      t.timestamps
    end
  end
end
