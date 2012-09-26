class Consumo < ActiveRecord::Base
  belongs_to :checkout
  attr_accessible :desc, :qnt, :valor, :valor_total
  
  validates_presence_of :qnt, :valor
end
