class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :telefone
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :estado
      t.string :pais

      t.timestamps
    end
  end
end
