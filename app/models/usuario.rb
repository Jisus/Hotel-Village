class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :nome, :senha, :sobrenome, :tipo, :email
  
  validates_presence_of :email, :nome, :sobrenome, :email
  
  def self.search(search)
    if search
      find(:all, :conditions => ['nome LIKE ? OR sobrenome LIKE :search OR email LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
  
end
