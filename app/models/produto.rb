class Produto < ActiveRecord::Base
  attr_accessible :desc, :nome, :valor
  
  usar_como_dinheiro :valor
  
  validates_presence_of :nome, :valor
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE :search OR desc LIKE :search OR valor LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
end
