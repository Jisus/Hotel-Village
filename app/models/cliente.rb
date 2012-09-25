class Cliente < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :bairro, :cep, :cidade, :complemento, :email, :estado, :nome, :numero, :pais, :rua, :sobrenome, :telefone, :celular
    
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE :search OR sobrenome LIKE :search OR email LIKE :search OR telefone LIKE :search OR celular LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
  
  def nome_completo
    "#{self.nome} #{self.sobrenome}"
  end
  
end
