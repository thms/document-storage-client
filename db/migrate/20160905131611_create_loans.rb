class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans, :id => :uuid do |t|
      t.string :loan_number
      t.string :country_code
      t.timestamps null: false
    end
  end
end
