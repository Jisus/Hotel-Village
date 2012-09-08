class Flag < ActiveRecord::Base
  attr_accessible :nome
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
end
