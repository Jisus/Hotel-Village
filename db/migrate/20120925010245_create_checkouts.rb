class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :cliente
      t.string :quarto
      t.datetime :dataEntrada
      t.datetime :dataSaida
      t.string :tipoPagamento
      t.decimal :valor_total

      t.timestamps
    end
  end
end
