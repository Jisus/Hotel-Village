class Checkout < ActiveRecord::Base
  belongs_to :reserva
  attr_accessible :cliente, :consumo, :datapagamento, :entrada, :pagamento, :quarto, :saida
  
end
