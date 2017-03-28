class Loan < ApplicationRecord
  
  has_many :documents, :as => :subject
  
end
