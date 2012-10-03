class TiposQuarto < ActiveRecord::Base
  attr_accessible :cama_casal, :cama_solteiro, :nome
  
  has_many :Quarto
  
  validates_presence_of :cama_casal, :cama_solteiro, :nome
  
  before_destroy :DeleteValidate?
  
  def DeleteValidate?
    if self.Quarto.count > 0
      errors.add(:base, "Existem quartos usando esse Tipo")
    end
    errors.blank?
  end
  
end
