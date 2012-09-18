class CreateTiposQuartos < ActiveRecord::Migration
  def change
    create_table :tipos_quartos do |t|
      t.string :nome
      t.string :cama_solteiro
      t.string :cama_casal

      t.timestamps
    end
  end
end
