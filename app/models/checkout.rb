class Checkout < ActiveRecord::Base
  
  attr_accessible :cliente, :dataEntrada, :dataSaida, :quarto, :tipoPagamento, :valor_total
  
  has_many :Consumo, :dependent => :destroy
  
  validates_presence_of :cliente, :dataEntrada, :dataSaida, :quarto, :tipoPagamento, :valor_total
  
  validates :dataSaida, :presence => true, :if => :checkout_valido?
  
  usar_como_dinheiro :valor_total
  
  def checkout_valido?
      dataSaida > dataEntrada
  end
  
  def diarias
    diarias = self.dataEntrada.time.hour < 12 ? 1 : 0
    diarias = diarias + (self.dataSaida.to_date - self.dataEntrada.to_date).to_i
    diarias = self.dataSaida.time.hour > 12 ? diarias + 1 : diarias
    diarias
  end
  
  def valor_diarias
    diarias = self.diarias
    valor = self.Quarto.diaria * diarias
    valor
  end
  
end
