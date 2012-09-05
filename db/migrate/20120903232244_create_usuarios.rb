class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.integer :tipo
      t.string :senha

      t.timestamps
    end
  end
end
