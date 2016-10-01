class MachineInfoTypesController < ApplicationController
  before_action :set_machine_info_type, only: [:show, :edit, :update, :destroy]

  # GET /machine_info_types
  # GET /machine_info_types.json
  def index
    @machine_info_types = MachineInfoType.all
  end

  # GET /machine_info_types/1
  # GET /machine_info_types/1.json
  def show
  end

  # GET /machine_info_types/new
  def new
    @machine_info_type = MachineInfoType.new
  end

  # GET /machine_info_types/1/edit
  def edit
  end

  # POST /machine_info_types
  # POST /machine_info_types.json
  def create
    @machine_info_type = MachineInfoType.new(machine_info_type_params)

    respond_to do |format|
      if @machine_info_type.save
        format.html { redirect_to @machine_info_type, notice: 'Machine info type was successfully created.' }
        format.json { render :show, status: :created, location: @machine_info_type }
      else
        format.html { render :new }
        format.json { render json: @machine_info_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_info_types/1
  # PATCH/PUT /machine_info_types/1.json
  def update
    respond_to do |format|
      if @machine_info_type.update(machine_info_type_params)
        format.html { redirect_to @machine_info_type, notice: 'Machine info type was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_info_type }
      else
        format.html { render :edit }
        format.json { render json: @machine_info_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_info_types/1
  # DELETE /machine_info_types/1.json
  def destroy
    @machine_info_type.destroy
    respond_to do |format|
      format.html { redirect_to machine_info_types_url, notice: 'Machine info type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_info_type
      @machine_info_type = MachineInfoType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_info_type_params
      params.require(:machine_info_type).permit(:name)
    end
end
