class CreateOrienteeringUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :orienteering_users do |t|

      t.references :orienteering, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
