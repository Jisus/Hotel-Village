class Usuario < ActiveRecord::Base
  attr_accessible :nome, :senha, :sobrenome, :tipo, :email
  
  validates_presence_of :nome
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE ? OR sobrenome LIKE :search OR email LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
  
end
