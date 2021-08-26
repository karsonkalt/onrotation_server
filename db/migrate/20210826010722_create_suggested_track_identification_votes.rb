class CreateSuggestedTrackIdentificationVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :suggested_track_identification_votes do |t|
      t.references :suggested_track_identification, null: false, foreign_key: true
      # TODO Check the alias of voter to users running properly with db constraints
      t.references :voter, references: :users, null: false, foreign_key: { to_table: :users }
      t.boolean :is_identification_correct

      t.timestamps
    end
  end
end
