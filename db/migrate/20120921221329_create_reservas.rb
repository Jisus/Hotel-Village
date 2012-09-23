class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.references :Cliente
      t.references :Quarto
      t.date :DataEntrada
      t.date :DataSaida
      t.string :Pagamento
      t.date :DataPagamento

      t.timestamps
    end
    add_index :reservas, :Cliente_id
    add_index :reservas, :Quarto_id
  end
end
