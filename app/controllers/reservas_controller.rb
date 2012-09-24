class ReservasController < ApplicationController

  # GET /reservas/new
  # GET /reservas/new.json
  def show
    @quartos = Quarto.all
    @quartos_livres = [];
    
    @quartos.each do |quarto|
      if !quarto.ocupado? params[:dataEntrada].to_datetime, params[:dataSaida].to_datetime
        @quartos_livres.push quarto
      end
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quartos }
    end
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(params[:reserva])

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to [:admin, @reserva], notice: 'Reserva adicionada com sucesso.' }
        format.json { render json: @reserva, status: :created, location: @reserva }
      else
        format.html { render action: "new" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
