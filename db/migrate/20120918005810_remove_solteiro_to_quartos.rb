class RemoveSolteiroToQuartos < ActiveRecord::Migration
  def up
    remove_column :quartos, :solterio
  end

  def down
    add_column :quartos, :solterio
  end
end
