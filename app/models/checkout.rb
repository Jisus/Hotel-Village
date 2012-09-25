class Checkout < ActiveRecord::Base
  
  attr_accessible :cliente, :dataEntrada, :dataSaida, :quarto, :tipoPagamento, :valor_total
  
  has_many :Consumo, :dependent => :destroy
  
end
