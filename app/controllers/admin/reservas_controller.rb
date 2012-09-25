class Admin::ReservasController < Admin::ApplicationController
  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.find(:all, :include => :Checkout, :conditions => { :checkouts => {:id => nil}} )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservas }
    end
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/new
  # GET /reservas/new.json
  def new
    @reserva = Reserva.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reserva }
    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
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

  # PUT /reservas/1
  # PUT /reservas/1.json
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to [:admin, @reserva], notice: 'Reserva atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to admin_reservas_url }
      format.json { head :no_content }
    end
  end


  # GET /reservas/1/checkout
  def checkout
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      format.html # checkout.html.erb
    end
  end

  # PUT /reservas/1/checkout_save
  def checkout_save

    @reserva = Reserva.find(params[:id])
    @reserva.Checkout = Checkout.new(params[:checkout])
    consumos = []
    params[:consumo].each do |v,c|
      consumos.push Consumo.new(c)
    end
    @reserva.Checkout.Consumo = consumos

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to [:admin, @reserva.Checkout], notice: 'Checkout was successfully created.' }
        format.json { render json: @reserva.Checkout, status: :created, location: @reserva.Checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @reserva.Checkout.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
