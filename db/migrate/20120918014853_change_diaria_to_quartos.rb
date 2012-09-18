class ChangeDiariaToQuartos < ActiveRecord::Migration
  def up
    change_column :quartos, :diaria, :decimal
  end

  def down
    change_column :quartos, :diaria, :string
  end
end
