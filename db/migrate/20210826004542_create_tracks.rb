class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :artist, null: false, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
