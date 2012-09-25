class Consumo < ActiveRecord::Base
  belongs_to :checkout
  attr_accessible :desc, :qnt, :valor, :valor_total
end
