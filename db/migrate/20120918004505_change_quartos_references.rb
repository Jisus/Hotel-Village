class ChangeQuartosReferences < ActiveRecord::Migration
  def up
    change_table :quartos do |t|
      t.references :tipos_quartos
    end
  end

  def down
    change_table :quartos do |t|
      t.remove_references :tipos_quartos
    end
  end
end
