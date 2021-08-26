class CreateBookmarkedTracklists < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarked_tracklists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tracklist, null: false, foreign_key: true
      t.boolean :has_unseen_updates

      t.timestamps
    end
  end
end
