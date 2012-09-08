class RenameIntesQuartos < ActiveRecord::Migration
  def up
    rename_table :itens_quartos, :flags
  end

  def down
    rename_table :flags, :itens_quartos
  end
end
