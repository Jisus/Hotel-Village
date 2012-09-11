class Quarto < ActiveRecord::Base
  attr_accessible :casal, :desc, :diaria, :flag_id, :solterio, :flag_ids

  has_and_belongs_to_many :flags
  
  def self.search(search)
    if search
      find(:all, :conditions => ['casal LIKE :search OR desc LIKE :search OR diaria LIKE :search OR solteiro LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
end
