# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Loan.destroy_all
Document.destroy_all
Version.destroy_all
Loan.create(
  :id => '110118bc-316e-11e6-b8e2-c715121d5b6f',
  :loan_number => '123456789',
  :country_code => 'de'
)

Loan.create(
  :id => '3162a936-316e-11e6-b8e2-c715121d5b6f',
  :loan_number => '56789373',
  :country_code => 'de'
)

Loan.create(
  :id => '38ef911e-316e-11e6-b8e2-c715121d5b6f',
  :loan_number => '2435635235',
  :country_code => 'de'
)

Loan.create(
  :id => '406d0692-316e-11e6-b8e2-c715121d5b6f',
  :loan_number => '123456789',
  :country_code => 'de'
)