class AddFlagsAndQuartos < ActiveRecord::Migration
  def up
    create_table :flags_quartos do |t|
      t.references :flag, :quarto
    end
  end

  def down
     drop_table :flags_quartos
  end
end
