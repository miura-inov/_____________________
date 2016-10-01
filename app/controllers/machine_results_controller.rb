class MachineResultsController < ApplicationController
  before_action :set_machine_result, only: [:show, :edit, :update, :destroy]

  # GET /machine_results
  # GET /machine_results.json
  def index
    @machine_results = MachineResult.all
  end

  # GET /machine_results/1
  # GET /machine_results/1.json
  def show
  end

  # GET /machine_results/new
  def new
    @machine_result = MachineResult.new
  end

  # GET /machine_results/1/edit
  def edit
  end

  # POST /machine_results
  # POST /machine_results.json
  def create
    @machine_result = MachineResult.new(machine_result_params)

    respond_to do |format|
      if @machine_result.save
        format.html { redirect_to @machine_result, notice: 'Machine result was successfully created.' }
        format.json { render :show, status: :created, location: @machine_result }
      else
        format.html { render :new }
        format.json { render json: @machine_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine_results/1
  # PATCH/PUT /machine_results/1.json
  def update
    respond_to do |format|
      if @machine_result.update(machine_result_params)
        format.html { redirect_to @machine_result, notice: 'Machine result was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine_result }
      else
        format.html { render :edit }
        format.json { render json: @machine_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machine_results/1
  # DELETE /machine_results/1.json
  def destroy
    @machine_result.destroy
    respond_to do |format|
      format.html { redirect_to machine_results_url, notice: 'Machine result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_result
      @machine_result = MachineResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_result_params
      params.require(:machine_result).permit(:name)
    end
end
