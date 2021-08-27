class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :first_name
      t.string :last_name
      t.string :email_address, unique: true
      t.string :uid, unique: true

      t.timestamps
    end
  end
end
