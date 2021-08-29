class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :artist, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end

    add_index :tracks, :name
  end
end
