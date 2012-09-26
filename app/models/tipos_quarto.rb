class TiposQuarto < ActiveRecord::Base
  attr_accessible :cama_casal, :cama_solteiro, :nome
  
  validates_presence_of :cama_casal, :cama_solteiro, :nome
end
