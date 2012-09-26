class AjustesDefualts < ActiveRecord::Migration
  def up
    change_column :tipos_quartos, :cama_casal, :integer, :default => 0, :null => false
    change_column :tipos_quartos, :cama_solteiro, :integer, :default => 0, :null => false
  end

  def down
    change_column :tipos_quartos, :cama_casal, :integer
    change_column :tipos_quartos, :cama_solteiro, :integer
  end
end
