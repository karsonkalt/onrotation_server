class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name, :unique => true, :null => false

      t.timestamps
    end

    add_index :artists, :name
  end
end
