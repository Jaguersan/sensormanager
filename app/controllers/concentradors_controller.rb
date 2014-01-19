class ConcentradorsController < ApplicationController
  before_action :set_concentrador, only: [:show, :edit, :update, :destroy, :sensores]

  # GET /concentradors
  # GET /concentradors.json
  def index
    @concentradors = Concentrador.all
  end

  # GET /concentradors/1
  # GET /concentradors/1.json
  def show
  end

  def sensores
  end

  def galeria
  end

  # GET /concentradors/new
  def new
    @concentrador = Concentrador.new
  end

  # GET /concentradors/1/edit
  def edit
  end

  # POST /concentradors
  # POST /concentradors.json
  def create
    @concentrador = Concentrador.new(concentrador_params)

    respond_to do |format|
      if @concentrador.save
        format.html { redirect_to @concentrador, notice: 'Concentrador was successfully created.' }
        format.json { render action: 'show', status: :created, location: @concentrador }
      else
        format.html { render action: 'new' }
        format.json { render json: @concentrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concentradors/1
  # PATCH/PUT /concentradors/1.json
  def update
    respond_to do |format|
      if @concentrador.update(concentrador_params)
        format.html { redirect_to @concentrador, notice: 'Concentrador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @concentrador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concentradors/1
  # DELETE /concentradors/1.json
  def destroy
    @concentrador.destroy
    respond_to do |format|
      format.html { redirect_to concentradors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concentrador
      @concentrador = Concentrador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concentrador_params
      params.require(:concentrador).permit(:categoria_equipo_id, :nombre, :descripcion, :estado, :gis_latitud, :gis_longitud, :mac_address, :numero_serie, :ip_address, :ip_port)
    end
end
