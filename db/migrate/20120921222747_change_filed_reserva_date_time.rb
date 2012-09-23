class ChangeFiledReservaDateTime < ActiveRecord::Migration
  def up
    change_column :reservas, :DataEntrada, :datetime
    change_column :reservas, :DataSaida, :datetime
  end

  def down
    change_column :reservas, :DataEntrada, :date
    change_column :reservas, :DataSaida, :date
  end
end
