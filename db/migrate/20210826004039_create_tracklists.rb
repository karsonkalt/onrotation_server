class CreateTracklists < ActiveRecord::Migration[6.1]
  def change
    create_table :tracklists do |t|
      t.string :name
      t.date :date_played
      t.references :artist, :null => false, :foreign_key => true
      t.string :soundcloud_track_id, :unique => true
      # TODO Check the alias of creator to users running properly with db constraints
      t.references :creator, :references => :users, :null => false, :foreign_key => { :to_table => :users}

      t.timestamps
    end
  end
end
