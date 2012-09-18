class ChangeTipoQuartoToQuarto < ActiveRecord::Migration
  def up
    remove_column :quartos, :solteiro
    remove_column :quartos, :casal
  end

  def down
    add_column :quartos, :solteiro
    add_column :quartos, :casal
  end
end
