class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false, default: ""
      t.text :description,         null: false
      t.integer :category_id,      null: false
      t.integer :software_id,      null: false
      t.string :version,           null: false, default: ""
      t.integer :operating_system_id,    null: false
      t.integer :status_id, null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
