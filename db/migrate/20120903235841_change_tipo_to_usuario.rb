class ChangeTipoToUsuario < ActiveRecord::Migration
  def up
    change_table :usuarios do |t|
      t.remove :tipo
      t.string :tipo
    end
  end

  def down
    change_table :usuarios do |t|
      t.remove :tipo
      t.integer :tipo
    end
  end
end
