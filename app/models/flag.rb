class Flag < ActiveRecord::Base
  attr_accessible :nome
  validates_presence_of :nome
  
  has_and_belongs_to_many :Quarto
  
  before_destroy :DeleteValidate?
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end  
  
  def DeleteValidate?
    if self.Quarto.count > 0
      errors.add(:base, "Existem quartos usando esse Flag")
    end
    errors.blank?
  end
  
end
