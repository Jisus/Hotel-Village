class ReservasController < ApplicationController
  
  before_filter :authenticate_cliente!, :only => [:nova, :create, :sucesso]

  def after_sign_in_path_for(resource)
    Rails.application.routes.url_helpers.cliente_sucesso_path
  end
  
  # GET /reservas/show/:dataEntrada/:dataSaida
  def show    
    @quartos = Quarto.all
    @quartos_livres = [];
    
    @quartos.each do |quarto|
      if !quarto.ocupado? params[:dataEntrada].to_datetime, params[:dataSaida].to_datetime
        @quartos_livres.push quarto
      end
    end
    
  end
  
  # GET /reservas/nova/:id/:dataEntrada/:dataSaida
  def nova
    @quarto = Quarto.find(params[:id])
    
    @reserva = Reserva.new({
      :DataEntrada => params[:dataEntrada].to_datetime,
      :DataSaida => params[:dataSaida].to_datetime,
      :Quarto_id => @quarto.id
      })
    
    end
  
    # POST /reservas
    # POST /reservas.json
    def create
      @reserva = Reserva.new(params[:reserva])
      @reserva.Cliente = current_cliente

      respond_to do |format|
        if @reserva.save
          format.html { redirect_to :action => "sucesso", notice: 'Reserva adicionada com sucesso.' }
          format.json { render json: @reserva, status: :created, location: @reserva }
        else
          format.html { redirect_to :action => "nova", notice: 'Reserva adicionada com sucesso.' }
          format.json { render json: @reserva.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def sucesso
    
    end
  
  end
