class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, :null => false, :unique => true
      t.string :first_name
      t.string :last_name
      t.string :email_address, :null => false, :unique => true
      t.string :password_digest
      # TODO Add bcrypt column

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email_address
  end
end
