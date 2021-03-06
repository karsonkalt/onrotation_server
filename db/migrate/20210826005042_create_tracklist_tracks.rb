class CreateTracklistTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracklist_tracks do |t|
      t.references :tracklist, :null => false, foreign_key: true
      t.references :track, :null => false, foreign_key: true
      t.time :cue_time
      # TODO Figure out the proper way to make predessor, either t.references and then self PK or t.int and enforce uniqueness.
      # TODO A better way is to look at the next item, not the predecessor.
      t.integer :predessor_id, :unique => true
      t.references :identifier, references: :users, :null => false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
