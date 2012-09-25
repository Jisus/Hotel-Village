class RemoveReservaConsumoTable < ActiveRecord::Migration
  def change
    drop_table :reserva_consumos
  end
end
