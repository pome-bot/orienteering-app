class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|

      t.references :orienteering, null: false, foreign_key: true
      t.string :name, null: false
      t.string :question, null: false
      t.string :answer, null: false
      t.string :place_x, null: false
      t.string :place_y, null: false
      t.integer :point, null: false

      t.timestamps
    end
  end
end
