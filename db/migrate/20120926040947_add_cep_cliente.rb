class AddCepCliente < ActiveRecord::Migration
  def up
    add_column :clientes, :cpf, :string
  end

  def down
    remove_column :clientes, :cpf, :string
  end
end
