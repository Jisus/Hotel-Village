class Admin::FlagsController < Admin::ApplicationController
  # GET /fags
  # GET /fags.json
  def index
    @pesquisa = params[:q]
    @flags = Flag.search(@pesquisa)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flags }
    end
  end

  # GET /fags/1
  # GET /fags/1.json
  def show
    @flag = Flag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flag }
    end
  end

  # GET /fags/new
  # GET /fags/new.json
  def new
    @flag = Flag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flag }
    end
  end

  # GET /fags/1/edit
  def edit
    @flag = Flag.find(params[:id])
  end

  # POST /fags
  # POST /fags.json
  def create
    @flag = Flag.new(params[:flag])

    respond_to do |format|
      if @flag.save
        format.html { redirect_to [:admin,@flag], notice: 'Flag was successfully created.' }
        format.json { render json: @flag, status: :created, location: @flag }
      else
        format.html { render action: "new" }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fags/1
  # PUT /fags/1.json
  def update
    @flag = Flag.find(params[:id])

    respond_to do |format|
      if @flag.update_attributes(params[:flag])
        format.html { redirect_to [:admin,@flag], notice: 'Flag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fags/1
  # DELETE /fags/1.json
  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy

    respond_to do |format|
      format.html { redirect_to [:admin,@flag] }
      format.json { head :no_content }
    end
  end
end
