class CreateSuggestedTrackIdentifications < ActiveRecord::Migration[6.1]
  def change
    create_table :suggested_track_identifications do |t|
      t.references :tracklist_track, null: false, foreign_key: true
      # TODO Check the alias of identifier to users running properly with db constraints
      t.references :identifier, references: :users, null: false, foreign_key: { to_table: :users }
      t.string :suggested_name
      # TODO Check the alias of suggested_artist to artist running properly with db constraints
      t.references :suggested_artist, references: :artists, null: false, foreign_key: { to_table: :artists }

      t.timestamps
    end
  end
end
