class UltimaConsultaController < ApplicationController
  before_action :set_ultima_consultum, only: [:show, :edit, :update, :destroy]

  # GET /ultima_consulta
  # GET /ultima_consulta.json
  def index
    @ultima_consulta = UltimaConsultum.all
  end

  # GET /ultima_consulta/1
  # GET /ultima_consulta/1.json
  def show
  end

  # GET /ultima_consulta/new
  def new
    @ultima_consultum = UltimaConsultum.new
  end

  # GET /ultima_consulta/1/edit
  def edit
  end

  # POST /ultima_consulta
  # POST /ultima_consulta.json
  def create
    @ultima_consultum = UltimaConsultum.new(ultima_consultum_params)

    respond_to do |format|
      if @ultima_consultum.save
        format.html { redirect_to @ultima_consultum, notice: 'Ultima consultum was successfully created.' }
        format.json { render :show, status: :created, location: @ultima_consultum }
      else
        format.html { render :new }
        format.json { render json: @ultima_consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ultima_consulta/1
  # PATCH/PUT /ultima_consulta/1.json
  def update
    respond_to do |format|
      if @ultima_consultum.update(ultima_consultum_params)
        format.html { redirect_to @ultima_consultum, notice: 'Ultima consultum was successfully updated.' }
        format.json { render :show, status: :ok, location: @ultima_consultum }
      else
        format.html { render :edit }
        format.json { render json: @ultima_consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ultima_consulta/1
  # DELETE /ultima_consulta/1.json
  def destroy
    @ultima_consultum.destroy
    respond_to do |format|
      format.html { redirect_to ultima_consulta_url, notice: 'Ultima consultum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ultima_consultum
      @ultima_consultum = UltimaConsultum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ultima_consultum_params
      params.require(:ultima_consultum).permit(:data_ultima_consulta)
    end
end
