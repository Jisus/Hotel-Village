class Quarto < ActiveRecord::Base
  attr_accessible :casal, :desc, :diaria, :flag_id, :solterio, :flag_ids

  has_and_belongs_to_many :flags
end
