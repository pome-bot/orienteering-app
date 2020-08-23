class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|

      t.references :control, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :answer, null: false

      t.timestamps
    end
    add_index :answers, [:control_id, :user_id], unique: true
  end
end
