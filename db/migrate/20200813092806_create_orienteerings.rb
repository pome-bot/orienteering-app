class CreateOrienteerings < ActiveRecord::Migration[6.0]
  def change
    create_table :orienteerings do |t|

      t.string :name, null: false
      t.index :name, unique: true
      t.bigint :host_id, null: false, foreign_key: true
      t.index :host_id

      t.timestamps
    end
  end
end
