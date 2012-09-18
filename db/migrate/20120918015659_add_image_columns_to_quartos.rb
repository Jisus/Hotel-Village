class AddImageColumnsToQuartos < ActiveRecord::Migration
  def self.up
    add_attachment :quartos, :imagem
  end

  def self.down
    remove_attachment :quartos, :imagem
  end
end