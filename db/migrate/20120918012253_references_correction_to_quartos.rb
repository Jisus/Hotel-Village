class ReferencesCorrectionToQuartos < ActiveRecord::Migration
  def up
    change_table :quartos do |t|
      t.references :tipos_quarto
      t.remove_references :tipos_quartos
    end
  end

  def down
    change_table :quartos do |t|
      t.references :tipos_quartos
      t.remove_references :tipos_quarto
    end
  end
end
