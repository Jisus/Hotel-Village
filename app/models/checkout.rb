class Checkout < ActiveRecord::Base
  
  attr_accessible :cliente, :dataEntrada, :dataSaida, :quarto, :tipoPagamento, :valor_total
  
  has_many :Consumo, :dependent => :destroy
  
  validates_presence_of :cliente, :dataEntrada, :dataSaida, :quarto, :tipoPagamento, :valor_total
  
  validates :dataSaida, :presence => true, :if => :checkout_valido?
  
  usar_como_dinheiro :valor_total
  
  def checkout_valido?
      dataSaida > dataEntrada
  end
  
end
