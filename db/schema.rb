# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_26_011255) do

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "bookmarked_tracklists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tracklist_id", null: false
    t.boolean "has_unseen_updates", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tracklist_id"], name: "index_bookmarked_tracklists_on_tracklist_id"
    t.index ["user_id"], name: "index_bookmarked_tracklists_on_user_id"
  end

  create_table "bookmarked_tracks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "track_id", null: false
    t.boolean "has_unseen_updates", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["track_id"], name: "index_bookmarked_tracks_on_track_id"
    t.index ["user_id"], name: "index_bookmarked_tracks_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suggested_track_identification_votes", force: :cascade do |t|
    t.integer "identification_id", null: false
    t.integer "voter_id", null: false
    t.boolean "is_identification_correct", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identification_id"], name: "index_suggested_track_identification_votes_on_identification_id"
    t.index ["voter_id"], name: "index_suggested_track_identification_votes_on_voter_id"
  end

  create_table "suggested_track_identifications", force: :cascade do |t|
    t.integer "tracklist_track_id", null: false
    t.integer "identifier_id", null: false
    t.string "suggested_name"
    t.integer "suggested_artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identifier_id"], name: "index_suggested_track_identifications_on_identifier_id"
    t.index ["suggested_artist_id"], name: "index_suggested_track_identifications_on_suggested_artist_id"
    t.index ["tracklist_track_id"], name: "index_suggested_track_identifications_on_tracklist_track_id"
  end

  create_table "tracklist_tracks", force: :cascade do |t|
    t.integer "tracklist_id", null: false
    t.integer "track_id", null: false
    t.time "cue_time"
    t.integer "predessor_id"
    t.integer "identifier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["identifier_id"], name: "index_tracklist_tracks_on_identifier_id"
    t.index ["track_id"], name: "index_tracklist_tracks_on_track_id"
    t.index ["tracklist_id"], name: "index_tracklist_tracks_on_tracklist_id"
  end

  create_table "tracklists", force: :cascade do |t|
    t.string "name", null: false
    t.date "date_played", null: false
    t.integer "artist_id", null: false
    t.string "youtube_url"
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_tracklists_on_artist_id"
    t.index ["creator_id"], name: "index_tracklists_on_creator_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.integer "artist_id"
    t.integer "label_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["label_id"], name: "index_tracks_on_label_id"
    t.index ["name"], name: "index_tracks_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email_address", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_address"], name: "index_users_on_email_address"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "bookmarked_tracklists", "tracklists"
  add_foreign_key "bookmarked_tracklists", "users"
  add_foreign_key "bookmarked_tracks", "tracks"
  add_foreign_key "bookmarked_tracks", "users"
  add_foreign_key "suggested_track_identification_votes", "suggested_track_identifications", column: "identification_id"
  add_foreign_key "suggested_track_identification_votes", "users", column: "voter_id"
  add_foreign_key "suggested_track_identifications", "artists", column: "suggested_artist_id"
  add_foreign_key "suggested_track_identifications", "tracklist_tracks"
  add_foreign_key "suggested_track_identifications", "users", column: "identifier_id"
  add_foreign_key "tracklist_tracks", "tracklists"
  add_foreign_key "tracklist_tracks", "tracks"
  add_foreign_key "tracklist_tracks", "users", column: "identifier_id"
  add_foreign_key "tracklists", "artists"
  add_foreign_key "tracklists", "users", column: "creator_id"
  add_foreign_key "tracks", "artists"
  add_foreign_key "tracks", "labels"
end
