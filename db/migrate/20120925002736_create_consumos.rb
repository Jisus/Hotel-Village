class CreateConsumos < ActiveRecord::Migration
  def change
    create_table :consumos do |t|
      t.references :checkout
      t.integer :qnt
      t.string :desc
      t.decimal :valor
      t.decimal :valor_total

      t.timestamps
    end
    add_index :consumos, :checkout_id
  end
end
