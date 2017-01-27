class CreateCups < ActiveRecord::Migration[5.0]
  def change
    create_table :cups do |t|
      t.string :user_identifier, null: false
      t.string :user_name, null: false

      t.timestamps
    end
  end
end
