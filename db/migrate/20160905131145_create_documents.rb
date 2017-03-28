class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents, :id => :uuid do |t|
      t.string   "country_code", default: "de",     null: false
      t.uuid     "subject_id",                      null: false
      t.string   "subject_type", default: "Loan",   null: false
      t.string   "category"
      t.integer  "year"
      t.string   "owner",        default: "system", null: false
      t.timestamps null: false
    end
  end
end
