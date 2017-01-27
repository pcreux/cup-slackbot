class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column :slack_identifier, :string, null: false, default: ""
      t.column :name, :string, null: false, default: ""
      t.column :email, :string, null: false, default: ""
      t.column :first_name, :string, null: false, default: ""
      t.column :last_name, :string, null: false, default: ""
      t.column :real_name, :string, null: false, default: ""
      t.column :avatar_72, :string, null: false, default: ""
      t.column :avatar_192, :string, null: false, default: ""

      t.column :raw, :jsonb, null: false, default: {}

      t.timestamps
    end
  end
end
