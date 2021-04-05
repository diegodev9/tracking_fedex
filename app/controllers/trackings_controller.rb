class TrackingsController < ApplicationController
  protect_from_forgery
  before_action :set_tracking, only: %i[ show edit update destroy ]
  before_action :set_fedex, only: [:consulta, :index]

  def consulta
  end

  # GET /trackings or /trackings.json
  def index
    @trackings = Tracking.all

    if params[:buscar_guia].present?
      tracking_this = Tracking.find_by guia: params[:buscar_guia] #busca el numero de guia dentro de TRACKING
      results = @fedex.track(tracking_number: params[:buscar_guia]) #busca el paquete en la api de fedex

      if results.last.tracking_number.present? #verifica si hay un ultimo seguimiento
        tracking_info = results.last
        tracking = Tracking.new
        tracking.nombre = tracking_info.signature_name
        tracking.estado = tracking_info.status
        tracking.desde = results.second.events.first.city + ", " + results.second.events.first.state + " " + results.second.events.first.country
        tracking.hasta = results.last.events.first.city + ", " + results.last.events.first.state + " " + results.last.events.first.country
        tracking.description = results.last.events.first.description
        if tracking_this.present? #con esto me aseguro de que grabe en la base de datos local la ultima actualizacion del seguimiento
          tracking.save
        else
          tracking.guia = tracking_info.tracking_number #si la guia no existe en la base de datos local, la guarda
          tracking.save
        end
      end
    end

    @numero = 0

  rescue
    render 'error'
  end

  def error
  end

  # GET /trackings/1 or /trackings/1.json
  def show
  end

  # GET /trackings/new
  def new
    @tracking = Tracking.new
  end

  # GET /trackings/1/edit
  def edit
  end

  # POST /trackings or /trackings.json
  def create
    @tracking = Tracking.new(tracking_params)

    respond_to do |format|
      if @tracking.save
        format.html { redirect_to @tracking, notice: "Tracking was successfully created." }
        format.json { render :show, status: :created, location: @tracking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackings/1 or /trackings/1.json
  def update
    respond_to do |format|
      if @tracking.update(tracking_params)
        format.html { redirect_to @tracking, notice: "Tracking was successfully updated." }
        format.json { render :show, status: :ok, location: @tracking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackings/1 or /trackings/1.json
  def destroy
    @tracking.destroy
    respond_to do |format|
      format.html { redirect_to trackings_url, notice: "Tracking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tracking
    @tracking = Tracking.find(params[:id])
  end

  def set_fedex
    @fedex = Fedex::Shipment.new(
        key: "#{ENV["fedex_test_key"]}", #reemplazar con la key que corresponda
        password: "#{ENV["fedex_test_password"]}", #reemplazar con el password que corresponda
        account_number: "#{ENV["fedex_test_account"]}", #reemplazar con la cuenta que corresponda
        meter: '100495015',
        mode: "#{ENV["fedex_test_mode"]}"
    )
  end

  # Only allow a list of trusted parameters through.
  def tracking_params
    params.require(:tracking).permit(:nombre, :guia, :estado, :desde, :hasta, :description)
  end
end
