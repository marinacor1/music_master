ActiveRecord::Schema.define(version: 20160413205750) do

  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree

  add_foreign_key "songs", "artists"
end
