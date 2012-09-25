class ReferenceCheckoutToReserva < ActiveRecord::Migration
  def change
    add_column :checkouts, :reserva_id, :integer
  end
end
