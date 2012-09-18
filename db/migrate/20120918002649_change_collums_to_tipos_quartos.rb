class ChangeCollumsToTiposQuartos < ActiveRecord::Migration
  def up
    change_column :tipos_quartos, :cama_casal, :integer
    change_column :tipos_quartos, :cama_solteiro, :integer
  end

  def down
    change_column :tipos_quartos, :cama_casal, :string
    change_column :tipos_quartos, :cama_solteiro, :string
  end
end
