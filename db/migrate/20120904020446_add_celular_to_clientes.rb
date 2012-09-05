class AddCelularToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :celular, :string
  end
end
