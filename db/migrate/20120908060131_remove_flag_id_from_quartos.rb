class RemoveFlagIdFromQuartos < ActiveRecord::Migration
  def up
    remove_column :quartos, :flag_id
  end

  def down
    add_column :quartos, :flag_id, :integer
  end
end
