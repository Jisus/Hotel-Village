class ReservaValidate < ActiveModel::Validator
  def validate(record)
    if record.DataEntrada > record.DataSaida
      record.errors[:DataEntrada] << "deve ser menor que a data de Saida"
      record.errors[:DataSaida] << "deve ser maior que a data de Entrada"
    end
  end
end

class Reserva < ActiveRecord::Base
  
  belongs_to :Cliente
  
  belongs_to :Quarto
  
  has_one :Checkout
  
  validates_with ReservaValidate
  
  validates_associated :Cliente, :Quarto
  
  attr_accessible :DataEntrada, :DataPagamento, :DataSaida, :Pagamento, :Cliente_id, :Quarto_id, :Quarto
  
  validates_presence_of :Cliente_id, :DataEntrada, :DataSaida
  
  def diarias
    diarias = self.DataEntrada.time.hour < 12 ? 1 : 0
    diarias = diarias + (self.DataSaida.to_date - self.DataEntrada.to_date).to_i
    diarias = self.DataSaida.time.hour > 12 ? diarias + 1 : diarias
    diarias
  end
  
  def valor_diarias
    diarias = self.diarias
    valor = self.Quarto.diaria * diarias
    valor
  end
  
end