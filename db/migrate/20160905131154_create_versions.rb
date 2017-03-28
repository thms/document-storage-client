class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions, :id => :uuid do |t|
      t.uuid     "document_id"
      t.string   "file_file_name"
      t.string   "file_content_type"
      t.integer  "file_file_size"
      t.datetime "file_updated_at"
      t.string   "file_fingerprint"
      t.string   "uploaded_by",       default: "system",         null: false
      t.string   "reason",            default: "inital version", null: false
      t.datetime "version"
      t.timestamps null: false
    end
  end
end
