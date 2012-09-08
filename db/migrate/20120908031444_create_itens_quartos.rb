class CreateItensQuartos < ActiveRecord::Migration
  def change
    create_table :itens_quartos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
