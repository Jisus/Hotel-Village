class ReservaConsumo < ActiveRecord::Base
  belongs_to :reserva
  attr_accessible :nome, :quantidade, :valor
  
  usar_como_dinheiro :valor
end