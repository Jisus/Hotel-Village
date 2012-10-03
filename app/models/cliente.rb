class Cliente < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :bairro, :cep, :cpf, :cidade, :complemento, :email, :estado, :nome, :numero, :pais, :rua, :sobrenome, :telefone, :celular, :password, :password_confirmation, :remember_me
    
  validates_presence_of :bairro, :cep, :cpf, :cidade, :complemento, :email, :estado, :nome, :numero, :pais, :rua, :sobrenome, :telefone
  
  has_many :Reserva
  
  before_destroy :DeleteValidate?
  
  usar_como_cpf :cpf
    
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
  
  def DeleteValidate?
    self.Reserva.each do |reserva|
      if(reserva.Checkout == nil)
        errors.add(:base, "Existe reservas ativas para esse Cliente")
      end
    end
    errors.blank?
  end
  
end
