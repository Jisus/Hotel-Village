class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :desc
      t.decimal :valor

      t.timestamps
    end
  end
end
