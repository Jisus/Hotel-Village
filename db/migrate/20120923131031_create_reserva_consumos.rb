class CreateReservaConsumos < ActiveRecord::Migration
  def change
    create_table :reserva_consumos do |t|
      t.string :nome
      t.decimal :valor
      t.integer :quantidade
      t.references :reserva

      t.timestamps
    end
    add_index :reserva_consumos, :reserva_id
  end
end
