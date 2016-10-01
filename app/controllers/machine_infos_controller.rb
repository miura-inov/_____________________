class MachineInfosController < ApplicationController
  before_action :set_machine_info, only: [:show, :edit, :update, :destroy]

  # GET /machine_infos
  # GET /machine_infos.json
  def index
    @machine_infos = MachineInfo.all
  end

  # GET /machine_infos/1
  # GET /machine_infos/1.json
  def show
  end

  # GET /machine_infos/new
  def new
    @machine_info = MachineInfo.new
  end

  # GET /machine_infos/1/edit
  def edit
  end

  # POST /machine_infos
  # POST /machine_infos.json
  def create
    @machine_info = MachineInfo.new(machine_info_params)

    respond_to do |format|
      if @machine_info.save
        format.html { redirect_to @machine_info, notice: 'Machine info was successfully created.' }
        format.json { render :show, status: :created, location: @machine_info }
      else
        format.html { render :new }
        format.json { render json: @machine_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_infos/1
  # PATCH/PUT /machine_infos/1.json
  def update
    respond_to do |format|
      if @machine_info.update(machine_info_params)
        format.html { redirect_to @machine_info, notice: 'Machine info was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_info }
      else
        format.html { render :edit }
        format.json { render json: @machine_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_infos/1
  # DELETE /machine_infos/1.json
  def destroy
    @machine_info.destroy
    respond_to do |format|
      format.html { redirect_to machine_infos_url, notice: 'Machine info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_info
      @machine_info = MachineInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_info_params
      params.require(:machine_info).permit(:name)
    end
end
