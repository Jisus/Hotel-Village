class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.references :reserva
      t.string :cliente
      t.string :quarto
      t.datetime :entrada
      t.datetime :saida
      t.string :pagamento
      t.date :datapagamento
      t.string :consumo

      t.timestamps
    end
    add_index :checkouts, :reserva_id
  end
end
