class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.integer :urgency
      t.string :color
      t.references :todo, index: true

      t.timestamps
    end
  end
end
