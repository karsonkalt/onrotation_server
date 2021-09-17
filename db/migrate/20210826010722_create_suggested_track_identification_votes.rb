class CreateSuggestedTrackIdentificationVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :suggested_track_identification_votes do |t|
      t.references :identification, references: :suggested_track_identifications, :null => false, foreign_key: { to_table: :suggested_track_identifications }
      # TODO Check the alias of voter to users running properly with db constraints
      t.references :voter, references: :users, :null => false, foreign_key: { to_table: :users }
      t.boolean :is_identification_correct, :null => false

      t.timestamps
    end
  end
end
