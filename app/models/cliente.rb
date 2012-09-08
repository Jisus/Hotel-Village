class Cliente < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :complemento, :email, :estado, :nome, :numero, :pais, :rua, :sobrenome, :telefone, :celular
  
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE :search OR sobrenome LIKE :search OR email LIKE :search OR telefone LIKE :search OR celular LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
  
end
