class CreateQuartos < ActiveRecord::Migration
  def change
    create_table :quartos do |t|
      t.integer :solterio
      t.integer :casal
      t.string :desc
      t.integer :flag_id
      t.string :diaria

      t.timestamps
    end
  end
end
