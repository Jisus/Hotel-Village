class Quarto < ActiveRecord::Base
  attr_accessible :desc, :diaria, :flag_id, :flag_ids, :tipos_quarto_id, :imagem

  has_and_belongs_to_many :flags
  belongs_to :tipos_quarto
  
  has_many :Reserva, :dependent => :destroy
  
  validates :diaria, :tipos_quarto_id, :presence => true
  validates_associated :tipos_quarto
  
  usar_como_dinheiro :diaria
  has_attached_file :imagem, :styles => { :medium => "280x256#", :thumb => "200x200#" }
  
  def self.search(search)
    if search
      find(:all, :conditions => ['casal LIKE :search OR desc LIKE :search OR diaria LIKE :search', {:search => "%#{search}%"}])
    else
      find(:all)
    end
  end
  
  def nome
    "#{self.id} - #{self.tipos_quarto.nome}"
  end
  
  def ocupado? (dataEntrada = false, dataSaida = false)
    ocupado = false
    self.Reserva.each do |reserva|
      if(dataEntrada > reserva.DataEntrada && dataEntrada < (reserva.DataSaida+30.minutes))
        ocupado = true
      elsif (dataSaida > reserva.DataEntrada && dataSaida < (reserva.DataSaida+30.minutes))
        ocupado = true
      elsif (dataSaida > (reserva.DataSaida+30.minutes) && dataEntrada < reserva.DataEntrada)
        ocupado = true
      else
        ocupado = false
      end
    end
    ocupado
  end
end
