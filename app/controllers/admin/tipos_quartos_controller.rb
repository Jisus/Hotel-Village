class Admin::TiposQuartosController < Admin::ApplicationController
  # GET /tipos_quartos
  # GET /tipos_quartos.json
  def index
    @tipos_quartos = TiposQuarto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_quartos }
    end
  end

  # GET /tipos_quartos/1
  # GET /tipos_quartos/1.json
  def show
    @tipos_quarto = TiposQuarto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipos_quarto }
    end
  end

  # GET /tipos_quartos/new
  # GET /tipos_quartos/new.json
  def new
    @tipos_quarto = TiposQuarto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipos_quarto }
    end
  end

  # GET /tipos_quartos/1/edit
  def edit
    @tipos_quarto = TiposQuarto.find(params[:id])
  end

  # POST /tipos_quartos
  # POST /tipos_quartos.json
  def create
    @tipos_quarto = TiposQuarto.new(params[:tipos_quarto])

    respond_to do |format|
      if @tipos_quarto.save
        format.html { redirect_to [:admin, @tipos_quarto], notice: 'Tipo de quarto criado com sucesso!' }
        format.json { render json: @tipos_quarto, status: :created, location: @tipos_quarto }
      else
        format.html { render action: "new" }
        format.json { render json: @tipos_quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_quartos/1
  # PUT /tipos_quartos/1.json
  def update
    @tipos_quarto = TiposQuarto.find(params[:id])

    respond_to do |format|
      if @tipos_quarto.update_attributes(params[:tipos_quarto])
        format.html { redirect_to [:admin, @tipos_quarto], notice: 'Tipo de quarto atualizado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipos_quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_quartos/1
  # DELETE /tipos_quartos/1.json
  def destroy
    @tipos_quarto = TiposQuarto.find(params[:id])

    respond_to do |format|
      if @tipos_quarto.destroy
        format.html { redirect_to [:admin, @tipos_quarto] }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { head :no_content }
      end
    end
  end
end
