class EventosController < ApplicationController
  PER_PAGE = 10

  before_filter :check_logged
  before_action :set_evento, only: [:show, :edit, :update, :destroy]


  def pesquisa

    @data_inicial = params[:inicio].to_s.split("/")
    @data_final =params[:fim].to_s.split("/")
    @inicio = params[:inicio]
    @fim = params[:fim]

    @di = @data_inicial[0]
    @mi = @data_inicial[1]
    @ai = @data_inicial[2]
    @df = @data_final[0]
    @mf = @data_final[1]
    @af = @data_final[2]

    @difb = @ai.to_s + "-" + @mi.to_s  + "-" + @di.to_s + " 00:00:00"
    @dffb = @af.to_s + "-" + @mf.to_s + "-" + @df.to_s + " 23:59:59"

    @resultado = Evento.where('created_at between ? and ?', @difb, @dffb)



    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
               :show_as_html => params.key('debug'),
               footer: { center: '[page]/[topage]'  }
      end
    end
  end

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all.page(params[:page]).per(PER_PAGE)
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento criado com sucesso.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:sintoma)
    end
end
