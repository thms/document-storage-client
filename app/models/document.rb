class Document < ApplicationRecord

  belongs_to :loan, :polymorphic => true
  has_many :versions
  
end
